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
 * File:          $RCSfile: Window.cpp,v $
 * Date modified: $Date: 2004-06-05 02:23:23 $
 * Version:       $Revision: 1.5 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#include <algorithm>
#include "OpenGL.h"
#include "Window.h"

namespace phui {

    Window::Window(const std::string& title, LayoutPtr layout)
        : Widget(layout)
    {
        mTitle = title;
        setBackgroundColor(Color(0, 0, 0, 0.9f));
    }

    void Window::draw() const {
        const Size& size = getSize();
        const int width = size.getWidth();
        const int height = size.getHeight();

        // render the background
        glColor(getBackgroundColor());
        glBegin(GL_TRIANGLE_FAN);
            glVertex2i(0,     0);
            glVertex2i(width, 0);
            glVertex2i(width, height);
            glVertex2i(0,     height);
        glEnd();

        if (hasFocus()) {
            glColor(getForegroundColor());
            glBegin(GL_LINE_LOOP);
                glVertex2i(0,     0);
                glVertex2i(width, 0);
                glVertex2i(width, height);
                glVertex2i(0,     height);
            glEnd();
        }

        Base::draw();
    }

}
