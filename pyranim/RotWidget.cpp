#include "RotWidget.h"
#include <stdio.h>

RotWidget::RotWidget() {
    m_listener = NULL;
}

RotWidget::~RotWidget() {
}

void RotWidget::draw() {
    printf("RotWidget::draw\n"); fflush(stdout);
}

void RotWidget::setRotation(const IPoint &quat) {
    printf("RotWidget::setRotation\n"); fflush(stdout);
}

void RotWidget::setListener(RotWidgetListener *listener) {
    m_listener = listener;
}

bool RotWidget::mouseDown(int x, int y) {
    printf("RotWidget::mouseDown\n"); fflush(stdout);
    return false;
}

bool RotWidget::mouseMove(int x, int y) {
    printf("RotWidget::mouseMove\n"); fflush(stdout);
    return false;
}

bool RotWidget::mouseUp(int x, int y) {
    printf("RotWidget::mouseUp\n"); fflush(stdout);
    return false;
}


