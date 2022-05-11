FROM mcr.microsoft.com/dotnet/sdk:6.0-focal AS build

# Arguments that may be overridden by the user
ARG DOCKER_VERSION=20.10.0
ARG CMAKE_VERSION=3.19.2

# Install required packages
RUN apt-get update && apt-get -y install software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test && apt-get update && apt-get -y install gcc-9 g++-9 build-essential make libc6 curl pkg-config npm zip tar unzip git wget

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-9

# Install cmake from script
ADD install_cmake.sh /
RUN chmod u+x /install_cmake.sh && /install_cmake.sh $CMAKE_VERSION && rm install_cmake.sh

# Install Doxygen
ADD install_doxygen.sh /
RUN chmod u+x /install_doxygen.sh && /install_doxygen.sh && rm -f install_doxygen.sh

# Install Doxybook2
ADD install_doxybook2.sh /
RUN chmod u+x /install_doxybook2.sh && /install_doxybook2.sh && rm -f install_doxybook2.sh

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install libusb-1.0-0 libcurl3-gnutls libpq5 openssl tar ca-certificates clang-7 && rm -rf /var/lib/apt/lists/*

RUN wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb && rm packages-microsoft-prod.deb

RUN apt-get update; \
  apt-get install -y apt-transport-https && \
  apt-get update && \
  apt-get install -y dotnet-sdk-3.1

# Install docker cli
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
  && tar xzvf docker-${DOCKER_VERSION}.tgz --strip 1 \
                 -C /usr/local/bin docker/docker \
  && rm docker-${DOCKER_VERSION}.tgz
