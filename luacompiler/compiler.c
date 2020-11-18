/*
** $Id: luac.c,v 1.76 2018/06/19 01:32:02 lhf Exp $
** Lua compiler (saves bytecodes to files; also lists bytecodes)
** See Copyright Notice in lua.h
*/

#define luac_c
#define LUA_CORE

#include "lprefix.h"

#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "lua.h"
#include "lauxlib.h"

#include "lobject.h"
#include "lstate.h"
#include "lundump.h"

#include "compiler.h"
#include "adapter.h"

static void PrintFunction(const Proto* f, int full);
#define luaU_print	PrintFunction

#define PROGNAME	"luac"		/* default program name */
#define OUTPUT		PROGNAME ".out"	/* default output file */

static int listing = 0;			/* list bytecodes? */
static int dumping = 1;			/* dump bytecodes? */
static int stripping = 0;			/* strip debug information? */
static char Output[] = { OUTPUT };	/* default output file name */
static const char* output = Output;	/* actual output file name */
static const char* progname = PROGNAME;	/* actual program name */

static void fatal(const char* message)
{
    fprintf(stderr, "%s: %s\n", progname, message);
    exit(EXIT_FAILURE);
}

static void cannot(const char* what)
{
    fprintf(stderr, "%s: cannot %s %s: %s\n", progname, what, output, strerror(errno));
    exit(EXIT_FAILURE);
}

static void usage(const char* message)
{
    if (*message == '-')
        fprintf(stderr, "%s: unrecognized option '%s'\n", progname, message);
    else
        fprintf(stderr, "%s: %s\n", progname, message);
    fprintf(stderr,
        "usage: %s [options] [filenames]\n"
        "Available options are:\n"
        "  -l       list (use -l -l for full listing)\n"
        "  -o name  output to file 'name' (default is \"%s\")\n"
        "  -p       parse only\n"
        "  -s       strip debug information\n"
        "  -v       show version information\n"
        "  --       stop handling options\n"
        "  -        stop handling options and process stdin\n"
        , progname, Output);
    exit(EXIT_FAILURE);
}

#define IS(s)	(strcmp(argv[i],s)==0)

static int doargs(int argc, char* argv[])
{
    int i;
    int version = 0;
    if (argv[0] != NULL && *argv[0] != 0) progname = argv[0];
    for (i = 1; i < argc; i++)
    {
        if (*argv[i] != '-')			/* end of options; keep it */
            break;
        else if (IS("--"))			/* end of options; skip it */
        {
            ++i;
            if (version) ++version;
            break;
        }
        else if (IS("-"))			/* end of options; use stdin */
            break;
        else if (IS("-l"))			/* list */
            ++listing;
        else if (IS("-o"))			/* output file */
        {
            output = argv[++i];
            if (output == NULL || *output == 0 || (*output == '-' && output[1] != 0))
                usage("'-o' needs argument");
            if (IS("-")) output = NULL;
        }
        else if (IS("-p"))			/* parse only */
            dumping = 0;
        else if (IS("-s"))			/* strip debug information */
            stripping = 1;
        else if (IS("-v"))			/* show version */
            ++version;
        else					/* unknown option */
            usage(argv[i]);
    }
    if (i == argc && (listing || !dumping))
    {
        dumping = 0;
        argv[--i] = Output;
    }
    if (version)
    {
        printf("%s\n", LUA_COPYRIGHT);
        if (version == argc - 1) exit(EXIT_SUCCESS);
    }
    return i;
}

#define FUNCTION "(function()end)();"

static const char* reader(lua_State* L, void* ud, size_t* size)
{
    UNUSED(L);
    if ((*(int*)ud)--)
    {
        *size = sizeof(FUNCTION) - 1;
        return FUNCTION;
    }
    else
    {
        *size = 0;
        return NULL;
    }
}

#define toproto(L,i) getproto(L->top+(i))

static const Proto* combine(lua_State* L, int n)
{
    if (n == 1)
        return toproto(L, -1);
    else
    {
        Proto* f;
        int i = n;
        if (lua_load(L, reader, &i, "=(" PROGNAME ")", NULL) != LUA_OK) fatal(lua_tostring(L, -1));
        f = toproto(L, -1);
        for (i = 0; i < n; i++)
        {
            f->p[i] = toproto(L, i - n - 1);
            if (f->p[i]->sizeupvalues > 0) f->p[i]->upvalues[0].instack = 0;
        }
        f->sizelineinfo = 0;
        return f;
    }
}

static int writer(lua_State* L, const void* p, size_t size, void* u)
{
    UNUSED(L);
    return (fwrite(p, size, 1, (FILE*)u) != 1) && (size != 0);
}

