#include <stdio.h>
#include <stdarg.h>
#include "adapter.h"


static putstr_func putstr_callback;

EXPORT void CALL Redirect(putstr_func func)
{
	putstr_callback = func;
	putstr_callback("Redirect OK\n", LOG_LEVEL_DEBUG);
}

extern void Print(const char* str) 
{
	printf(str);
	if (putstr_callback != NULL) {
		putstr_callback(str, LOG_LEVEL_DEBUG);
	}
}

extern void PrintLine(const char* str)
{
	Printf("%s\n", str);
}

extern void Printf(char const* const _Format, ...)
{
	static char buffer[1024];
	va_list arg_list;
	va_start(arg_list, _Format);
	int ret = vsnprintf(buffer, 1024, _Format, arg_list);
	va_end(arg_list);
	Print(buffer);
}

extern void OutputFunc(int level, char const* const _Format, ...)
{
	static char buffer[1024];
	va_list arg_list;
	va_start(arg_list, _Format);
	int ret = vsnprintf(buffer, 1024, _Format, arg_list);
	va_end(arg_list);
	if (level == LOG_LEVEL_DEBUG) {
		printf(buffer);
	}
	if (putstr_callback != NULL) {
		putstr_callback(buffer, level);
	}
}