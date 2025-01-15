const std = @import("std");
const Build = std.Build;
const com = @import("Pico-Zig/build-common.zig");

pub fn build(build_config: *Build) void {
    // == Create the static libarary ==
    const options = Build.StaticLibraryOptions{
        .name = "template",
        .optimize = build_config.standardOptimizeOption(Build.StandardOptimizeOptionOptions{
            .preferred_optimize_mode = .ReleaseFast,
        }),
        .target = build_config.standardTargetOptions(Build.StandardTargetOptionsArgs{
            .default_target = com.rp2040_target,
        }),
        .root_source_file = build_config.path("src/main.zig"),
    };

    const lib = build_config.addStaticLibrary(options);

    // == Add the pico module ==
    const pico_module = build_config.addModule("pico", .{
        .root_source_file = build_config.path("Pico-Zig/pico.zig"),
    });

    lib.root_module.addImport("pico", pico_module);

    // == Add the required includes ==
    com.addPicoIncludes(build_config, pico_module);
    com.addArmIncludes(build_config, pico_module);

    // == Define the install artifact ==
    const lib_artifact = build_config.addInstallArtifact(lib, .{});

    const build_step = build_config.step("build", "Build the application static library");
    build_step.dependOn(&lib_artifact.step);
}