static int pmain(lua_State* L)
{
    int argc = (int)lua_tointeger(L, 1);
    char** argv = (char**)lua_touserdata(L, 2);
    const Proto* f;
    int i;
    if (!lua_checkstack(L, argc)) fatal("too many input files");
    for (i = 0; i < argc; i++)
    {
        const char* filename = IS("-") ? NULL : argv[i];
        if (luaL_loadfile(L, filename) != LUA_OK) fatal(lua_tostring(L, -1));
    }
    f = combine(L, argc);
    if (listing) luaU_print(f, listing > 1);
    if (dumping)
    {
        FILE* D = (output == NULL) ? stdout : fopen(output, "wb");
        if (D == NULL) cannot("open");
        lua_lock(L);
        luaU_dump(L, f, writer, D, stripping);
        lua_unlock(L);
        if (ferror(D)) cannot("write");
        if (fclose(D)) cannot("close");
    }
    return 0;
}

int main(int argc, char* argv[])
{
    lua_State* L;
    int i = doargs(argc, argv);
    argc -= i; argv += i;
    if (argc <= 0) usage("no input files given");
    L = luaL_newstate();
    if (L == NULL) fatal("cannot create state: not enough memory");
    lua_pushcfunction(L, &pmain);
    lua_pushinteger(L, argc);
    lua_pushlightuserdata(L, argv);
    if (lua_pcall(L, 2, 0, 0) != LUA_OK) fatal(lua_tostring(L, -1));
    lua_close(L);
    return EXIT_SUCCESS;
}

/*
** $Id: luac.c,v 1.76 2018/06/19 01:32:02 lhf Exp $
** print bytecodes
** See Copyright Notice in lua.h
*/

#include <ctype.h>
#include <stdio.h>

#define luac_c
#define LUA_CORE

#include "ldebug.h"
#include "lobject.h"
#include "lopcodes.h"

#define VOID(p)		((const void*)(p))

static void PrintString(const TString* ts)
{
    const char* s = getstr(ts);
    size_t i, n = tsslen(ts);
    Printf("%c", '"');
    for (i = 0; i < n; i++)
    {
        int c = (int)(unsigned char)s[i];
        switch (c)
        {
        case '"':  Printf("\\\""); break;
        case '\\': Printf("\\\\"); break;
        case '\a': Printf("\\a"); break;
        case '\b': Printf("\\b"); break;
        case '\f': Printf("\\f"); break;
        case '\n': Printf("\\n"); break;
        case '\r': Printf("\\r"); break;
        case '\t': Printf("\\t"); break;
        case '\v': Printf("\\v"); break;
        default:	if (isprint(c))
			Printf("%c", c);
               else
			Printf("\\%03d", c);
        }
    }
	Printf("%c", '"');
}

static void PrintConstant(const Proto* f, int i)
{
    const TValue* o = &f->k[i];
    switch (ttype(o))
    {
    case LUA_TNIL:
		Printf("nil");
        break;
    case LUA_TBOOLEAN:
		Printf(bvalue(o) ? "true" : "false");
        break;
    case LUA_TNUMFLT:
    {
        char buff[100];
        sprintf(buff, LUA_NUMBER_FMT, fltvalue(o));
		Printf("%s", buff);
        if (buff[strspn(buff, "-0123456789")] == '\0') Printf(".0");
        break;
    }
    case LUA_TNUMINT:
		Printf(LUA_INTEGER_FMT, ivalue(o));
        break;
    case LUA_TSHRSTR: case LUA_TLNGSTR:
        PrintString(tsvalue(o));
        break;
    default:				/* cannot happen */
		Printf("? type=%d", ttype(o));
        break;
    }
}

#define UPVALNAME(x) ((f->upvalues[x].name) ? getstr(f->upvalues[x].name) : "-")
#define MYK(x)		(-1-(x))

