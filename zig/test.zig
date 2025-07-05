pub const std = @import("std");
pub const builtin = @import("builtin");
pub const str = []const u8;
pub const println = std.debug.print;

pub const stdout = std.io.getStdOut().writer();

pub const zigError = error{ StackOverflow, UnreachableIndex, UnsupportedType, UnsupportedChar, RuntimeError, SyntaxError, ParsingError, ValueError, ZigInternalErrorOfSyntax, ZigInternalErrorOfRuntime };
