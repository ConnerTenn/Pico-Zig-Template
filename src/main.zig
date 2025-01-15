const std = @import("std");
const pico = @import("pico");
const csdk = pico.csdk;

export fn main() void {
    //Init prints
    _ = pico.csdk.stdio_init_all();
    csdk.sleep_ms(2000);

    pico.stdio.print("== Template ==\n", .{});

    //Init GPIO
    csdk.gpio_init(pico.LED_PIN);
    csdk.gpio_set_dir(pico.LED_PIN, pico.GPIO_OUT);

    var toggle = true;
    while (true) {
        csdk.gpio_put(pico.LED_PIN, toggle);
        csdk.sleep_ms(250);
        toggle = !toggle;
    }
}
