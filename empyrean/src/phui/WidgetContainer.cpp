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
 * Date modified: $Date: 2004-04-26 00:39:44 $
 * Version:       $Revision: 1.10 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#include "NullLayout.h"
#include "OpenGL.h"
#include "WidgetContainer.h"

namespace phui {

    WidgetContainer::WidgetContainer(LayoutPtr layout) {
        if (!layout) {
            layout = new NullLayout();
        }
        mLayout = layout;
    }

    WidgetContainer::~WidgetContainer() {
        while (!mWidgets.empty()) {
            remove(mWidgets[0]);
        }
    }

    void WidgetContainer::add(WidgetPtr widget) {
        // First remove the widget from its old parent.
        if (widget->getParent()) {
            widget->getParent()->remove(widget);
        }

        // Now add the widget to this container.
        mWidgets.push_back(widget);
        widget->setParent(this);
        
        mLayout->layout(this);
    }

    void WidgetContainer::remove(WidgetPtr widget) {
        for (size_t i = 0; i < mWidgets.size(); ++i) {
            if (mWidgets[i] == widget) {
                mWidgets.erase(mWidgets.begin() + i);
                widget->setParent(0);
                
                mLayout->layout(this);
            }
        }
    }

    WidgetPtr WidgetContainer::getChild(size_t idx) {
        return mWidgets[idx];
    }

    size_t WidgetContainer::getNumChildren() {
        return mWidgets.size();
    }

    void WidgetContainer::draw() {
        // Draw all children.  Draw backwards so it's from the back to the
        // front, visually.
        for (size_t i = 0; i < mWidgets.size(); ++i) {
            drawWidget(mWidgets[i]);
        }
        
        // Draw the modal window last.
        if (mModalWidget) {
            drawWidget(mModalWidget);
        }
    }

    void WidgetContainer::update(float dt) {
        for (size_t i = 0; i < mWidgets.size(); ++i) {
            mWidgets[i]->update(dt);
        }
    }

    void WidgetContainer::onKeyDown(InputKey key, InputModifiers modifiers) {
        WidgetContainerPtr kungFuDeathGrip = this;
        if (WidgetPtr focus = getFocus()) {
            focus->onKeyDown(key, modifiers);
        }
    }

    void WidgetContainer::onKeyUp(InputKey key, InputModifiers modifiers) {
        WidgetContainerPtr kungFuDeathGrip = this;
        if (WidgetPtr focus = getFocus()) {
            focus->onKeyUp(key, modifiers);
        }
    }

    void WidgetContainer::onMouseDown(InputButton button, const Point& p) {
        WidgetContainerPtr kungFuDeathGrip = this;

        // OnMouseDown always releases capture.
        capture(0);

        if (WidgetPtr widget = getMouseWidget(p)) {
            // we'll want to simply ignore this event if widget is disabled
            if (widget->isEnabled()) {
                focus(widget);
                capture(widget);
                widget->onMouseDown(button, p - widget->getPosition());
            }
        }
    }

    void WidgetContainer::onMouseUp(InputButton button, const Point& p) {
        WidgetContainerPtr kungFuDeathGrip = this;

        if (WidgetPtr widget = getMouseWidget(p)) {
            // we'll want to simply ignore this event if widget is disabled
            if (widget->isEnabled()) {
                widget->onMouseUp(button, p - widget->getPosition());
                capture(0);
            }
        }
    }

    void WidgetContainer::onMouseMove(const Point& p) {
        WidgetContainerPtr kungFuDeathGrip = this;

        if (WidgetPtr widget = getMouseWidget(p)) {
            // we'll want to simply ignore this event if widget is disabled
            if (widget->isEnabled()) {
                widget->onMouseMove(p - widget->getPosition());
            }
        }
    }
    
    void WidgetContainer::setSize(const Size& size) {
        Widget::setSize(size);
        mLayout->layout(this);
    }

    void WidgetContainer::focus(WidgetPtr widget) {
        if (!widget->isFocusable()) {
            return;
        }
   
        // Bring the widget to the end of the list.
        for (int i = 0; i < int(mWidgets.size()) - 1; ++i) {
            if (mWidgets[i] == widget) {
                std::swap(mWidgets[i], mWidgets[i + 1]);
            }
        }
    }

    WidgetPtr WidgetContainer::getFocus() {
        if (mModalWidget) {
            return mModalWidget;
        }
        
        WidgetPtr null;
        return (mWidgets.empty() ? null : mWidgets.back());
    }

    void WidgetContainer::capture(WidgetPtr widget) {
        mCapturedWidget = widget;
    }

    WidgetPtr WidgetContainer::getCapture() {
        return mCapturedWidget;
    }
   
    void WidgetContainer::setModal(WidgetPtr dialog) {
        mModalWidget = dialog;
    }

    WidgetPtr WidgetContainer::getWidgetAt(const Point& p) {
        for (int i = int(mWidgets.size() - 1); i >= 0; --i) {
            WidgetPtr wgt = mWidgets[i];

            // Make sure the widget is visible
            if (wgt->isVisible()) {
                // Check if this widget contains the given point
                if (wgt->contains(p - wgt->getPosition())) {
                    return mWidgets[i];
                }
            }
        }
        return 0;
    }

    WidgetPtr WidgetContainer::getMouseWidget(const Point& p) {
        if (mModalWidget) {
            return mModalWidget;
        }

        if (WidgetPtr widget = getCapture()) {
            return widget;
        }
        
        return getWidgetAt(p);
    }

    void WidgetContainer::drawWidget(WidgetPtr widget) {
        if (widget->isVisible()) {
            glPushMatrix();
            glTranslate(widget->getPosition());
            widget->draw();
            glPopMatrix();
        }
    }
}
