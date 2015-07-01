CROSS_COMPILE=
CC := ${CROSS_COMPILE}gcc
CXX := ${CROSS_COMPILE}g++
AR := ${CROSS_COMPILE}ar
LD := ${CROSS_COMPILE}ld
STRIP := ${CROSS_COMPILE}strip

CFLAGS += -O2 -Wall -std=c99
CXXFLAGS += -O2 -Wall -std=c++03

BOOST_USER_CONFIG := using gcc : 4.6.3 : ${CXX} ;
