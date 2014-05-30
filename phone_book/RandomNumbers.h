//============================================================
//
// Copyright (c) 2011 GENERAL ELECTRIC COMPANY
//
//============================================================
//
// File:           RandomNumbers.h
// Project:        Genie Carestation SW
//
// Author:         <author> / Genie SW Team
//
//============================================================
// Description:
// <purpose of this file>
//============================================================
#ifndef _RANDOM_NUMBERS_H_
#define _RANDOM_NUMBERS_H_

#pragma once

#include <vector>
#include <iostream>
#include <ctime>
#include <cstdlib>
#include <map>

using namespace std;
#define _ARRAY_INT vector <int>

class CRandomNumbers
{

public:

    static int getRandomNumber(int iMin, int iMax);
    static _ARRAY_INT getRandomNumbers(int iMin, int iMax, int iSize, bool bUniqueOnlyFlag);

protected:

private:
    static void initialize();

};

#endif
