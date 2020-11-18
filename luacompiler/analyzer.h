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

typedef struct RefData {
	char* refStr;
	int line;
} RefData;

EXPORT int CALL Test(const char* name, const char* luatext);

EXPORT RefData* CALL Execute(const char* luatext);

#endif
