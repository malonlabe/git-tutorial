#ifndef _PHONE_BOOK_H_
#define _PHONE_BOOK_H_
//============================================================
//
// Copyright (c) 2011 GENERAL ELECTRIC COMPANY
//
//============================================================
//
// File:            map_tst.h
// Project:        Genie Carestation SW
//
// Author:         YS / Genie SW Team
//
//============================================================
// Description:
//==========================================================
#include "gen.h"
#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

class Number
{
public:
    string name;
    string number;
    Number(const Number &v);
    Number();
    const Number &operator=(const Number &v)    
    {
        name = v.name;
        number = v.number;
        return v;
    }
};

#endif 
