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
 * File:          $RCSfile: WidgetContainer.h,v $
 * Date modified: $Date: 2003-09-23 08:32:34 $
 * Version:       $Revision: 1.9 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#ifndef PHUI_WIDGET_CONTAINER_H
#define PHUI_WIDGET_CONTAINER_H

#include <vector>
#include "Layout.h"
#include "Widget.h"

namespace phui {

    /**
     * Abstract widget specialization. This is the base class for all widgets
     * implementations that may contain other widgets within them.
     */
    class WidgetContainer : public Widget {
    protected:
        WidgetContainer(LayoutPtr layout = 0);
        ~WidgetContainer();

    public:
        void add(WidgetPtr widget);
        void remove(WidgetPtr widget);

        WidgetPtr getChild(size_t idx);

        /// Gets the number of widgets in this container.
        size_t getNumChildren();

        /// Draws this widget and all of its children.
        void draw();
      
        void update(float dt);

        void onKeyDown(InputKey key, InputModifiers modifiers);
        void onKeyUp(InputKey key, InputModifiers modifiers);
        void onMouseDown(InputButton button, const Point& p);
        void onMouseUp(InputButton button, const Point& p);
        void onMouseMove(const Point& p);

        void focus(WidgetPtr widget);
        WidgetPtr getFocus();

        void capture(WidgetPtr widget);
        WidgetPtr getCapture();
      
        void setModal(WidgetPtr dialog);
        void endModal() { setModal(0); }
      
    private:
        WidgetPtr getWidgetAt(const Point& p);

        /** Returns the widget that should be used for mouse events.  The
            Captured widget, if any, and if not, the widget at point p. */
        WidgetPtr getMouseWidget(const Point& p);
        
        void drawWidget(WidgetPtr widget);

    private:
        /** Widgets contained by this container sorted from bottom to top
            where the first one is bottom-most. */
        std::vector<WidgetPtr> mWidgets;

        LayoutPtr mLayout;

        WidgetPtr mCapturedWidget;
      
        // Should be a WindowPtr, but then we'd have a circular dependency
        // between WidgetContainer and Window.
        WidgetPtr mModalWidget;
    };

    typedef pyr::RefPtr<WidgetContainer> WidgetContainerPtr;
}

#endif
