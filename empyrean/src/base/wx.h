/**
 * @file
 *
 * A wrapper header for wxWindows.  This file includes all necessary headers
 * for wxWindows to work.  It can also be used for precompiled headers.
 */

#ifndef PYR_WX_H
#define PYR_WX_H


// extgl.h must be included before gl.h.
// Perhaps this should be split out into a wxgl.h.   The server does
// not depend on OpenGL.
#include "OpenGL.h"


// We need to include windows.h for wx-using code to behave properly on
// Windows.  :(
#ifdef _MSC_VER
#include <windows.h>
#include "wx/msw/winundef.h"
#endif

#include <wx/wx.h>
#include <wx/glcanvas.h>
#include <wx/image.h>
#include <wx/splitter.h>
#include <wx/treectrl.h>
#include <wx/wxhtml.h>
#include <wx/grid.h>

#endif
