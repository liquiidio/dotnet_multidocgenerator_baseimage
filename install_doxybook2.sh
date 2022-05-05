#wget -v -O doxybook2.zip https://github.com/matusnovak/doxybook2/releases/download/v1.4.0/doxybook2-linux-amd64-v1.4.0.zip && unzip doxybook2.zip && rm -f doxybook2.zip

git clone https://github.com/microsoft/vcpkg
./vcpkg/bootstrap-vcpkg.sh

git clone https://github.com/matusnovak/doxybook2.git
cd doxybook2

git checkout tags/v1.4.0

# Install dependencies via vcpkg
# The 'vcpkg.txt' file contains the list of dependencies to install
../vcpkg/vcpkg install --triplet x64-linux $(cat vcpkg.txt)

ls
# Configure the project and use vcpkg toolchain
mkdir build
cd build
cmake -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TOOLCHAIN_FILE=../../vcpkg/scripts/buildsystems/vcpkg.cmake -DCMAKE_INSTALL_PREFIX=/bin/doxybook2 ..
# Build it
cmake --build .

cd src
cd DoxybookCli
cp doxybook2 /bin
