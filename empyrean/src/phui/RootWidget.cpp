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
 * Date modified: $Date: 2004-06-26 17:02:53 $
 * Version:       $Revision: 1.8 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#include "RootWidget.h"

namespace phui {
   
    RootWidget::RootWidget(int width, int height) {
        mModifiers = IMOD_NONE;
        mSize = Size(width, height);
        mRoot = new Widget;
        mRoot->setSize(mSize);
    }

    void RootWidget::update(float dt) {
        updateWidget(mRoot.get(), dt);
    }

    void RootWidget::draw() const {
        const int width  = mSize.getWidth();
        const int height = mSize.getHeight();

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
            // disable depth testing since all draws occur at the same level
            glDisable(GL_DEPTH_TEST);

            // we need to clip widgets
            glEnable(GL_SCISSOR_TEST);

            // turn on alpha blending
            glEnable(GL_BLEND);
            glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

            drawWidget(mRoot.get());
        glPopAttrib();

        // restore old matrices
        glMatrixMode(GL_MODELVIEW);
        glPopMatrix();
        glMatrixMode(GL_PROJECTION);
        glPopMatrix();
    }

    void RootWidget::add(WidgetPtr w) {
        mRoot->add(w);
    }

    void RootWidget::remove(WidgetPtr w) {
        mRoot->remove(w);
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

    WidgetPtr getRecursiveFocus(WidgetPtr w) {
        if (w) {
            WidgetPtr focus = w->getFocus();
            if (focus) {
                return getRecursiveFocus(focus);
            }
        }
        return w;
    }

    void RootWidget::genKeyDownEvent(InputKey key) {
        mModifiers |= getPlainMod(key);
        mModifiers ^= getStickyMod(key);

        WidgetPtr w = getRecursiveFocus(mRoot);
        if (w) {
            w->onKeyDown(key, mModifiers);
        }
    }

    void RootWidget::genKeyUpEvent(InputKey key) {
        mModifiers &= ~getPlainMod(key);
        mModifiers ^= getStickyMod(key);

        WidgetPtr w = getRecursiveFocus(mRoot);
        if (w) {
            w->onKeyUp(key, mModifiers);
        }
    }

    void RootWidget::genMouseDownEvent(InputButton button, const Point& p) {
        // OnMouseDown always releases capture.
        capture(0);

        if (WidgetPtr widget = getMouseEventTarget(p)) {
            // we'll want to simply ignore this event if widget is disabled
            if (widget->isEnabled()) {
                if (widget->isFocusable()) {
                    focus(widget);
                }
                capture(widget);
                widget->onMouseDown(button, p - getAbsolutePosition(widget));
            }
        } else {
            mRoot->onMouseDown(button, p);
        }
    }

    void RootWidget::genMouseUpEvent(InputButton button, const Point& p) {
        if (WidgetPtr widget = getMouseEventTarget(p)) {
            if (widget->isEnabled()) {
                widget->onMouseUp(button, p - getAbsolutePosition(widget));
            }
        } else {
            mRoot->onMouseUp(button, p);
        }
        capture(0);
    }

    void RootWidget::genMouseMoveEvent(const Point& p) {
        if (WidgetPtr widget = getMouseEventTarget(p)) {
            if (widget->isEnabled()) {
                widget->onMouseMove(p - getAbsolutePosition(widget));
            }
        } else {
            mRoot->onMouseMove(p);
        }
    }

    void RootWidget::focus(WidgetPtr w) {
        while (w->getParent()) {
            w->getParent()->focus(w);
            w = w->getParent();
        }
    }

    void RootWidget::capture(WidgetPtr w) {
        mCapture = w;
    }

    WidgetPtr RootWidget::getMouseEventTarget(const Point& p) const {
        return (mCapture ? mCapture : findWidgetAtPoint(mRoot, p));
    }

    WidgetPtr RootWidget::findWidgetAtPoint(WidgetPtr w, const Point& p) const {
        if (!w) {
            return 0;
        }

        if (WidgetPtr modal = w->getModal()) {
            return findWidgetAtPoint(modal, p - modal->getPosition());
        }
        
        WidgetPtr found = 0;

        // Check this widget.
        if (w->contains(p)) {
            found = w;
        }

        // Check all children.
        for (size_t i = 0; i < w->getChildCount(); ++i) {
            WidgetPtr child = w->getChild(i);
            if (WidgetPtr r = findWidgetAtPoint(child, p - child->getPosition())) {
                found = r;
            }
        }

        return found;
    }

    void RootWidget::updateWidget(WidgetPtr w, float dt) {
        if (w->isEnabled()) {
            w->update(dt);
        }
        for (size_t i = 0; i < w->getChildCount(); ++i) {
            updateWidget(w->getChild(i), dt);
        }
        if (WidgetPtr modal = w->getModal()) {
            updateWidget(modal, dt);
        }
    }

    void RootWidget::drawWidget(WidgetPtr w) {
        glPushMatrix();
        glTranslate(w->getPosition());
        w->draw();

        for (size_t i = 0; i < w->getChildCount(); ++i) {
            drawWidget(w->getChild(i));
        }
        if (WidgetPtr modal = w->getModal()) {
            drawWidget(modal);
        }
        glPopMatrix();
    }

    Point RootWidget::getAbsolutePosition(WidgetPtr w) {
        if (w) {
            return getAbsolutePosition(w->getParent()) + w->getPosition();
        } else {
            return Point(0, 0);
        }
        
    }

}
