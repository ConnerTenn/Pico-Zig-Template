const std = @import("std");
const pico = @import("pico");
const csdk = pico.csdk;

export fn main() void {
    //Init prints
    _ = pico.csdk.stdio_init_all();
    csdk.sleep_ms(2000);

    pico.stdio.print("== Template ==\n", .{});

    //Init GPIO
    pico.hardware.gpio.default_led.init(pico.hardware.gpio.Gpio.Config{
        .direction = .out,
    });

    var toggle = true;
    while (true) {
        // csdk.gpio_put(pico.LED_PIN, toggle);
        pico.hardware.gpio.default_led.put(toggle);

        csdk.sleep_ms(250);
        toggle = !toggle;
    }
}
