#pragma once

/*! 
 * I like being able to declare interfaces this way.
 * I'm a little confused as to why Visual Studio .NET
 * highlights 'interface' when in C++ mode, but you won't
 * see me complain. :)
 */
#define interface struct

// Shorthand for ints of a given number of bits/signedness
typedef unsigned char u8;
typedef unsigned short int u16;
typedef unsigned int u32;

typedef signed char s8;
typedef signed short int s16;
typedef signed int s32;

typedef unsigned int uint;

//! Everybody has their own Rect struct.  This is mine.
struct Rect
{
    int left;
    int top;
    int right;
    int bottom;
    
    inline int Width() const  { return right-left; }
    inline int Height() const { return bottom-top; }

    Rect(int x1,int y1,int x2,int y2) : left(x1),right(x2),top(y1),bottom(y2) {}
    Rect() : left(0),right(0),top(0),bottom(0) {}
};