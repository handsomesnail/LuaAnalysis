/*
** $Id: linit.c,v 1.39.1.1 2017/04/19 17:20:42 roberto Exp $
** Initialization of libraries for lua.c and other clients
** See Copyright Notice in lua.h
*/


#define linit_c
#define LUA_LIB

/*
** If you embed Lua in your program and need to open the standard
** libraries, call luaL_openlibs in your program. If you need a
** different set of libraries, copy this file to your project and edit
** it to suit your needs.
**
** You can also *preload* libraries, so that a later 'require' can
** open the library, which is already linked to the application.
** For that, do the following code:
**
**  luaL_getsubtable(L, LUA_REGISTRYINDEX, LUA_PRELOAD_TABLE);
**  lua_pushcfunction(L, luaopen_modname);
**  lua_setfield(L, -2, modname);
**  lua_pop(L, 1);  // remove PRELOAD table
*/

#include "lprefix.h"


#include <stddef.h>

#include "lua.h"

#include "lualib.h"
#include "lauxlib.h"


/*
** these libs are loaded by lua.c and are readily available to any Lua
** program
*/
static const luaL_Reg loadedlibs[] = {
  {"_G", luaopen_base},
  {LUA_LOADLIBNAME, luaopen_package},
  {LUA_COLIBNAME, luaopen_coroutine},
  {LUA_TABLIBNAME, luaopen_table},
  {LUA_IOLIBNAME, luaopen_io},
  {LUA_OSLIBNAME, luaopen_os},
  {LUA_STRLIBNAME, luaopen_string},
  {LUA_MATHLIBNAME, luaopen_math},
  {LUA_UTF8LIBNAME, luaopen_utf8},
  {LUA_DBLIBNAME, luaopen_debug},
#if defined(LUA_COMPAT_BITLIB)
  {LUA_BITLIBNAME, luaopen_bit32},
#endif
  {NULL, NULL}
};

static const luaL_ExportReg exportedlibs[] =
{
    {"_G", luaexport_base_funcs, EXPORT_REG_FUNCTION},
    {"_G", luaexport_ll_funcs, EXPORT_REG_FUNCTION},
    {LUA_LOADLIBNAME, luaexport_pk_funcs, EXPORT_REG_FUNCTION},
    {LUA_COLIBNAME, luaexport_co_funcs, EXPORT_REG_FUNCTION},
    {LUA_TABLIBNAME, luaexport_tab_funcs, EXPORT_REG_FUNCTION},
    {LUA_IOLIBNAME, luaexport_io_funcs, EXPORT_REG_FUNCTION},
    {LUA_IOLIBNAME, luaexport_io_fields, EXPORT_REG_FIELD},
    {LUA_OSLIBNAME, luaexport_os_funcs, EXPORT_REG_FUNCTION},
    {LUA_STRLIBNAME, luaexport_string_funcs, EXPORT_REG_FUNCTION},
    {LUA_MATHLIBNAME, luaexport_math_funcs, EXPORT_REG_FUNCTION},
    {LUA_UTF8LIBNAME, luaexport_utf8_funcs, EXPORT_REG_FUNCTION},
    {LUA_DBLIBNAME, luaexport_debug_funcs, EXPORT_REG_FUNCTION},
    /* bit32 has been cancelled in 5.3 */
    {NULL, NULL, EXPORT_REG_UNKNOWN},
};


LUALIB_API void luaL_openlibs (lua_State *L) {
  const luaL_Reg *lib;
  /* "require" functions from 'loadedlibs' and set results to global table */
  for (lib = loadedlibs; lib->func; lib++) {
    luaL_requiref(L, lib->name, lib->func, 1);
    lua_pop(L, 1);  /* remove lib */
  }
}

LUALIB_API const luaL_ExportReg* get_exportLibs()
{
    return exportedlibs;
}

