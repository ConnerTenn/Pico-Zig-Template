
PROJECT_NAME := template

PICO_TARGET := rp2350

include Pico-Zig/makefile

debug:
	@echo $(FILE_DIR)
	@echo $(RUN_DIR)

