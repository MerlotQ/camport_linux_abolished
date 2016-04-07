CURDIR := .

CROSS_COMPILE	:= $(CROSS_COMPILE)
CC  	:= $(CROSS_COMPILE)gcc

SYS	:= $(shell $(CC) -dumpmachine)

COMMON_CFLAGS := -g -O2 -Wall -std=gnu++11

CFLAGS	:= $(COMMON_CFLAGS) -fPIC
CFLAGS	+= -I$(CURDIR)/include

LIB_CFLAGS := $(CFLAGS) $(COMMON_CFLAGS)
LIB_CFLAGS += -shared -fPIC -fvisibility=hidden -fvisibility-inlines-hidden

LIBS    += -lstdc++ -lpthread -ljpeg  -lusb-1.0 -lopencv_core -lm
LIBS	+= -lopencv_imgproc -lopencv_highgui -lopencv_contrib

OBJS	:= $(addsuffix .o , $(basename $(SOURCES)))

TOPDIR  := $(shell pwd)

LIBCAM	:= libcamm.so
CAM_TEST := cam_test

TEST_CFLAGS := $(COMMON_CFLAGS)  -I$(CURDIR)/include
TEST_SRC := $(wildcard $(CURDIR)/*.cpp)

all: $(CAM_TEST)

$(CAM_TEST): $(TEST_SRC)
	$(CC) $(TEST_CFLAGS) $(TEST_SRC) -o $(CAM_TEST)  $(LDFLAGS) $(LIBS) -L ./lib  -lcamm

clean:
	rm -rf $(OBJS) $(CAM_TEST)
