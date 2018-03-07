#!/bin/bash

#
# Change these variables according to your system.
#
TOOLCHAIN=${ANDROID_NDK}/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
PLATFORM=${ANDROID_NDK}/platforms/android-21/arch-arm
PREFIX=./for-player/armv7

#
# Read the configure help carefully before you want to change the following options.
#
../FFmpeg/configure \
	--prefix=$PREFIX \
	--enable-cross-compile \
	--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
	--target-os=linux \
	--arch=arm \
	--sysroot=$PLATFORM \
	--extra-cflags="-O2 -fPIC -march=armv7-a -mfpu=neon -mfloat-abi=softfp" \
	--extra-ldflags="-pie" \
	--enable-gpl \
	--enable-version3 \
	--enable-nonfree \
	--disable-doc \
	--disable-debug \
	--disable-avdevice \
	--disable-postproc \
	--disable-devices \
	--disable-filters \
	--disable-bsfs \
	--disable-zlib \
	--disable-bzlib \
	--disable-encoders \
	--disable-muxers
