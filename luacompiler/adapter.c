#include <stdio.h>
#include "adapter.h"


static putstr_func putstr_callback;

EXPORT void CALL Redirect(putstr_func func)
{
	putstr_callback = func;
}

void Print(const char* str) 
{
	printf(str);
	if (putstr_callback != NULL) {
		putstr_callback(str);
	}
}

