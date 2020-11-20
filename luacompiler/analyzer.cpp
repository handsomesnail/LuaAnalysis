﻿
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
static bool CheckAvailable(shared_ptr<MetaRegistry> _env, list<string> temp_table_list);
static string ConcatListString(list<string> table_list);

EXPORT int CALL Test(const char* name, const char* luatext)
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

	//start Proto
	Proto* f = toproto(L, -1);
	const Instruction* code = f->code;
	const char* source_name = GetSourceName(f);
	list<string> temp_table_list;
	int register_index = -1;
	int decl_pc = -1;

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
				bool result = CheckAvailable(_ENV, temp_table_list);
				if (!result)
				{
					//⚠⚠string.c_str() char buffer and string hold same life
					Printf("<%s:%d> unresolved external symbol \"%s\".\n", source_name, f->lineinfo[decl_pc], ConcatListString(temp_table_list).c_str());
				}
				register_index = -1;
				decl_pc = -1;
				temp_table_list.clear();
			}
		}

		if (op == OP_GETTABUP && strcmp(GetUpvalueName(f->upvalues[b]), LUA_ENV)==0)
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

	}

	//end

	lua_close(L);
	return 0;
}

EXPORT RefData* CALL Execute(const char* luatext)
{
	return NULL;
}

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

static bool CheckAvailable(shared_ptr<MetaRegistry> _env, list<string> table_list)
{
	MetaRegistry* cur_reg = _env.get();
	for (auto iter = table_list.begin(); iter != table_list.end(); iter++)
	{
		cur_reg = cur_reg->GetRegistry(iter->c_str());
		if (cur_reg == NULL)
		{
			break;
		}
	}
	return cur_reg != NULL;
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