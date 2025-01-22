cmake %CMAKE_ARGS% ^
  -G Ninja ^
  -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
  -Dbuild_tests=ON ^
  -DBUILD_SHARED_LIBS=ON ^
  .

ninja -j%CPU_COUNT%
ninja install

ctest
