#!/bin/bash

# cmake version is passed as first parameter
CMAKE_VERSION=$1

# Download cmake script
wget -q https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.sh -O cmake.sh
ret=$?
if [ $ret -ne 0 ]; then
  echo "Unable to download cmake!"
  exit 1
fi

# Update permissions and create target folder
chmod +x cmake.sh && mkdir /opt/cmake

# Run cmake install script
sh cmake.sh --prefix=/opt/cmake --skip-license

# Remove script to decrease image size
rm cmake.sh

# Link cmake so it is included in PATH
ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake
