const std = @import("std");
const builtin = @import("builtin");

pub fn ssr(code: i128) !i128 {
    const x: i128 = code + 1;
    const y: i128 = std.time.nanoTimestamp();
    const z = code ^ (101302032103 + y) << 3;
    var res: i128 = (x ^ (code + 23)) ^ (y ^ z) - 10120 ^ 132;
    res = (res - 2833284723) ^ 138;
    if (res == 0) {
        std.debug.print("Error in ssr\n", .{});
        return -1;
    }
    return res ^ y;
}

pub fn main() !void {
    const x = ssr(1);
    std.debug.print("{any}\n", .{x});
}
