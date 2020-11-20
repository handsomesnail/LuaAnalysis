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

#define LOG_LEVEL_DEBUG 0
#define LOG_LEVEL_MESSAGE 1
#define LOG_LEVEL_WARNING 2
#define LOG_LEVEL_ERROR 3

typedef void (CALL* putstr_func)(const char*, int);

//for debug
extern void Print(const char* str);
extern void PrintLine(const char* str);
extern void Printf(char const* const _Format, ...);

//for release
extern void OutputFunc(int level, char const* const _Format, ...);

#endif