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
 * File:          $RCSfile: ListBox.cpp,v $
 * Date modified: $Date: 2004-06-05 02:23:23 $
 * Version:       $Revision: 1.8 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#include <algorithm>
#include <assert.h>

#include "OpenGL.h"
#include "ListBox.h"

namespace phui
{
   ListBox::ListBox()
   {
      mSelectedItem = -1;
   }

   void ListBox::draw() const
   {
      const Size& size = getSize();
      const int width = size.getWidth();
      const int height = size.getHeight();

      // draw the box background
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

      gltext::FontPtr font = getFont();
      gltext::FontRendererPtr renderer = getFontRenderer();

      int fontHeight = font->getAscent() + font->getDescent();
      int fontLineGap = font->getLineGap();

      glPushMatrix();
      glTranslatef(3.0f, 0.0f, 0.0f);
      for (int x = 0; x < int(mItems.size()); ++x)
      {
         glTranslatef(0.0, float(fontLineGap + fontHeight), 0.0);
         if (mSelectedItem == x)
         {
            // draw the selected box
            glColor(getForegroundColor());
            glPushMatrix();
            glTranslatef(-3.0, float(-(fontHeight+2)), 0.0);
            glBegin(GL_TRIANGLE_FAN);
            {
               glVertex2i(0,     0);//fontHeight*x);
               glVertex2i(width, 0);//fontHeight);//*x);
               glVertex2i(width, fontHeight+3);//*(x+1));
               glVertex2i(0,     fontHeight+3);//*(x+1));
            }
            glEnd();
            glColor(getBackgroundColor());
            glPopMatrix();
         }

         renderer->render(mItems[x].c_str());
         if (mSelectedItem == x)
         {
            glColor(getForegroundColor());
         }
      }
      glPopMatrix();
   }

   void ListBox::add(const std::string& text)
   {
      mItems.push_back(text);
   }

   void ListBox::add(const std::vector<std::string>& items)
   {
      for (size_t i = 0; i < items.size(); ++i) {
         add(items[i]);
      }
   }

   void ListBox::remove(unsigned int idx)
   {
      if (idx < mItems.size())
      {
         mItems.erase(mItems.begin() + idx);

         if (static_cast<int>(idx) == mSelectedItem) 
         {
            mSelectedItem = -1;
         }
      }
   }

   void ListBox::clear() 
   {
      mSelectedItem = -1;
      mItems.clear();
   }

   const std::string& ListBox::get(unsigned int idx) const
   {
      assert(idx < mItems.size() && "Out of bounds!");
      return mItems[idx];
   }

   int ListBox::getSelectedIndex() const
   {
      return mSelectedItem;
   }

   void ListBox::onMouseDown(InputButton button, const Point& p)
   {
      if (button == BUTTON_LEFT)
      {
         gltext::FontPtr font = getFont();

         unsigned int itemHeight = font->getAscent() + font->getDescent() + font->getLineGap();

         unsigned int selectedIdx = (unsigned int)((p.y-(p.y%itemHeight))/double(itemHeight));
         // Check that the computed index isn't outside our list of values
         if (selectedIdx < mItems.size())
         {
            mSelectedItem = selectedIdx;
            fireListSelectionEvent(mSelectedItem);
         }
      }
   }

   void ListBox::addListSelectionListener(ListSelectionListenerPtr listener)
   {
      mListeners.push_back(listener);
   }

   void ListBox::removeListSelectionListener(ListSelectionListenerPtr listener)
   {
      ListenerIter itr = std::find(mListeners.begin(), mListeners.end(), listener);
      if (itr != mListeners.end())
      {
         mListeners.erase(itr);
      }
   }

   void ListBox::fireListSelectionEvent(int selectedIdx)
   {
      ListSelectionEvent evt(this, selectedIdx);

      for (ListenerIter itr=mListeners.begin(); itr!=mListeners.end(); itr++)
      {
         (*itr)->onListSelection(evt);
      }
   }
}
