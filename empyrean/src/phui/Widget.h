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
 * Date modified: $Date: 2003-09-19 13:26:20 $
 * Version:       $Revision: 1.5 $
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
#include "RefCounted.h"
#include "RefPtr.h"
#include "Size.h"
#include "Utility.h"

namespace phui
{
   // forward declare so we can point to our parent
   class WidgetContainer;

   /**
    * Abstract base class for all Widgets.
    */
   class Widget : public RefCounted
   {
   protected:
      ~Widget() { }
      
   public:
      /**
       * Creates a new widget with width and height 0 and size (0,0).
       */
      Widget();

      virtual void draw() { };
      virtual void update(float dt) { };
      
      virtual bool isFocusable() { return true; }
      

      /**
       * Gets the position of this widget relative to its parent.
       *
       * @return  the position of this widget
       */
      virtual const Point& getPosition() const;

      /**
       * Sets the position of this widget relative to its parent.
       *
       * @param x    the x position of this widget
       * @param y    the y position of this widget
       */
      virtual void setPosition(const Point& p);
      void setPosition(int x, int y) { setPosition(Point(x, y)); }
      
      /**
       * Gets the size of this widget.
       *
       * @return  the size of this widget
       */
      const Size& getSize() const;
      int getWidth() const  { return getSize().getWidth(); }
      int getHeight() const { return getSize().getHeight(); }

      /**
       * Sets the size of this widget.
       *
       * @param size    the new size of the widget
       */
      void setSize(const Size& size);
      void setSize(int w, int h) { setSize(Size(w, h)); }
      
      void setPositionAndSize(const Point& pos, const Size& size)
      {
         setPosition(pos);
         setSize(size);
      }
      
      void setPositionAndSize(int x, int y, int w, int h)
      {
         setPosition(x, y);
         setSize(w, h);
      }

      /**
       * Gets the insets for this widget.
       *
       * @return  the insets
       */
      virtual const Insets& getInsets() const;

      /**
       * Sets the insets for the widget.
       *
       * @param insets     the insets
       */
      virtual void setInsets(const Insets& insets);

      /**
       * Tests if this widget is enabled.
       *
       * @return  true if the widget is enabled, false if disabled
       */
      virtual bool isEnabled() const;

      /**
       * Sets the enabled status of this widget.
       *
       * @param enabled    true to enabled the widget, false to disable it
       */
      virtual void setEnabled(bool enabled);
      
      void enable()  { setEnabled(true);  }
      void disable() { setEnabled(false); }

      /**
       * Tests if this widget is visible.
       *
       * @return  true if the widget is visible, false otherwise
       */
      virtual bool isVisible() const;

       /**
       * Shows or hides this component depending on the parameter visible.
       *
       * @param visible    true to show this component, false to hide it
       */
      virtual void setVisible(bool visible);

      void show() { setVisible(true); }
      void hide() { setVisible(false); }

      /**
       * Sets the background color of this widget.
       *
       * @param clr     the new background color
       */
      virtual void setBackgroundColor(const Colorf& clr);

      /**
       * Gets the background color of this widget.
       *
       * @return  the background color
       */
      virtual const Colorf& getBackgroundColor() const;

      /**
       * Sets the foreground color of this widget.
       *
       * @param clr     the new foreground color
       */
      virtual void setForegroundColor(const Colorf& clr);

      /**
       * Gets the foreground color of this widget.
       *
       * @return  the foreground color
       */
      virtual const Colorf& getForegroundColor() const;

      /**
       * Sets the font to use for rendering text in this widget.
       *
       * @param font    the new font
       */
      virtual void setFont(const gltext::FontPtr& font);

      /**
       * Gets the font for this widget.
       */
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
      /**
       * The position of the widget in pixels relative to its parent.
       */
      Point mPosition;

      /// The size of the widget in pixels.
      Size mSize;

      /**
       * The insets for this widget.
       */
      Insets mInsets;

      /**
       * Whether this widget is enabled or disabled.
       */
      bool mEnabled;

      /**
       * Whether this widget is visible.
       */
      bool mVisible;

      Colorf mBackgroundColor;
      Colorf mForegroundColor;

      gltext::FontRendererPtr mFontRenderer;

      /// The parent container for this widget.
      WidgetContainer* mParent;

      friend class WidgetContainer;
   };

   typedef RefPtr<Widget> WidgetPtr;
}

#endif
