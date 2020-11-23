
#ifdef __cplusplus
extern "C"
{
#endif
	#include "lprefix.h"

	#include <ctype.h>
	#include <errno.h>
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>

	#include "lobject.h"
	#include "lstate.h"
	#include "lundump.h"
	#include "lua.h"
	#include "lauxlib.h"
	#include "lopcodes.h"
	#include "llex.h"
	#include "lualib.h"


	#include "adapter.h"
	#include "compiler.h"
#ifdef __cplusplus
}
#endif

#include "analyzer.h"

#ifdef __cplusplus

#include <string>
#include <memory>
#include <list>
#include "MetaRegistry.h"

using namespace std;
using namespace luacompiler;

#endif


#define toproto(L,i) getproto(L->top+(i))

static void ImportReg(shared_ptr<MetaRegistry> _env, const luaL_ExportReg* reg);
static bool DefuseProto(Proto* f, shared_ptr<MetaRegistry> _env, extern_chk_func extern_stchk, extern_chk_func extern_inschk);
static int CheckSymbolAvailable(shared_ptr<MetaRegistry> _env, list<string> table_list, extern_chk_func extern_stchk, extern_chk_func extern_inschk);
static string ConcatListString(list<string> table_list);

EXPORT int CALL Execute(const char* name, const char* luatext, extern_chk_func extern_stchk, extern_chk_func extern_inschk)
{
	lua_State* L = Compile(name, luatext);
	if (L == NULL)
	{
		return -1;
	}

	//load libs
	shared_ptr<MetaRegistry> _ENV( new MetaRegistry(LUA_G, LUA_TTABLE));
	const luaL_ExportReg* exprot_regs = get_exportLibs();
	for (const luaL_ExportReg* reg = exprot_regs; !(reg->name==NULL && reg->func==NULL); reg++) {
		ImportReg(_ENV, reg);
	}

	//recursive defuse proto
	Proto* f = toproto(L, -1);
	bool result = DefuseProto(f, _ENV, extern_stchk, extern_inschk);

	lua_close(L);

	if (result)
	{
		OutputFunc(LOG_LEVEL_MESSAGE, "check passed");
		return 0;
	}
	else return -1;
}

//EXPORT RefData* CALL Execute(const char* luatext)
//{
//	return NULL;
//}

static void ImportReg(shared_ptr<MetaRegistry> _env, const luaL_ExportReg* reg)
{
	MetaRegistry* meta_registry = _env->AddRegistry(reg->name, LUA_TTABLE);
	//Printf("------%s(%d)------\n", reg->name, LUA_TTABLE);
	const luaL_Reg* lib;
	for (lib = reg->func(); !(lib->name==NULL && lib->func==NULL); lib++) {
		int type = LUA_TNONE;
		if (reg->type == EXPORT_REG_FUNCTION)
		{
			if (lib->func != NULL)
				type = LUA_TFUNCTION;
			else type = LUA_TNONE; //field placeholders
		}
		if (lib->name != NULL) {
			meta_registry->AddRegistry(lib->name, type);
		}
		//Printf("%s(%d)\n", lib->name, type);
	}
}

static void AddReg(shared_ptr<MetaRegistry> _env, list<string> table_list)
{
	MetaRegistry* cur_reg = _env.get();
	for (auto iter = table_list.begin(); iter != table_list.end(); iter++)
	{
		cur_reg = cur_reg->AddRegistry(*iter);
	}
}

