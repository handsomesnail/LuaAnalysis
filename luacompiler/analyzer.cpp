
#ifdef __cplusplus
extern "C"
{
#endif
	#include "adapter.h"
	#include "compiler.h"
#ifdef __cplusplus
}
#endif

EXPORT int CALL Test(const char* luatext)
{
	lua_State* L = NULL;
	Proto* proto = Compile(luatext, L);
	Printf("sizecode: %d\n", proto->sizecode);
	//分析Proto* 结构
	if (L != NULL)
	{
		lua_close(L);
	}
	return 0;
}

EXPORT RefData* CALL Execute(const char* luatext)
{
	return NULL;
}