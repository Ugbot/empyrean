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
 * File:          $RCSfile: TextField.cpp,v $
 * Date modified: $Date: 2003-08-16 02:12:53 $
 * Version:       $Revision: 1.6 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#include "OpenGL.h"
#include "TextField.h"
#include "WidgetContainer.h"

namespace phui
{
   TextField::TextField(const std::string& text)
      : mText(text)
      , mCursorScreenPosition(0)
      , mCursorCharacterPosition(0)
   {
   }

   void TextField::draw()
   {
      const Size& size = getSize();
      const int width = size.getWidth();
      const int height = size.getHeight();

      // draw the button background
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

      const Insets& i = getInsets();
      int w = width  - i.getLeft() - i.getRight();
      int h = height - i.getTop()  - i.getBottom();
      unsigned int fontHeight = renderer->getHeight(mText.c_str());
      unsigned int fontWidth = renderer->getWidth(mText.c_str());
      unsigned int fontAscent = fontHeight - renderer->getFont()->getDescent();

      int textRectX = i.getLeft();
      int textRectY = i.getTop();
      int textRectW = width  - (i.getRight()  + textRectX);
      int textRectH = height - (i.getBottom() + textRectY);

      int fontX = textRectX;
      int fontY = textRectY;
     
      glPushMatrix();
      glTranslatef(float(fontX), float(fontY), 0);
      renderer->render(mText.c_str());
      glPopMatrix();

      if(hasFocus())
      {
         std::string cursor = "|";
         glPushMatrix();
         glTranslatef(float(fontX + mCursorScreenPosition), float(fontY), 0);
         renderer->render(cursor.c_str());
         glPopMatrix();
         glBegin(GL_LINE_LOOP);
         glVertex2i(0,     0     );
         glVertex2i(width, 0     );
         glVertex2i(width, height);
         glVertex2i(0,     height);
         glEnd();
      }
   }

   void TextField::setText(const std::string& text)
   {
      mCursorScreenPosition = getFontRenderer()->getWidth(text.c_str());
      mCursorCharacterPosition = text.length();

      mText = text;
   }

   const std::string& TextField::getText() const
   {
      return mText;
   }

   void TextField::onKeyDown(InputKey key, InputModifiers modifiers)
   {
      gltext::FontRendererPtr renderer = getFontRenderer();
      std::string toAdd; // if we are to add anything, put it here
      if (key == KEY_RIGHT)
      {
         if (mCursorCharacterPosition < mText.length())
         {
            mCursorScreenPosition += renderer->getWidth(mText.substr(mCursorCharacterPosition,1).c_str());
            mCursorCharacterPosition++;
         }
      }
      else if (key == KEY_LEFT)
      {
         if (mCursorCharacterPosition > 0)
         {
            mCursorCharacterPosition--;
            mCursorScreenPosition -= renderer->getWidth(mText.substr(mCursorCharacterPosition,1).c_str());
         }
      }
      else if(key == KEY_BACKSPACE)
      {
         if (mCursorCharacterPosition > 0)
         {
            mCursorCharacterPosition--;
            mCursorScreenPosition -= renderer->getWidth(mText.substr(mCursorCharacterPosition,1).c_str());
            mText.erase(mCursorCharacterPosition, 1);
         }
      }
      else if (key == KEY_DELETE)
      {
         if (mCursorCharacterPosition < mText.length())
         {
            mText.erase(mCursorCharacterPosition,1);
         }
      }
      else if (key == KEY_SPACE)
      {
         toAdd += ' ';
      }
      else if (key >= KEY_A && key <= KEY_Z)
      {
         if ((modifiers & IMOD_SHIFT) || (modifiers & IMOD_CAPS_LOCK))
         {
            toAdd += (char)(key - KEY_A) + 'A';
         }
         else
         {
            toAdd += (char)(key - KEY_A) + 'a';
         }
      }
      else if (key >= KEY_0 && key <= KEY_9)
      {
         toAdd += (char)(key - KEY_0) + '0';
      }
      else if(key == KEY_PERIOD)
      {
         toAdd += '.';
      }
      else if (key == KEY_MINUS)
      {
         toAdd += '-';
      }

      if (!toAdd.empty())
      {
         mText.insert(mCursorCharacterPosition, toAdd);
         mCursorScreenPosition += renderer->getWidth(toAdd.c_str());
         mCursorCharacterPosition++;
      }
   }
}
