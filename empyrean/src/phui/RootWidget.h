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
 * File:          $RCSfile: RootWidget.h,v $
 * Date modified: $Date: 2003-07-22 03:24:31 $
 * Version:       $Revision: 1.1 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#ifndef PHUI_ROOT_WIDGET_H
#define PHUI_ROOT_WIDGET_H

#include "OpenGL.h"
#include "WidgetContainer.h"

namespace phui
{
   class RootWidget : public WidgetContainer
   {
   public:
      /**
       * Creates a new root widget with the given size.
       *
       * @param width      the width of the UI
       * @param height     the height of the UI
       */
      RootWidget(int width, int height);

      /**
       * First the projection matrix is modified to 2D orthographic projection.
       * Then the modelview matrix is setup to support drawing in window
       * coordinates. Then WidgetContainer::draw() is called.
       *
       * @see WidgetContainer::draw()
       */
      void draw();

      void onMouseMove(const Point& p);
      
      bool isPointerVisible() const;
      void setPointerVisible(bool visible);
      void showPointer() { setPointerVisible(true);  }
      void hidePointer() { setPointerVisible(false); }

   private:
      void drawPointer();
      void drawChildren();

      Point mPointerPosition;
      bool mPointerVisible;
   };

   typedef RefPtr<RootWidget> RootWidgetPtr;
}

#endif