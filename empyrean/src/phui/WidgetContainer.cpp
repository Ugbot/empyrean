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
 * File:          $RCSfile: WidgetContainer.cpp,v $
 * Date modified: $Date: 2003-08-08 02:51:24 $
 * Version:       $Revision: 1.2 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#include <algorithm>
#include <functional>

#include "OpenGL.h"

#include "EmptyConstraint.h"
#include "WidgetContainer.h"

namespace phui
{
   WidgetContainer::WidgetContainer()
   {
      LayoutConstraintPtr constraint(new EmptyConstraint());
      mLayoutManager = new LayoutManager(this, constraint);
      mModifiers = MODIF_NONE;
      mLocks = ILOCK_NONE;
   }

   WidgetContainer::WidgetContainer(LayoutManagerPtr manager)
      : mLayoutManager(manager)
   {}

   WidgetContainer::~WidgetContainer()
   {}

   void WidgetContainer::add(WidgetPtr widget)
   {
      // First remove the widget from its old parent
      if (widget->getParent())
      {
         widget->getParent()->remove(widget);
      }
      // Now add the widget to this container
      mWidgets.push_back(widget);
      widget->setParent(this);
      mLayoutManager->add(widget->getPosition(), widget->getSize());
   }

   void WidgetContainer::remove(WidgetPtr widget)
   {
      for (size_t i = 0; i < mWidgets.size(); ++i)
      {
         if (mWidgets[i] == widget)
         {
            mWidgets.erase(mWidgets.begin() + i);
            widget->setParent(0);
            mLayoutManager->remove(widget->getPosition());
         }
      }
   }

   WidgetPtr WidgetContainer::getWidget(unsigned int idx)
   {
      if (idx < getNumChildren())
      {
         return mWidgets[idx];
      }
      else
      {
         return WidgetPtr();
      }
   }

   unsigned int WidgetContainer::getNumChildren()
   {
      return mWidgets.size();
   }

   void WidgetContainer::draw()
   {
      // Check to see if the current setup is valid
      if (!mLayoutManager->isValid())
      {
         mLayoutManager->resize();
      }
      // draw all children to this widget
      // draw them backwards so it's from the back to the front, visually
      for (int i = int(mWidgets.size()) - 1; i >= 0; --i)
      {
         WidgetPtr wgt = mWidgets[i];
         Point pos = wgt->getPosition();

         // only draw if the widget is visible
         if (wgt->isVisible())
         {
            glTranslatef((float)pos.x, (float)pos.y, 0);
            wgt->draw();
            glTranslatef((float)-pos.x, (float)-pos.y, 0);
         }
      }
   }

   void WidgetContainer::setLayoutManager(LayoutManagerPtr manager)
   {
      mLayoutManager = manager;
   }

   void WidgetContainer::onKeyDown(InputKey key)
   {
      if (key == KEY_CTRL)
      {
         mModifiers |= MODIF_CTRL;
      }
      else if (key == KEY_ALT)
      {
         mModifiers |= MODIF_ALT;
      }
      else if (key == KEY_SHIFT)
      {
         mModifiers |= MODIF_SHIFT;
      }

      if (key == KEY_CAPS_LOCK)
      {
         mLocks |= ILOCK_CAPS;
      }
      else if (key == KEY_NUM_LOCK)
      {
         mLocks |= ILOCK_NUM;
      }
      else if (key == KEY_SCROLL_LOCK)
      {
         mLocks |= ILOCK_SCROLL;
      }

      if (WidgetPtr focus = getFocus())
      {
         focus->onKeyDown(key, (InputModifiers)(mModifiers ^ ((mLocks & ILOCK_CAPS) ? MODIF_SHIFT : 0)));
      }
   }

   void WidgetContainer::onKeyUp(InputKey key)
   {
      if (key == KEY_CTRL)
      {
         mModifiers &= MODIF_CTRL ^ 0xFFFFFFFF;
      }
      else if (key == KEY_ALT)
      {
         mModifiers &= MODIF_ALT ^ 0xFFFFFFFF;
      }
      else if (key == KEY_SHIFT)
      {
         mModifiers &= MODIF_SHIFT ^ 0xFFFFFFFF;
      }

      if (key == KEY_CAPS_LOCK)
      {
         mLocks &= ILOCK_CAPS ^ 0xFFFFFFFF;
      }
      else if (key == KEY_NUM_LOCK)
      {
         mLocks &= ILOCK_NUM ^ 0xFFFFFFFF;
      }
      else if (key == KEY_SCROLL_LOCK)
      {
         mLocks &= ILOCK_SCROLL ^ 0xFFFFFFFF;
      }

      if (WidgetPtr focus = getFocus())
      {
         focus->onKeyUp(key, (InputModifiers)(mModifiers ^ ((mLocks & ILOCK_CAPS) ? MODIF_SHIFT : 0)));
      }
   }

   void WidgetContainer::onMouseDown(InputButton button, const Point& p)
   {
      // mouse down always releases widget capture
      WidgetPtr null;
      capture(null);

      if (WidgetPtr widget = getWidgetAt(p))
      {
         // we'll want to simply ignore this event if widget is disabled
         if(widget->isEnabled())
         {
            focus(widget);
            capture(widget);
            widget->onMouseDown(button, p - widget->getPosition());
         }
      }
   }

   void WidgetContainer::onMouseUp(InputButton button, const Point& p)
   {
      if (WidgetPtr widget = getMouseWidget(p))
      {
         // we'll want to simply ignore this event if widget is disabled
         if (widget->isEnabled()) 
         {
            widget->onMouseUp(button, p - widget->getPosition());
            WidgetPtr null;
            capture(null);
         }
      }
   }

   void WidgetContainer::onMouseMove(const Point& p)
   {
      if (WidgetPtr widget = getMouseWidget(p))
      {
         // we'll want to simply ignore this event if widget is disabled
         if (widget->isEnabled())
         {
            widget->onMouseMove(p - widget->getPosition());
         }
      }
   }

   void WidgetContainer::focus(WidgetPtr widget)
   {
      for (size_t i = 0; i < mWidgets.size(); ++i)
      {
         if (mWidgets[i] == widget)
         {
            std::swap(mWidgets[0], mWidgets[i]);
            break;
         }
      }
   }

   WidgetPtr WidgetContainer::getFocus()
   {
      WidgetPtr null;
      return (mWidgets.empty() ? null : mWidgets[0]);
   }

   void WidgetContainer::capture(WidgetPtr widget)
   {
      mCapturedWidget = widget;
   }

   WidgetPtr WidgetContainer::getCapture()
   {
      return mCapturedWidget;
   }

   WidgetPtr WidgetContainer::getWidgetAt(const Point& p)
   {
      for (size_t i = 0; i < mWidgets.size(); ++i)
      {
         WidgetPtr wgt = mWidgets[i];

         // Make sure the widget is visible
         if (wgt->isVisible())
         {
            // Check if this widget contains the given point
            if (wgt->contains(p - wgt->getPosition()))
            {
               return mWidgets[i];
            }
         }
      }
      WidgetPtr null;
      return null;
   }

   WidgetPtr WidgetContainer::getMouseWidget(const Point& p)
   {
      WidgetPtr widget = getCapture();
      return (widget ? widget : getWidgetAt(p));
   }
}
