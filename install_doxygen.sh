apt-get update && apt-get install -y software-properties-common && apt-add-repository universe #&& apt-get update && apt-get install -y doxygen

#download doxygen
git clone https://github.com/doxygen/doxygen.git
cd doxygen

#build doxygen
mkdir build
cd build
cmake -G "Unix Makefiles" ..
make

# install doxygen
make install

cd ../..

npm install gitbook-cli -g
