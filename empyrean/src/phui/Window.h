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
 * File:          $RCSfile: Window.h,v $
 * Date modified: $Date: 2004-09-17 17:00:47 $
 * Version:       $Revision: 1.7 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#ifndef PHUI_WINDOW_H
#define PHUI_WINDOW_H

#include <string>
#include <list>
#include "Layout.h"
#include "Widget.h"

namespace phui {

    class Window : public Widget {
    public:
        typedef Widget Base;

        Window(const std::string& title = "", LayoutPtr layout = 0);

        void draw() const;

        bool isFocusable() const { return false; }

        void setTitle(const std::string& title) {
            mTitle = title;
        }
        const std::string& getTitle() const {
            return mTitle;
        }

    private:
        std::string mTitle;
    };

    typedef pyr::RefPtr<Window> WindowPtr;
}

#endif
