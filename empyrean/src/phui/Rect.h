/* -*- Mode: C++; tab-width: 3; indent-tabs-mode: nil c-basic-offset: 3 -*- */
// vim:cindent:ts=3:sw=3:et:tw=80:sta:
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
 * File:          $RCSfile: Rect.h,v $
 * Date modified: $Date: 2003-11-09 08:15:56 $
 * Version:       $Revision: 1.2 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#ifndef PHUI_RECT_H
#define PHUI_RECT_H

namespace phui {

    /// Describes a rectangular region.
    class Rect {
    public:
        Rect();
        Rect(int x, int y, int width, int height);
        Rect(const Rect& rect);
        Rect& operator=(const Rect& rect);

        bool operator==(const Rect& rect) const;
        bool operator!=(const Rect& rect) const;

    public:
        int x;      ///< x position of the upper-left corner of the rect
        int y;      ///< y position of the upper-left corner of the rect
        int width;  ///< width of the rect
        int height; ///< height of the rect
    };
}

#endif
