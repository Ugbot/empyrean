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
 * File:          $RCSfile: Label.cpp,v $
 * Date modified: $Date: 2004-06-05 02:23:23 $
 * Version:       $Revision: 1.6 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#include "OpenGL.h"
#include "Label.h"

namespace phui
{
   Label::Label(const std::string& text)
   {
      mText = text;
      setBackgroundColor(NONE);
   }

   void Label::draw() const
   {
      const Size& size = getSize();
      const int width = size.getWidth();
      const int height = size.getHeight();
      gltext::FontPtr font = getFont();

      // draw the label background
      glColor(getBackgroundColor());
      glBegin(GL_TRIANGLE_FAN);
      {
         glVertex2i(0,     0     );
         glVertex2i(width, 0     );
         glVertex2i(width, height);
         glVertex2i(0,     height);
      }
      glEnd();

      // draw text
      glColor(getForegroundColor());

      gltext::FontRendererPtr renderer = getFontRenderer();
      float labelWidth = float(renderer->getWidth(mText.c_str()));
      float labelHeight = float(renderer->getHeight(mText.c_str()));

      //These checks see if the button Label fits inside the
      //button.  If not start in the lower left-hand corner of
      //the button and render the text.
      float yLoc = std::max((height - labelHeight) / 2.0f, 0.0f);
      float xLoc = std::max((width - labelWidth) / 2.0f,   0.0f);

      glPushMatrix();
      glTranslatef(xLoc, yLoc, 0.0f);
      renderer->render(mText.c_str());
      glPopMatrix();
   }

   void Label::setText(const std::string& text)
   {
      mText = text;
   }

   const std::string& Label::getText() const
   {
      return mText;
   }
}
