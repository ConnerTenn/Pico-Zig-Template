const std = @import("std");
const pico = @import("pico");
const csdk = pico.csdk;

export fn main() void {
    //Init prints
    pico.stdio.init();
    pico.library.time.sleep_ms(2000);

    pico.stdio.print("== Template ==\n", .{});

    //Init GPIO
    pico.hardware.gpio.default_led.init(pico.hardware.gpio.Pin.Config{
        .direction = .out,
    });

    var toggle = true;
    while (true) {
        // csdk.gpio_put(pico.LED_PIN, toggle);
        pico.hardware.gpio.default_led.put(toggle);

        pico.library.time.sleep_ms(250);
        toggle = !toggle;
    }
}
