from wxPython.wx import *
from wxPython.glcanvas import *

import animmod
import sys

# The Python OpenGL package can be found at
# http://PyOpenGL.sourceforge.net/
from OpenGL.GL import *
from OpenGL.GLUT import *


class PyrFrame(wxFrame):
    def __init__(self):
        wxFrame.__init__(self, None, -1, 'PyrAnim', size=(500,500),
                         style=wxDEFAULT_FRAME_STYLE |
                         wxNO_FULL_REPAINT_ON_RESIZE)
        self.model = animmod.Model()
        self.views = []

        def statusHandler(text, self=self):
            self.SetStatusText(text)

        view = ViewCanvas(self, self.model)
        view.setStatusHandler(statusHandler)
        self.views.append(view)
        self.currView = self.views[0]

        menuBar = wxMenuBar()
        
        menu = wxMenu()
        menuBar.Append(menu, '&File')

        menuID = wxNewId()
        menu.Append(menuID, 'Open &Skeleton...', 'Open Skeleton')
        EVT_MENU(self, menuID, self.OnFileOpenSkeleton)

        menuID = wxNewId()
        menu.Append(menuID, 'Open &Mesh...', 'Open Mesh')
        EVT_MENU(self, menuID, self.OnFileOpenMesh)

        menu.AppendSeparator()

        menuID = wxNewId()
        menu.Append(menuID, 'E&xit', 'Exit Program')
        EVT_MENU(self, menuID, self.OnFileExit)

        self.SetMenuBar(menuBar)
        self.CreateStatusBar()

        # Set up toolbar.
        tb = self.CreateToolBar(wxTB_HORIZONTAL | wxNO_BORDER | wxTB_FLAT)

        def loadBitmap(name):
            im = wxImage('resources/' + name + '.bmp')
            return wxBitmapFromImage(im)

        tbID = wxNewId()
        tb.AddRadioLabelTool(tbID, 'Select', loadBitmap('SelectTool16'),
                             wxNullBitmap, 'Select', 'Select')
        EVT_TOOL(self, tbID, self.OnToolSelectClick)

        tbID = wxNewId()
        tb.AddRadioLabelTool(tbID, 'Rotate', loadBitmap('RotateTool16'),
                             wxNullBitmap, 'Rotate', 'Rotate')
        EVT_TOOL(self, tbID, self.OnToolRotateClick)

        tb.Realize()

        if len(sys.argv) > 1:
            self.model.loadSkeleton(sys.argv[1])

    def OnFileOpenSkeleton(self, event):
        self.model.loadSkeleton('walk1.csf')

    def OnFileOpenMesh(self, event):
        self.model.loadMesh('walk1.cmf')

    def OnFileExit(self, event):
        self.Close()

    def __setTool(self, tool):
        for view in self.views:
            view.setTool(tool)

    def OnToolSelectClick(self, event):
        self.__setTool(0)

    def OnToolRotateClick(self, event):
        self.__setTool(1)

class ViewCanvas(wxGLCanvas):
    def __init__(self, parent, model):
        wxGLCanvas.__init__(self, parent, -1)
        self.hasInitted = false
        self.view = model.newView()
        self.mouseX = 0
        self.mouseY = 0
        self.gotMouse = 0
        self.leftDown = 0
        EVT_ERASE_BACKGROUND(self, self.OnEraseBackground)
        EVT_SIZE         (self, self.OnSize)
        EVT_PAINT        (self, self.OnPaint)
        EVT_LEFT_DOWN    (self, self.OnLeftDown)
        EVT_LEFT_DCLICK  (self, self.OnLeftDown)
        EVT_LEFT_UP      (self, self.OnLeftUp)
        EVT_RIGHT_DOWN   (self, self.OnRightDown)
        EVT_RIGHT_DCLICK (self, self.OnRightDown)
        EVT_RIGHT_UP     (self, self.OnRightUp)
        EVT_MIDDLE_DOWN  (self, self.OnMiddleDown)
        EVT_MIDDLE_DCLICK(self, self.OnMiddleDown)
        EVT_MIDDLE_UP    (self, self.OnMiddleUp)
        EVT_MOTION       (self, self.OnMotion)

        def refreshCallback(self=self):
            self.Refresh()
        self.view.addViewListener(refreshCallback)

    def setStatusHandler(self, handler):
        self.view.addStatusListener(handler)

    def OnEraseBackground(self, event):
        pass

    def OnSize(self, event):
        size = self.GetClientSize()
        self.SetCurrent()
        self.view.setSize(size.width, size.height)

    def OnPaint(self, event):
        dc = wxPaintDC(self)
        self.SetCurrent()
        if not self.hasInitted:
            self.hasInitted = true
            self.view.initGL()
        self.view.draw()
        self.SwapBuffers()

    def OnLeftDown(self, event):
        self.mouseX = event.GetX()
        self.mouseY = event.GetY()
        if not self.gotMouse:
            self.CaptureMouse()
            self.gotMouse = 1
        self.leftDown = 1
        self.view.mouseDown(event.GetX(), event.GetY())

    def OnLeftUp(self, event):
        if self.gotMouse:
            self.ReleaseMouse()
            self.gotMouse = 0
        self.leftDown = 0
        self.view.mouseUp(event.GetX(), event.GetY())

    def OnRightDown(self, event):
        self.mouseX = event.GetX()
        self.mouseY = event.GetY()
        if not self.gotMouse:
            self.CaptureMouse()
            self.gotMouse = 1
        self.view.navMouseDown(event.GetX(), event.GetY())

    def OnRightUp(self, event):
        if self.gotMouse:
            self.ReleaseMouse()
            self.gotMouse = 0
        self.view.navMouseUp(event.GetX(), event.GetY())

    def OnMiddleDown(self, event):
        pass

    def OnMiddleUp(self, event):
        pass

    def OnMotion(self, event):
        if not event.Dragging(): return
        if self.leftDown:
            self.view.mouseMove(event.GetX(), event.GetY())
        else:
            self.view.navMouseMove(event.GetX(), event.GetY())

    def setTool(self, tool):
        self.view.setToolMode(tool)


class PyrApp(wxApp):
    def OnInit(self):
        frame = PyrFrame()
        self.SetTopWindow(frame)
        frame.Show()
        return true

def main():
    app = PyrApp(0)
    app.MainLoop()

if __name__ == '__main__':
    main()
