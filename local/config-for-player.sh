#!/bin/bash

#
# Change these variables according to your system.
#
PREFIX=./for-player/
#
# Read the configure help carefully before you want to change the following options.
#
../FFmpeg/configure \
	--prefix=$PREFIX \
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
