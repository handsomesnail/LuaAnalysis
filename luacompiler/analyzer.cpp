
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
static int CheckSymbolAvailable(shared_ptr<MetaRegistry> _env, list<string> table_list, int decl_pc, extern_chk_func extern_stchk, extern_chk_func extern_inschk);
static int CheckSymbolInReg(shared_ptr<MetaRegistry> target_reg, list<string> table_list, int decl_pc);
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

static void AddReg(shared_ptr<MetaRegistry> _env, list<string> table_list, pair<int, int> life_cycle = MetaRegistry::max_life_cycle)
{
	MetaRegistry* cur_reg = _env.get();
	for (auto iter = table_list.begin(); iter != table_list.end(); iter++)
	{
		cur_reg = cur_reg->AddRegistry(*iter);
		cur_reg->SetLifeCycle(life_cycle);
	}
}

static bool DefuseProto(Proto* f, shared_ptr<MetaRegistry> _env, extern_chk_func extern_stchk, extern_chk_func extern_inschk) {
	bool result = true;
	const Instruction* code = f->code;
	bool isRootProto = f->linedefined == 0;
	const char* source_name = GetSourceName(f);
	list<string> temp_table_list;
	int register_index = -1;
	int decl_pc = -1;
	shared_ptr<MetaRegistry> _TEMP(new MetaRegistry(LUA_G, LUA_TTABLE)); //only used in single proto

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
		bool ignore_check_flag = false;
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
			else if (op == OP_EQ) {
				int k_index = -1;
				if (register_index == b && ISK(c)) {
					k_index = INDEXK(c);
				}
				else if (register_index == c && ISK(b)) {
					k_index = INDEXK(b);
				}
				bool case_equal = false;
				if (k_index != -1) {
					ignore_check_flag = true;
					if (ttype(&f->k[k_index]) == LUA_TNIL) {
						case_equal = true;
					}
				}
				if (case_equal && pc+1 < f->sizecode) {
					Instruction next_i = code[pc + 1];
					OpCode next_op = GET_OPCODE(next_i);
					if (next_op == OP_JMP) {
						int next_sbx = GETARG_sBx(next_i);
						if (a == 1) { // !=nil
							int life = next_sbx;
							MetaRegistry* cur_reg = _TEMP->AddRegistry(*temp_table_list.begin(), LUA_TUSER);
							cur_reg->SetLifeCycle(pair<int, int>(pc, pc + 1 + life));
						}
						else if (a == 0) { //==nil
							Instruction next_jump_i = code[pc+1+next_sbx];
							OpCode next_jump_op = GET_OPCODE(next_jump_i);
							if (next_jump_op == OP_JMP) {
								int next_jump_sbx = GETARG_sBx(next_jump_i);
								int life = next_jump_sbx;
								MetaRegistry* cur_reg = _TEMP->AddRegistry(*temp_table_list.begin(), LUA_TUSER);
								cur_reg->SetLifeCycle(pair<int, int>(pc + 1 + next_sbx, pc + 1 + next_sbx+ next_jump_sbx));
							}
						}
					}
				}
			}

			if (!append_key.empty())
			{
				temp_table_list.push_back(append_key);
			}
			else
			{
				string symbol = ConcatListString(temp_table_list);
				if (!ignore_check_flag && CheckSymbolInReg(_TEMP, temp_table_list, decl_pc)!=0 && CheckSymbolAvailable(_env, temp_table_list, decl_pc, extern_stchk, extern_inschk)!=0)
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
						if(isRootProto)
							_env->AddRegistry(s, LUA_TFUNCTION);
						else _TEMP->AddRegistry(s, LUA_TFUNCTION);
					}
					else {
						if(isRootProto)
							_env->AddRegistry(s, LUA_TUSER);
						else _TEMP->AddRegistry(s, LUA_TUSER);
						OutputFunc(LOG_LEVEL_WARNING, "<%s:%d> defined global symbol \"%s\".\n", source_name, f->lineinfo[pc], s);
						result = false;
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

static int CheckSymbolAvailable(shared_ptr<MetaRegistry> _env, list<string> table_list, int decl_pc, extern_chk_func extern_stchk, extern_chk_func extern_inschk)
{
	int result = 0;
	string begin = *(table_list.begin());
	//ignore instance 
	if (begin == LUA_SELF)
	{
		return 0;
	}
	else
	{
		result = CheckSymbolInReg(_env, table_list, decl_pc);

		//check inject instance
		if (result != 0 && extern_inschk != NULL)
		{
			int extern_chk_result = extern_inschk(ConcatListString(table_list).c_str());
			if (extern_chk_result == 0)
			{
				AddReg(_env, table_list);
				result = 0;
			}
		}

		//check c# reference
		if (result != 0 && begin == CS_ENV && extern_stchk !=NULL)
		{
			list<string> cs_table_list = table_list;
			cs_table_list.erase(cs_table_list.begin()); //delete first node
			int extern_chk_result = extern_stchk(ConcatListString(cs_table_list).c_str());
			if (extern_chk_result == 0)
			{
				AddReg(_env, table_list);
				result = 0;
			}
		}

		return result;
	}

}

static int CheckSymbolInReg(shared_ptr<MetaRegistry> target_reg, list<string> table_list, int decl_pc)
{
	MetaRegistry* cur_reg = target_reg.get();
	for (auto iter = table_list.begin(); iter != table_list.end(); iter++)
	{
		cur_reg = cur_reg->GetRegistry(*iter);
		if (cur_reg == NULL)
		{
			return -1;
		}
		if (cur_reg != NULL && !cur_reg->IsInLifeCycle(decl_pc))
		{
			return -1;
		}
		if (cur_reg != NULL && cur_reg->GetType() == LUA_TUSER)
		{
			return 0;
		}
	}
	return 0;
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