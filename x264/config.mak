SRCPATH=.
prefix=/home/will/Downloads/android/ffmpeg-android/toolchain-android
exec_prefix=${prefix}
bindir=${exec_prefix}/bin
libdir=${exec_prefix}/lib
includedir=${prefix}/include
ARCH=X86
SYS=LINUX
CC=/home/will/Downloads/android/ffmpeg-android/toolchain-android/bin/i686-linux-android-gcc
CFLAGS=-Wno-maybe-uninitialized -Wshadow -O3 -ffast-math -m32  -Wall -I. -I$(SRCPATH) --sysroot=/home/will/Downloads/android/ffmpeg-android/toolchain-android/sysroot -std=gnu99 -fPIC -fomit-frame-pointer -fno-tree-vectorize
COMPILER=GNU
COMPILER_STYLE=GNU
DEPMM=-MM -g0
DEPMT=-MT
LD=/home/will/Downloads/android/ffmpeg-android/toolchain-android/bin/i686-linux-android-gcc -o 
LDFLAGS=-m32  --sysroot=/home/will/Downloads/android/ffmpeg-android/toolchain-android/sysroot -lm  -ldl
LIBX264=libx264.a
AR=/home/will/Downloads/android/ffmpeg-android/toolchain-android/bin/i686-linux-android-ar rc 
RANLIB=/home/will/Downloads/android/ffmpeg-android/toolchain-android/bin/i686-linux-android-ranlib
STRIP=/home/will/Downloads/android/ffmpeg-android/toolchain-android/bin/i686-linux-android-strip
INSTALL=install
AS=
ASFLAGS= -O2 -DARCH_X86_64=0 -I$(SRCPATH)/common/x86/ -f elf -DSTACK_ALIGNMENT=16 -DPIC -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8
RC=
RCFLAGS=
EXE=
HAVE_GETOPT_LONG=1
DEVNULL=/dev/null
PROF_GEN_CC=-fprofile-generate
PROF_GEN_LD=-fprofile-generate
PROF_USE_CC=-fprofile-use
PROF_USE_LD=-fprofile-use
HAVE_OPENCL=yes
default: lib-static
install: install-lib-static
LDFLAGSCLI = -ldl 
CLI_LIBX264 = $(LIBX264)
