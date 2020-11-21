#ifndef analyzer_h
#define analyzer_h

#ifdef __cplusplus
extern "C"
{
#endif
	#include "adapter.h"
#ifdef __cplusplus
}
#endif

#define LUA_G "_G"
#define CS_ENV "CS"
#define LUA_SELF "self"

typedef struct RefData {
	char* refStr;
	int line;
} RefData;

typedef int (CALL* extern_chk_func)(const char*);

EXPORT int CALL Execute(const char* name, const char* luatext, extern_chk_func extern_chk, extern_chk_func extern_inschk);

//EXPORT RefData* CALL Execute(const char* luatext);

#endif
