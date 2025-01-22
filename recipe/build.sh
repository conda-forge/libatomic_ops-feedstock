#!/usr/bin/env bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/libtool/build-aux/config.* .

./configure \
  --disable-dependency-tracking \
  --prefix=${PREFIX} \
  --enable-shared \
  --disable-static \

make -j${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
  make check
fi
make install
