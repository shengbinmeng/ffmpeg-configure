#!/bin/bash

#
# Set the CPU architecture you want to build for.
#
IOS_ARCH=arm64

PREFIX=./for-player/${IOS_ARCH}
TOOLCHAIN=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain
if [ "$IOS_ARCH" = "i386" -o "$IOS_ARCH" = "x86_64" ]
then
	SYSROOT=$(xcrun -sdk iphonesimulator --show-sdk-path)
else
	SYSROOT=$(xcrun -sdk iphoneos --show-sdk-path)
fi

#
# Read the configure help carefully before you want to change the following options.
#
../FFmpeg/configure \
	--prefix=${PREFIX} \
	--enable-cross-compile \
	--cross-prefix=${TOOLCHAIN}/usr/bin/ \
	--target-os=darwin \
	--arch=${IOS_ARCH} \
	--sysroot=${SYSROOT} \
	--extra-cflags="-O2 -arch ${IOS_ARCH}" \
	--extra-ldflags="-arch ${IOS_ARCH} -isysroot ${SYSROOT}" \
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
