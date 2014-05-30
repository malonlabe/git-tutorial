#ifndef _GEN_H_
#define _GEN_H_	

#if _MSC_VER > 1000
    #pragma once
#endif // _MSC_VER > 1000

#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers

#define TIME_TICK_INTERVAL 1000

// This didn't work:
// #define rdtsc __asm __emit 0fh __asm __emit 031h

#define WIN32_APP

#ifdef WIN32_APP
  #include <Windows.h>
#endif

#define RND_MAX 65536

#include <conio.h>
#include "time.h"
#include <string.h>
#include "stdlib.h"
//#include <vector>
//#include <stdio.h>
#include <iostream>
#include <sstream>
//#include <map>

using namespace std;

#endif
