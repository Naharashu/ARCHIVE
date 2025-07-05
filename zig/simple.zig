const std = @import("std");

pub fn printf(data: []const u8) !void {
	const stdout = std.io.getStdOut().writer();
	try stdout.print("{s}\n", .{data});
}
