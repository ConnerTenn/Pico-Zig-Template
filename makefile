
PROJECT_NAME := template

# rp2040, rp2350, rp2350-riscv, rp2350-arm-s
PICO_PLATFORM := rp2350-arm-s
# See pico-sdk/src/boards/include/boards
# pico, pico_w, pico2, pico2_w
PICO_BOARD := pico2
# /dev/disk/by-label/<name>
PICO_DEV := /dev/disk/by-label/RP2350

include Pico-Zig/rules.mk


