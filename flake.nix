# SPDX-FileCopyrightText: 2025 Conner Tenn
#
# SPDX-License-Identifier: 0BSD

{
  description = "Dev shell loader";

  inputs = {
    # Reference the flake in the Pico-Zig library
    pico-zig.url = "path:./Pico-Zig";
  };

  outputs = { self, pico-zig }: (pico-zig);
}
