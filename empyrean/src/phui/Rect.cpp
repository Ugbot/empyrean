/***************************************************************** phui-cpr beg
 *
 * phui - flexible user interface subsystem
 * phui is (C) Copyright 2002 by
 *      Chad Austin, Josh Carlson, Johnathan Gurley,
 *      Ben Scott, Levi Van Oort
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 *
 * -----------------------------------------------------------------
 * File:          $RCSfile: Rect.cpp,v $
 * Date modified: $Date: 2004-06-05 02:23:23 $
 * Version:       $Revision: 1.3 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#include "Rect.h"

namespace phui
{
   Rect::Rect()
      : x(0), y(0), width(0), height(0)
   {}

   Rect::Rect(int x_, int y_, int width_, int height_)
      : x(x_), y(y_), width(width_), height(height_)
   {}

   Rect::Rect(const Rect& rect)
   {
      *this = rect;
   }

   Rect& Rect::operator=(const Rect& rect)
   {
      x = rect.x;
      y = rect.y;
      width  = rect.width;
      height = rect.height;
      return *this;
   }

   bool Rect::operator==(const Rect& rect) const
   {
      if ( (x == rect.x) &&
           (y == rect.y) &&
           (width  == rect.width) &&
           (height == rect.height) )
      {
         return true;
      }
      return false;
   }

   bool Rect::operator!=(const Rect& rect) const
   {
      return (! operator==(rect));
   }
}
