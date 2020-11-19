/*
** $Id: lualib.h,v 1.45.1.1 2017/04/19 17:20:42 roberto Exp $
** Lua standard libraries
** See Copyright Notice in lua.h
*/


#ifndef lualib_h
#define lualib_h

#include "lua.h"
#include "lauxlib.h"


/* version suffix for environment variable names */
#define LUA_VERSUFFIX          "_" LUA_VERSION_MAJOR "_" LUA_VERSION_MINOR


LUAMOD_API int (luaopen_base) (lua_State *L);
LUAMOD_API const luaL_Reg* luaexport_base_funcs();

#define LUA_COLIBNAME	"coroutine"
LUAMOD_API int (luaopen_coroutine) (lua_State *L);
LUAMOD_API const luaL_Reg* luaexport_co_funcs();

#define LUA_TABLIBNAME	"table"
LUAMOD_API int (luaopen_table) (lua_State *L);
LUAMOD_API const luaL_Reg* luaexport_tab_funcs();

#define LUA_IOLIBNAME	"io"
LUAMOD_API int (luaopen_io) (lua_State *L);
LUAMOD_API const luaL_Reg* luaexport_io_funcs();
LUAMOD_API const luaL_Reg* luaexport_io_fields();

#define LUA_OSLIBNAME	"os"
LUAMOD_API int (luaopen_os) (lua_State *L);
LUAMOD_API const luaL_Reg* luaexport_os_funcs();

#define LUA_STRLIBNAME	"string"
LUAMOD_API int (luaopen_string) (lua_State *L);
LUAMOD_API const luaL_Reg* luaexport_string_funcs();

#define LUA_UTF8LIBNAME	"utf8"
LUAMOD_API int (luaopen_utf8) (lua_State *L);
LUAMOD_API const luaL_Reg* luaexport_utf8_funcs();

#define LUA_BITLIBNAME	"bit32"
LUAMOD_API int (luaopen_bit32) (lua_State *L);

#define LUA_MATHLIBNAME	"math"
LUAMOD_API int (luaopen_math) (lua_State *L);
LUAMOD_API const luaL_Reg* luaexport_math_funcs();

#define LUA_DBLIBNAME	"debug"
LUAMOD_API int (luaopen_debug) (lua_State *L);
LUAMOD_API const luaL_Reg* luaexport_debug_funcs();

#define LUA_LOADLIBNAME	"package"
LUAMOD_API int (luaopen_package) (lua_State *L);
LUAMOD_API const luaL_Reg* luaexport_pk_funcs();
LUAMOD_API const luaL_Reg* luaexport_ll_funcs();



/* open all previous libraries */
LUALIB_API void (luaL_openlibs) (lua_State *L);

/* get exported reg from all previous libraries */
LUALIB_API const luaL_ExportReg* get_exportLibs();


#if !defined(lua_assert)
#define lua_assert(x)	((void)0)
#endif


#endif
