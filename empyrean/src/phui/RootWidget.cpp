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
 * File:          $RCSfile: RootWidget.cpp,v $
 * Date modified: $Date: 2003-09-23 09:24:56 $
 * Version:       $Revision: 1.6 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#include "RootWidget.h"

namespace phui
{
   RootWidget::RootWidget(int width, int height)
   {
      mPointerVisible = true;
      mModifiers = IMOD_NONE;
      setSize(Size(width, height));
   }

   void RootWidget::draw()
   {
      const Size& size = getSize();
      const int width = size.getWidth();
      const int height = size.getHeight();

      // setup the projection matrix
      glMatrixMode(GL_PROJECTION);
      glPushMatrix();
      glLoadIdentity();
      gluOrtho2D(0, width, height, 0);

      // setup the modelview matrix
      glMatrixMode(GL_MODELVIEW);
      glPushMatrix();
      glLoadIdentity();

      // Make sure the client isn't affected by our changes to OpenGL state.
      glPushAttrib(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT |
                   GL_ENABLE_BIT | GL_SCISSOR_BIT);
      {
         // disable depth testing since all draws occur at the same level
         glDisable(GL_DEPTH_TEST);

         // we need to clip widgets
         glEnable(GL_SCISSOR_TEST);

         // turn on alpha blending
         glEnable(GL_BLEND);
         glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

         drawChildren();
         if (mPointerVisible)
         {
            drawPointer();
         }
      }
      glPopAttrib();

      // restore old matrices
      glMatrixMode(GL_MODELVIEW);
      glPopMatrix();
      glMatrixMode(GL_PROJECTION);
      glPopMatrix();
   }

   InputModifiers getPlainMod(InputKey key) {
      switch (key) {
         case KEY_CTRL:  return IMOD_CTRL;
         case KEY_ALT:   return IMOD_ALT;
         case KEY_SHIFT: return IMOD_SHIFT;
         default:        return IMOD_NONE;
      }
   }

   InputModifiers getStickyMod(InputKey key) {
      switch (key) {
         case KEY_CAPS_LOCK:   return IMOD_CAPS_LOCK;
         case KEY_NUM_LOCK:    return IMOD_NUM_LOCK;
         case KEY_SCROLL_LOCK: return IMOD_SCROLL_LOCK;
         default:              return IMOD_NONE;
      }
   }

   void RootWidget::genKeyDownEvent(InputKey key)
   {
      mModifiers |= getPlainMod(key);
      mModifiers ^= getStickyMod(key);

      onKeyDown(key, mModifiers);
   }

   void RootWidget::genKeyUpEvent(InputKey key)
   {
      mModifiers &= ~getPlainMod(key);
      mModifiers ^= getStickyMod(key);

      onKeyUp(key, mModifiers);
   }

   void RootWidget::genMouseDownEvent(InputButton button, const Point& p)
   {
      onMouseDown(button, p);
   }

   void RootWidget::genMouseUpEvent(InputButton button, const Point& p)
   {
      onMouseUp(button, p);
   }

   void RootWidget::genMouseMoveEvent(const Point& p)
   {
      mPointerPosition = p;
      onMouseMove(p);
   }
   
   bool RootWidget::isPointerVisible() const
   {
      return mPointerVisible;
   }
   
   void RootWidget::setPointerVisible(bool visible)
   {
      mPointerVisible = visible;
   }
   
   void RootWidget::drawPointer()
   {
      glColor(WHITE);
      glBegin(GL_LINES);
      glVertex(mPointerPosition);
      glVertex(mPointerPosition + Point(5, 5));
      glEnd();
   }

   void RootWidget::drawChildren()
   {
      WidgetContainer::draw();
   }
}
