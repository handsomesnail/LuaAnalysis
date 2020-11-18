
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

	#include "adapter.h"
	#include "compiler.h"
#ifdef __cplusplus
}
#endif

#include "analyzer.h"

#ifdef __cplusplus

#include <string>
#include <list>
#include "MetaRegistry.h"

using namespace std;
using namespace luacompiler;

#endif


#define toproto(L,i) getproto(L->top+(i))

static int IsTargetCode(Instruction i);

EXPORT int CALL Test(const char* name, const char* luatext)
{
	lua_State* L = Compile(name, luatext);
	if (L == NULL)
	{
		return -1;
	}
	
	Proto* f = toproto(L, -1);
	
	MetaRegistry* _ENV = new MetaRegistry();
	_ENV->AddRegistry("aaa");
	if (_ENV->HasRegistry("aaa")) {
		PrintLine("Has aaa");
	}
	MetaRegistry* test = _ENV->GetRegistry("bbb");
	if (test == NULL) {
		PrintLine("Is NULL");
	}

	//start Proto
	const Instruction* code = f->code;

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

	delete(_ENV);
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