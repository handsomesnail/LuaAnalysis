
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
	Compile(luatext);
	return 100;
}

EXPORT RefData* CALL Execute(const char* luatext)
{
	return NULL;
}