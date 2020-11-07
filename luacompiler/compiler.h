#ifndef compiler_h
#define compiler_h

#include "lobject.h"

typedef struct RefData {
	char* refStr;
	int line;
} RefData;

Proto* Compile(const char* luatext);

#endif
