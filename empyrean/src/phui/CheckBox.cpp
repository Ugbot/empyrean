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
 * File:          $RCSfile: CheckBox.cpp,v $
 * Date modified: $Date: 2003-10-06 06:54:18 $
 * Version:       $Revision: 1.3 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#include "CheckBox.h"

namespace phui
{
   CheckBox::CheckBox(const std::string& text, bool checked)
   {
      mIsChecked = checked;
      mText = text;
   }

   void CheckBox::draw()
   {
      const int width  = getSize().getWidth();
      const int height = getSize().getHeight();
      
      const int SIZE = 50;
      
      int x = SIZE / 20;
      int y = (height - SIZE) / 2;

      glColor(getBackgroundColor());
      glBegin(GL_TRIANGLE_FAN);
      glVertex2i(0,     0     );
      glVertex2i(width, 0     );
      glVertex2i(width, height);
      glVertex2i(0,     height);
      glEnd();
      
      glColor(getForegroundColor());
      glBegin(GL_LINE_LOOP);
      glVertex2i(x,        y);
      glVertex2i(x + SIZE, y);
      glVertex2i(x + SIZE, y + SIZE);
      glVertex2i(x,        y + SIZE);
      glEnd();

      if (isChecked())
      {
         glBegin(GL_LINES);
         glVertex2i(x,        y);
         glVertex2i(x + SIZE, y + SIZE);
         glVertex2i(x + SIZE, y);
         glVertex2i(x,        y + SIZE);
         glEnd();
      }
      
      glPushMatrix();
      glTranslatef(
        float(2 * x + SIZE),
        float((height - getFont()->getAscent()) / 2),
        0);
      GLTEXT_STREAM(getFontRenderer()) << getText();
      glPopMatrix();
   }

   void CheckBox::setChecked(bool checked)
   {
      mIsChecked = checked;
   }

   bool CheckBox::isChecked() const
   {
      return mIsChecked;
   }
   
   void CheckBox::setText(const std::string& text)
   {
      mText = text;
   }
   
   const std::string& CheckBox::getText() const
   {
      return mText;
   }

   void CheckBox::onMouseDown(InputButton button, const Point& p)
   {
      if (button == BUTTON_LEFT)
      {
         setChecked(!isChecked());
      }
   }
}
