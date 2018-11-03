FROM ubuntu:18.04

MAINTAINER Volker Kempert volker.kempert@almedso.de

RUN apt-get update && apt-get install -y \
  \
  ${IFS# repository tools} \
  git \
  \
  ${IFS# host compilers } \
  gcc \
  g++ \
  g++-multilib \
  gdb \
  \
  ${IFS# build automation tools } \
  cmake \
  cmake-data \
  cmake-curses-gui \
  ninja-build \
  \
  ${IFS# qemu for arm } \
  qemu \
  qemu-system-arm \
  qemu-system-common \
  qemu-utils \
  \
  ${IFS# tooling, documentation and testing } \
  googletest \
  libgtest-dev \
  gcovr \
  doxygen \
  graphviz \
  sloccount \
  software-properties-common # to get add-apt-repository

# Install Arm Compiler from PPA
RUN add-apt-repository ppa:team-gcc-arm-embedded/ppa \
  && apt-get update && apt-get install -y \
  gcc-arm-embedded \
  && rm -rf /var/lib/apt/lists/*

# Prepare google test and google mock appropriately to make cmake (find googletest) work
RUN cd /usr/src/gtest \
  && cmake CMakeLists.txt -GNinja \
  && ninja \
  && cp *.a /usr/lib \
  && mkdir -p /usr/local/lib/gtest \
  && ln -s /usr/lib/libgtest.a /usr/local/lib/gtest/libgtest.a \
  && ln -s /usr/lib/libgtest_main.a /usr/local/lib/gtest/libgtest_main.a

VOLUME [ "/workdir"]
WORKDIR /workdir
CMD [ "/bin/bash" ]

