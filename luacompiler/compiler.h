#ifndef compiler_h
#define compiler_h

#include "lobject.h"

extern lua_State* Compile(const char* name, const char* luatext);

#endif
