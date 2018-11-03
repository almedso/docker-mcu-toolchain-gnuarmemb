# Toolchain Container for CORTEX-M MCU with cmake and gtest

This is a toolchain container definition to encapsulate
the toolchain to your machine

Contained tools:

Compiler:

* gcc (7) on host
* gnuarmemb

Builder:

* cmake
* ninja

Documentation:

* doxygen
* graphviz

Testing helper:

* google test
* google mock
* gcovr

Arbitrary helper:

* git
* sloccount

Simulation:

* qemu for arm

## How to build

```
$ cd <docker project home>  # this dir where Dockerfile is
$ docker -t almedso/mcu-toolchain-gnuarmemb .
$ docker tag almedso/mcu-toolchain-gnuarmemb almedso/mcu-toolchain-gnuarmemb:1 # This is version 1
$ docker push almedso/mcu-toolchain-gnuarmemb
```

## How to use

* Inject your project directory as volume
* Run the docker container with your user ID
  
```
$ cd <project home>
$ docker run  -it --rm --user $(id -u) --volume $(pwd):/workdir almedso/mcu-toolchain-gnuarmemb
```

Do whatever you plan to **build** (mcu image, documentation),
**unit test**, **debug** and/or **simulate** inside the container and *exit*.
e.g. for a release build:

```
..:workdir $ mkdir build
..:workdir $ cd build
..:workdir $ cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
..:workdir $ ninja
..:workdir $ exit  # will finish the container
```

and retrieve the results in *build* directory.

Enjoy building :-).

