const std = @import("std");
const builtin = @import("builtin");
const str = []const u8;

const hashError = error{ UnsupportedCharError, SmallDataError, BigDataError };

pub fn printf(data: []const u8) !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("{s}\n", .{data});
}

pub fn hash(data: str) hashError!i128 {
    if (data.len < 1) return hashError.SmallDataError;
    if (data.len >= 256) return hashError.BigDataError;
    for (data) |c| {
        if (c < 33 or c > 126) return hashError.UnsupportedCharError;
    }
    var i: usize = 0;
    var res: i128 = 0;
    while (i < data.len) {
        res += data[i] ^ i;
        res += (i ^ 3112) ^ data[i];
        res ^= data[i] ^ 23;
        res ^= (data[i] ^ 0xff) ^ res;
        res = res ^ (data[i] ^ 3);
        res = res ^ 3;
        i += 1;
    }
    return (res ^ 0xfffffffffff);
}

pub fn main() !void {
    const hash_: i128 = try hash("\n");
    std.debug.print("{}\n", .{hash_});
}
