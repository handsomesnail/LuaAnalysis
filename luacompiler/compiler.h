#ifndef compiler_h
#define compiler_h

#include "lobject.h"

typedef struct RefData {
	char* refStr;
	int line;
} RefData;

lua_State* Compile(const char* name, const char* luatext);

#endif
