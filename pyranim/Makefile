CFLAGS=-Wall -O2 -Ic:/python22/include
LFLAGS=-Lc:/python22/libs
LIBS=-lpython22 -lstdc++ -lopengl32 -lglu32
CC=gcc
CXX=g++
SHARED_EXT=.dll
TARGET=animmod$(SHARED_EXT)

CPP_SRCS=animmod.cpp   \
	 Anim.cpp      \
	 Camera.cpp    \
	 IAlgebra.cpp  \
	 Model.cpp     \
	 RotWidget.cpp \
	 Skeleton.cpp  \
	 View.cpp

OBJS=$(CPP_SRCS:%.cpp=%.o)

all: $(TARGET)

run: $(TARGET)
	python pyranim.py c:/src/pyrdata/walk1.csf

count:
	wc `find . -name "*.cpp"` \
	   `find . -name "*.h"`   \
	   `find . -name "*.py"`

$(TARGET): $(OBJS)
	$(CC) -shared -o $@ $(OBJS) $(LFLAGS) $(LIBS)

%.o: %.c
	$(CC) -c -o $@ $(CFLAGS) $<

%.o: %.cpp
	$(CXX) -c -o $@ $(CFLAGS) $<

clean:
	$(RM) $(OBJS)

cleanall: clean
	$(RM) $(TARGET)
	$(RM) *~

animmod.cpp:   Anim.h IAlgebra.h Model.h RotWidget.h View.h
Anim.cpp:      Anim.h IAlgebra.h Model.h
Camera.cpp:    Camera.h IAlgebra.h
IAlgebra.cpp:  IAlgebra.h
Model.cpp:     Model.h Anim.h IAlgebra.h RotWidget.h Skeleton.h View.h
RotWidget.cpp: RotWidget.h IAlgebra.h Camera.h
Skeleton.cpp:  Skeleton.h IAlgebra.h
View.cpp:      View.h Camera.h IAlgebra.h Model.h RotWidget.h Skeleton.h

Anim.h:	       IAlgebra.h
Camera.h:      IAlgebra.h
Model.h:       IAlgebra.h
Skeleton.h:    IAlgebra.h
View.h:        IAlgebra.h RotWidget.h
