#include <stdio.h>
#include <stdarg.h>
#include "adapter.h"


static putstr_func putstr_callback;

EXPORT void CALL Redirect(putstr_func func)
{
	putstr_callback = func;
	putstr_callback("Redirect OK\n");
}

void Print(const char* str) 
{
	printf(str);
	if (putstr_callback != NULL) {
		putstr_callback(str);
	}
}

int Printf(char const* const _Format, ...)
{
	static char buffer[1024];
	va_list arg_list;
	va_start(arg_list, _Format);
	int ret = vsnprintf(buffer, 1024, _Format, arg_list);
	va_end(arg_list);
	Print(buffer);
	return ret;
}