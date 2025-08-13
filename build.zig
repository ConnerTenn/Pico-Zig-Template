const std = @import("std");
const Build = std.Build;
const com = @import("Pico-Zig/build-common.zig");

pub fn build(build_config: *Build) void {
    com.build(
        build_config,
        build_config.path("src/main.zig"),
        .ReleaseSafe,
    );
}