static bool DefuseProto(Proto* f, shared_ptr<MetaRegistry> _env, extern_chk_func extern_stchk, extern_chk_func extern_inschk) {
	bool result = true;
	const Instruction* code = f->code;
	const char* source_name = GetSourceName(f);
	list<string> temp_table_list;
	int register_index = -1;
	int decl_pc = -1;

	//self
	for (int pc = 0; pc < f->sizecode; pc++) {
		Instruction i = code[pc];
		OpCode op = GET_OPCODE(i);
		int a = GETARG_A(i);
		int b = GETARG_B(i);
		int c = GETARG_C(i);
		int ax = GETARG_Ax(i);
		int bx = GETARG_Bx(i);
		int sbx = GETARG_sBx(i);
		if (register_index != -1)
		{
			string append_key;
			if (op == OP_GETTABLE && a == register_index && b == register_index)
			{
				if (ISK(c))
				{
					const TValue* o = &f->k[INDEXK(c)];
					if (ttype(o) == LUA_TSHRSTR || ttype(o) == LUA_TLNGSTR) {
						const char* s = getstr(tsvalue(o));
						append_key = s;
					}
				}
			}
			if (!append_key.empty())
			{
				temp_table_list.push_back(append_key);
			}
			else
			{
				if (CheckSymbolAvailable(_env, temp_table_list, extern_stchk, extern_inschk)!=0)
				{
					//⚠⚠string.c_str() char buffer and string hold same life
					OutputFunc(LOG_LEVEL_WARNING, "<%s:%d> unresolved external symbol \"%s\".\n", source_name, f->lineinfo[decl_pc], ConcatListString(temp_table_list).c_str());
					result = false;
				}
				register_index = -1;
				decl_pc = -1;
				temp_table_list.clear();
			}
		}

		if (op == OP_GETTABUP && strcmp(GetUpvalueName(f->upvalues[b]), LUA_ENV) == 0)
		{
			if (ISK(c))
			{
				const TValue* o = &f->k[INDEXK(c)];
				if (ttype(o) == LUA_TSHRSTR || ttype(o) == LUA_TLNGSTR) {
					register_index = a;
					decl_pc = pc;
					temp_table_list.clear();
					const char* s = getstr(tsvalue(o));
					temp_table_list.push_back(s);
				}
			}
		}

		if (op == OP_SETTABUP && strcmp(GetUpvalueName(f->upvalues[a]), LUA_ENV) == 0)
		{
			if (ISK(b))
			{
				const TValue* o = &f->k[INDEXK(b)];
				if (ttype(o) == LUA_TSHRSTR || ttype(o) == LUA_TLNGSTR) {
					const char* s = getstr(tsvalue(o));
					if (pc > 0 && GET_OPCODE(code[pc - 1]) == OP_CLOSURE) {
						_env->AddRegistry(s, LUA_TFUNCTION);
					}
					else {
						_env->AddRegistry(s, LUA_TUSER);
						OutputFunc(LOG_LEVEL_WARNING, "<%s:%d> defined global symbol \"%s\".\n", source_name, f->lineinfo[pc], s);
					}
				}
			}
		}

	}

	//child
	for (int i = 0; i < f->sizep; i++)
	{
		if (!DefuseProto(f->p[i], _env, extern_stchk, extern_inschk)) {
			result = false;
		}
	}

	return result;
}

static int CheckSymbolAvailable(shared_ptr<MetaRegistry> _env, list<string> table_list, extern_chk_func extern_stchk, extern_chk_func extern_inschk)
{
	MetaRegistry* cur_reg = _env.get();
	string begin = *(table_list.begin());
	//ignore instance 
	if (begin == LUA_SELF)
	{
		return 0;
	}
	else
	{
		for (auto iter = table_list.begin(); iter != table_list.end(); iter++)
		{
			cur_reg = cur_reg->GetRegistry(*iter);
			if (cur_reg == NULL)
			{
				break;
			}
			if (cur_reg != NULL && cur_reg->GetType() == LUA_TUSER)
			{
				return 0;
			}
		}

		//check inject instance
		if (cur_reg == NULL && extern_inschk != NULL)
		{
			int extern_chk_result = extern_inschk(ConcatListString(table_list).c_str());
			if (extern_chk_result == 0)
			{
				AddReg(_env, table_list);
				return 0;
			}
		}

		//check c# reference
		if (cur_reg == NULL && begin == CS_ENV && extern_stchk !=NULL)
		{
			list<string> cs_table_list = table_list;
			cs_table_list.erase(cs_table_list.begin()); //delete first node
			int extern_chk_result = extern_stchk(ConcatListString(cs_table_list).c_str());
			if (extern_chk_result == 0)
			{
				AddReg(_env, table_list);
				return 0;
			}
		}

		if (cur_reg != NULL)
		{
			return 0;
		}
		else
		{
			return -1;
		}
	}

}

static string ConcatListString(list<string> table_list)
{
	string s = "";
	for (auto iter = table_list.begin(); iter != table_list.end(); iter++)
	{
		if (!s.empty())
		{
			s += '.';
		}
		s += *iter;
	}
	return s;
}