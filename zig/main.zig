const utils = @import("test.zig");

pub fn main() !void {
    utils.println("Hello from main using utils", .{});
}
