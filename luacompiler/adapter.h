#ifndef adapter_h
#define adapter_h

#include <stdio.h>

#ifdef _WIN32
#define CALL _cdecl
#ifdef __cplusplus
#define EXPORT extern "C" __declspec(dllexport)
#else
#define EXPORT __declspec(dllexport)
#endif
#else
#define CALL _cdecl
#define EXPORT
#endif

typedef void (CALL* putstr_func)(const char*);

extern void Print(const char* str);

extern void PrintLine(const char* str);

extern int Printf(char const* const _Format, ...);

#endif