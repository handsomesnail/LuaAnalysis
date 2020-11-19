
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

static int IsTargetCode(Instruction i);
static void ImportReg(shared_ptr<MetaRegistry> _env, const luaL_ExportReg* reg);
static bool CheckByLuaLibs(shared_ptr<MetaRegistry> _env, list<string>* temp_table_list);

EXPORT int CALL Test(const char* name, const char* luatext)
{
	lua_State* L = Compile(name, luatext);
	if (L == NULL)
	{
		return -1;
	}
	
	shared_ptr<MetaRegistry> _ENV( new MetaRegistry(LUA_G, LUA_TTABLE));
	const luaL_ExportReg* exprot_regs = get_exportLibs();
	for (const luaL_ExportReg* reg = exprot_regs; !(reg->name==NULL && reg->func==NULL); reg++) {
		ImportReg(_ENV, reg);
	}
	//start Proto
	Proto* f = toproto(L, -1);
	const Instruction* code = f->code;
	list<string> temp_table_list;
	CheckByLuaLibs(_ENV, &temp_table_list);
	//LUA_ENV
	for (int pc = 0; pc < f->sizecode; pc++) {
		Instruction i = code[pc];
		int b = IsTargetCode(i);
		if (b != 0) {
			const TValue* o = &f->k[INDEXK(b)];
			if (ttype(o) == LUA_TSHRSTR || ttype(o) == LUA_TLNGSTR) {
				const char* s = getstr(tsvalue(o));
				Printf("RESULT: %s \n", s);
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

static int IsTargetCode(Instruction i) {
	OpCode o = GET_OPCODE(i);
	int a = GETARG_A(i);
	int b = GETARG_B(i);
	int c = GETARG_C(i);
	int ax = GETARG_Ax(i);
	int bx = GETARG_Bx(i);
	int sbx = GETARG_sBx(i);
	if (o == OP_SETTABUP && a == 0 && ISK(b)) {
		return b;
	}
	else {
		return 0;
	}
}

static void ImportReg(shared_ptr<MetaRegistry> _env, const luaL_ExportReg* reg)
{
	MetaRegistry* meta_registry = _env->AddRegistry(reg->name, LUA_TTABLE);
	Printf("------%s(%d)------\n", reg->name, LUA_TTABLE);
	const luaL_Reg* lib;
	for (lib = reg->func(); !(lib->name==NULL && lib->func==NULL); lib++) {
		int type = LUA_TNONE;
		if (reg->type == EXPORT_REG_FUNCTION)
		{
			if (lib->func != NULL)
				type = LUA_TFUNCTION;
			else type = LUA_TNONE; //field placeholders
		}
		meta_registry->AddRegistry(lib->name, type);
		//Printf("%s(%d)\n", lib->name, type);
	}
}

static bool CheckByLuaLibs(shared_ptr<MetaRegistry> _env, list<string>* temp_table_list)
{
	return true;
}