static void PrintCode(const Proto* f)
{
    const Instruction* code = f->code;
    int pc, n = f->sizecode;
    for (pc = 0; pc < n; pc++)
    {
        Instruction i = code[pc];
        OpCode o = GET_OPCODE(i);
        int a = GETARG_A(i);
        int b = GETARG_B(i);
        int c = GETARG_C(i);
        int ax = GETARG_Ax(i);
        int bx = GETARG_Bx(i);
        int sbx = GETARG_sBx(i);
        int line = getfuncline(f, pc);
		Printf("\t%d\t", pc + 1);
        if (line > 0) Printf("[%d]\t", line); else Printf("[-]\t");
		Printf("%-9s\t", luaP_opnames[o]);
        switch (getOpMode(o))
        {
        case iABC:
			Printf("%d", a);
            if (getBMode(o) != OpArgN) Printf(" %d", ISK(b) ? (MYK(INDEXK(b))) : b);
            if (getCMode(o) != OpArgN) Printf(" %d", ISK(c) ? (MYK(INDEXK(c))) : c);
            break;
        case iABx:
			Printf("%d", a);
            if (getBMode(o) == OpArgK) Printf(" %d", MYK(bx));
            if (getBMode(o) == OpArgU) Printf(" %d", bx);
            break;
        case iAsBx:
			Printf("%d %d", a, sbx);
            break;
        case iAx:
			Printf("%d", MYK(ax));
            break;
        }
        switch (o)
        {
        case OP_LOADK:
			Printf("\t; "); PrintConstant(f, bx);
            break;
        case OP_GETUPVAL:
        case OP_SETUPVAL:
			Printf("\t; %s", UPVALNAME(b));
            break;
        case OP_GETTABUP:
			Printf("\t; %s", UPVALNAME(b));
            if (ISK(c)) { Printf(" "); PrintConstant(f, INDEXK(c)); }
            break;
        case OP_SETTABUP:
			Printf("\t; %s", UPVALNAME(a));
            if (ISK(b)) { Printf(" "); PrintConstant(f, INDEXK(b)); }
            if (ISK(c)) { Printf(" "); PrintConstant(f, INDEXK(c)); }
            break;
        case OP_GETTABLE:
        case OP_SELF:
            if (ISK(c)) { Printf("\t; "); PrintConstant(f, INDEXK(c)); }
            break;
        case OP_SETTABLE:
        case OP_ADD:
        case OP_SUB:
        case OP_MUL:
        case OP_MOD:
        case OP_POW:
        case OP_DIV:
        case OP_IDIV:
        case OP_BAND:
        case OP_BOR:
        case OP_BXOR:
        case OP_SHL:
        case OP_SHR:
        case OP_EQ:
        case OP_LT:
        case OP_LE:
            if (ISK(b) || ISK(c))
            {
				Printf("\t; ");
                if (ISK(b)) PrintConstant(f, INDEXK(b)); else Printf("-");
				Printf(" ");
                if (ISK(c)) PrintConstant(f, INDEXK(c)); else Printf("-");
            }
            break;
        case OP_JMP:
        case OP_FORLOOP:
        case OP_FORPREP:
        case OP_TFORLOOP:
			Printf("\t; to %d", sbx + pc + 2);
            break;
        case OP_CLOSURE:
			Printf("\t; %p", VOID(f->p[bx]));
            break;
        case OP_SETLIST:
            if (c == 0) Printf("\t; %d", (int)code[++pc]); else Printf("\t; %d", c);
            break;
        case OP_EXTRAARG:
			Printf("\t; "); PrintConstant(f, ax);
            break;
        default:
            break;
        }
		Printf("\n");
    }
}

#define SS(x)	((x==1)?"":"s")
#define S(x)	(int)(x),SS(x)

static void PrintHeader(const Proto* f)
{
    const char* s = f->source ? getstr(f->source) : "=?";
    if (*s == '@' || *s == '=')
        s++;
    else if (*s == LUA_SIGNATURE[0])
        s = "(bstring)";
    else
        s = "(string)";

	Printf("\n%s <%s:%d,%d> (%d instruction%s at %p)\n",
        (f->linedefined == 0) ? "main" : "function", s,
        f->linedefined, f->lastlinedefined,
        S(f->sizecode), VOID(f));
	Printf("%d%s param%s, %d slot%s, %d upvalue%s, ",
        (int)(f->numparams), f->is_vararg ? "+" : "", SS(f->numparams),
        S(f->maxstacksize), S(f->sizeupvalues));
	Printf("%d local%s, %d constant%s, %d function%s\n",
        S(f->sizelocvars), S(f->sizek), S(f->sizep));
}

static void PrintDebug(const Proto* f)
{
    int i, n;
    n = f->sizek;
	Printf("constants (%d) for %p:\n", n, VOID(f));
    for (i = 0; i < n; i++)
    {
		Printf("\t%d\t", i + 1);
        PrintConstant(f, i);
		Printf("\n");
    }
    n = f->sizelocvars;
	Printf("locals (%d) for %p:\n", n, VOID(f));
    for (i = 0; i < n; i++)
    {
		Printf("\t%d\t%s\t%d\t%d\n",
            i, getstr(f->locvars[i].varname), f->locvars[i].startpc + 1, f->locvars[i].endpc + 1);
    }
    n = f->sizeupvalues;
	Printf("upvalues (%d) for %p:\n", n, VOID(f));
    for (i = 0; i < n; i++)
    {
		Printf("\t%d\t%s\t%d\t%d\n",
            i, UPVALNAME(i), f->upvalues[i].instack, f->upvalues[i].idx);
    }
}

static void PrintFunction(const Proto* f, int full)
{
    int i, n = f->sizep;
    PrintHeader(f);
    PrintCode(f);
    if (full) PrintDebug(f);
    for (i = 0; i < n; i++) PrintFunction(f->p[i], full);
}

/*
** append...
*/

#include "lualib.h"

extern lua_State* Compile(const char * name, const char* luatext)
{
    lua_State* L = luaL_newstate();
	if (L == NULL)
	{
		Print("cannot create state: not enough memory\n");
		return NULL;
	}
    int size = (strlen(name) + 3 + 1)*sizeof(char);
    char* input_name = (char*)malloc(size);
    snprintf(input_name, size, "=(%s)", name);
    if (luaL_loadbufferx(L, luatext, strlen(luatext), input_name, NULL))
    {
        //compile error
        PrintLine(lua_tostring(L, -1));
        free(input_name);
        lua_close(L);
        return NULL;
    }
    free(input_name);
    luaL_openlibs(L);
    //Printf("table: %d\n", lua_getglobal(L, "table"));
    Proto* f = toproto(L, -1);
#ifdef _DEBUG
	PrintFunction(f, 1);
#endif
	return L;
}