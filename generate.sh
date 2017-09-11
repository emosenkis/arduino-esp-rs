#!/bin/bash
# This script should be run from the toplevel directory of a local copy of https://github.com/esp8266/Arduino/

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


bindgen \
   --use-core \
   --ctypes-prefix libc \
   --rustfmt-bindings \
   --raw-line '#![no_std]' \
   --raw-line '#![allow(non_snake_case,non_camel_case_types,non_upper_case_globals)]' \
   --raw-line 'extern crate libc;' \
   cores/esp8266/Esp.h \
   -- \
   -I"${HOME}/.platformio/packages/toolchain-xtensa/lib/gcc/xtensa-lx106-elf/4.8.2/include" \
   -Itools/sdk/libc/xtensa-lx106-elf/include \
   -Itools/sdk/include  \
   -Ivariants/nodemcu \
   -Icores/esp8266 \
   -x c++ \
   -std=c++14 \
   -nostdinc \
   > "${DIR}/src/lib.rs"
