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
 * File:          $RCSfile: Widget.h,v $
 * Date modified: $Date: 2003-11-09 08:15:56 $
 * Version:       $Revision: 1.10 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#ifndef PHUI_WIDGET_H
#define PHUI_WIDGET_H

#include <gltext.h>
#include "Color.h"
#include "Input.h"
#include "Insets.h"
#include "Point.h"
#include "Rect.h"
#include "RefCounted.h"
#include "RefPtr.h"
#include "Size.h"

namespace phui {

    // forward declare so we can point to our parent
    class WidgetContainer;

    /// Abstract base class for all Widgets.
    class Widget : public pyr::RefCounted {
    protected:
        ~Widget() { }
      
    public:
        /// Creates a new widget with width and height 0 and size (0,0).
        Widget();

        virtual void draw() { };
        virtual void update(float dt) { };
      
        virtual bool isFocusable() { return true; }
      

        /// Gets the position of this widget relative to its parent.
        virtual const Point& getPosition() const;

        /// Sets the position of this widget relative to its parent.
        virtual void setPosition(const Point& p);
        void setPosition(int x, int y) { setPosition(Point(x, y)); }
      
        /// Centers the widget within its parent based on its size.
        void center();
      
        const Size& getSize() const;
        int getWidth() const  { return getSize().getWidth(); }
        int getHeight() const { return getSize().getHeight(); }

        virtual void setSize(const Size& size);
        void setSize(int w, int h) { setSize(Size(w, h)); }
      
        void setPositionAndSize(const Rect& r) {
            setPosition(r.x, r.y);
            setSize(r.width, r.height);
        }
      
        void setPositionAndSize(const Point& pos, const Size& size) {
            setPosition(pos);
            setSize(size);
        }
      
        void setPositionAndSize(int x, int y, int w, int h) {
            setPosition(x, y);
            setSize(w, h);
        }

        /// Gets the insets for this widget.
        virtual const Insets& getInsets() const;

        /// Sets the insets for the widget.
        virtual void setInsets(const Insets& insets);

        virtual bool isEnabled() const;
        virtual void setEnabled(bool enabled);
      
        void enable()  { setEnabled(true);  }
        void disable() { setEnabled(false); }

        /// Tests if this widget is visible.
        virtual bool isVisible() const;
        virtual void setVisible(bool visible);

        void show() { setVisible(true); }
        void hide() { setVisible(false); }

        virtual void setBackgroundColor(const Colorf& clr);
        virtual const Colorf& getBackgroundColor() const;

        virtual void setForegroundColor(const Colorf& clr);
        virtual const Colorf& getForegroundColor() const;

        virtual void setFont(const gltext::FontPtr& font);
        virtual gltext::FontPtr getFont() const;

        virtual const gltext::FontRendererPtr& getFontRenderer() const;

        /**
         * Gets the parent container for this widget or NULL if this
         * widget has no container.
         */
        WidgetContainer* getParent() const;
      
        /**
         * Tests if the given point is contained within this widget where the
         * point is relative to this widget's coordinate system.
         *
         * @param p  the point to test
         * @return whether the test succeeded or not
         */
        bool contains(const Point& p) const;

        /**
         * Gets the position of the upper-left corner of this widget relative to
         * the screen's coordinate system.
         *
         * @return  the point
         */
        Point getScreenPosition() const;

        bool hasFocus();

        // external events
        virtual void onKeyDown(InputKey key, InputModifiers modifiers) { }
        virtual void onKeyUp(InputKey key, InputModifiers modifiers) { }
        virtual void onMouseDown(InputButton button, const Point& p) { }
        virtual void onMouseUp(InputButton button, const Point& p) { }
        virtual void onMouseMove(const Point& p) { }
      
    private:
        /// This method is private and should only be used by WidgetContainer.
        void setParent(WidgetContainer* parent);

    private:
        /// The position of the widget in pixels relative to its parent.
        Point mPosition;

        /// The size of the widget in pixels.
        Size mSize;

        /// The insets for this widget.
        Insets mInsets;

        bool mEnabled;
        bool mVisible;

        Colorf mBackgroundColor;
        Colorf mForegroundColor;

        gltext::FontRendererPtr mFontRenderer;

        /// The parent container for this widget.
        WidgetContainer* mParent;

        /// WidgetContainer calls setParent()
        friend class WidgetContainer;
    };

    typedef pyr::RefPtr<Widget> WidgetPtr;
}

#endif
