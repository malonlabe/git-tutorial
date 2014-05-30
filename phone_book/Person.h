#ifndef _PERSON_H_
#define _PERSON_H_
//============================================================
//
// Copyright (c) 2011 GENERAL ELECTRIC COMPANY
//
//============================================================
//
// File:           Person.h
// Project:        Genie Carestation SW
//
// Author:         YS / Genie SW Team
//
//============================================================
// Description:
//============================================================
#include "gen.h" 

class Person
{
public:
    Person();
    virtual ~Person();
    
private:
    std::string name;
    std::string address;

};


class Student: public Person
//class Student
{
public:
    Student();
    ~Student();

    bool amIStudent();
    
private:
    std::string schoolName;
    std::string schoolAddress;
    bool isStudent;
};


bool validateStudent(Student s);

class Window
{
public:
    Window();
    ~Window();

    std::string name() const;
    virtual void display() const;

private:
    std::string _name;
};


#endif
