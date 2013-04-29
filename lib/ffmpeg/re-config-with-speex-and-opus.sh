bash $1 ./configure \
--extra-cflags='-g -O -std=gnu99 -no_compact_linkedit -no-cpp-precomp -arch i386 -D_DEBUG -Wall  -w -D_DARWIN_C_SOURCE \
-L/usr/local/lib -Dattribute_deprecated=' \
--target-os=darwin \
--disable-muxers \
--disable-encoders \
--disable-devices \
--disable-doc \
--disable-ffplay \
--disable-ffmpeg \
--disable-ffprobe \
--disable-ffserver \
--disable-vda \
--disable-crystalhd \
--disable-decoder=mpeg_xvmc \
--disable-amd3dnow \
--disable-libvorbis \
--enable-gpl \
--enable-postproc \
--enable-static \
--enable-pthreads \
--enable-muxer=spdif \
--enable-muxer=adts \
--enable-encoder=ac3 \
--enable-encoder=aac \
--enable-protocol=http \
--enable-runtime-cpudetect \
--enable-libopus \
--enable-libspeex \
--cc="clang -m32"

# --cc="clang"
# --as=/Applications/Xcode.app/Contents/Developer/usr/bin/as
