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

## How to build

```
$ cd <docker project home>  # this dir where Dockerfile is
$ docker -t almedso/mcu-toolchain-gnuarmemb .
$ docker tag almedso/mcu-toolchain-gnuarmemb almedso/mcu-toolchain-gnuarmemb:1
$ docker push almedso/mcu-toolchain-gnuarmemb
```

## How to use

```
$ cd <project home>
$ docker run  -it --rm --user $(id) --volume $(pwd):/workdir almedso/mcu-toolchain-gnuarmemb
```