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
 * Date modified: $Date: 2004-11-09 06:18:18 $
 * Version:       $Revision: 1.12 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#ifndef PHUI_WIDGET_H
#define PHUI_WIDGET_H

#include <gltext.h>
#include "Color.h"
#include "Input.h"
#include "Insets.h"
#include "Layout.h"
#include "ModalListener.h"
#include "Point.h"
#include "Rect.h"
#include "RefCounted.h"
#include "RefPtr.h"
#include "Size.h"
#include "UnownedPtr.h"

namespace phui {

    class Widget;
    PYR_REF_PTR(Widget);

    /// Abstract base class for all Widgets.
    class Widget : public pyr::RefCounted {
    protected:
        ~Widget();

    public:
        Widget(LayoutPtr layout = 0);

        virtual void update(float dt) { }
        virtual void draw() const { }

        /// This should probably be false, and have specific widgets return true.
        virtual bool isFocusable() const { return true; }


        /// Gets the position of this widget relative to its parent.
        const Point& getPosition() const;

        /// Sets the position of this widget relative to its parent.
        void setPosition(const Point& p);
        void setPosition(int x, int y) { setPosition(Point(x, y)); }

        /// Centers the widget within its parent based on its size.
        void center();

        /// Centers the widget on the "screen", which is the highest-level parent.
        void centerOnScreen();

        const Size& getSize() const;
        int getWidth() const  { return getSize().getWidth(); }
        int getHeight() const { return getSize().getHeight(); }

        void setSize(const Size& size);
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

        const Insets& getInsets() const;
        void setInsets(const Insets& insets);

        bool isEnabled() const;
        void setEnabled(bool enabled);

        void enable()  { setEnabled(true);  }
        void disable() { setEnabled(false); }

        // Visibility.
        bool isVisible() const;
        void setVisible(bool visible);
        void show() { setVisible(true); }
        void hide() { setVisible(false); }

        void setBackgroundColor(const Color& clr);
        const Color& getBackgroundColor() const;

        void setForegroundColor(const Color& clr);
        const Color& getForegroundColor() const;

        void setFont(const gltext::FontPtr& font);
        gltext::FontPtr getFont() const;

        const gltext::FontRendererPtr& getFontRenderer() const;

        void setLayout(LayoutPtr layout);
        LayoutPtr getLayout() const;

        /**
         * Gets the parent container for this widget or NULL if this
         * widget has no container.
         */
        Widget* getParent() const;

        void add(WidgetPtr widget);
        void remove(WidgetPtr widget);

        size_t getChildCount() const;
        WidgetPtr getChild(size_t idx) const;

        void focus(WidgetPtr widget);
        WidgetPtr getFocus() const;

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

        bool hasFocus() const;

        void setModal(WidgetPtr w, ModalListener* listener = 0, bool centered = true);
        WidgetPtr getModal() const;
        void endModal(int result = 0);

        // Input event handlers.
        virtual void onKeyDown(InputKey key, InputModifiers modifiers) { }
        virtual void onKeyUp(InputKey key, InputModifiers modifiers) { }
        virtual void onMouseDown(InputButton button, const Point& p) { }
        virtual void onMouseUp(InputButton button, const Point& p) { }
        virtual void onMouseMove(const Point& p) { }

    private:
        /**
         * This method is private because the parent widget calls it on
         * children that are added.
         */
        void setParent(Widget* parent);

    private:
        /// The position of the widget in pixels relative to its parent.
        Point mPosition;

        /// The size of the widget in pixels.
        Size mSize;

        /// The insets for this widget.
        Insets mInsets;

        bool mEnabled;
        bool mVisible;

        Color mBackgroundColor;
        Color mForegroundColor;

        gltext::FontRendererPtr mFontRenderer;

        /**
         * The parent container for this widget, only set by the parent
         * when addChild is called.  This is a weak pointer because we'd
         * have cyclic references otherwise.
         */
        Widget* mParent;

        /**
         * The children of this list, ordered from bottom to top.  The widget
         * with focus is the last one in the list.
         */
        std::vector<WidgetPtr> mChildren;

        WidgetPtr mModal;
        pyr::UnownedPtr<ModalListener> mModalListener;

        LayoutPtr mLayout;
    };


    /// This is a hack for now.
    typedef Widget Panel;
    PYR_REF_PTR(Panel);
}

#endif
