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
 * File:          $RCSfile: RootWidget.h,v $
 * Date modified: $Date: 2004-06-05 02:23:23 $
 * Version:       $Revision: 1.5 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#ifndef PHUI_ROOT_WIDGET_H
#define PHUI_ROOT_WIDGET_H

#include "Widget.h"

namespace phui {

    class RootWidget : public pyr::RefCounted {
    public:
        RootWidget(int width, int height);

        void update(float dt);
        void draw() const;

        void add(Widget* w);
        void remove(Widget* w);

        // Events generated from the outside world.
        void genKeyDownEvent(InputKey key);
        void genKeyUpEvent(InputKey key);
        void genMouseDownEvent(InputButton button, const Point& p);
        void genMouseUpEvent(InputButton button, const Point& p);
        void genMouseMoveEvent(const Point& p);
        
    private:
        static void focus(Widget* w);
        void capture(Widget* w);

        WidgetPtr getMouseEventTarget(const Point& p) const;
        
        /// Point p is in coordinate space of Widget w.
        WidgetPtr findWidgetAtPoint(Widget* w, const Point& p) const;

        static void updateWidget(Widget* w, float dt);
        static void drawWidget(Widget* w);

        static Point getAbsolutePosition(Widget* w);

        InputModifiers mModifiers;

        Size mSize;
        WidgetPtr mRoot;
        WidgetPtr mCapture;
    };
    typedef pyr::RefPtr<RootWidget> RootWidgetPtr;

}

#endif
