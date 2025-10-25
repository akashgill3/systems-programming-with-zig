const std = @import("std");
const f = @import("fibonacci.zig");

pub fn main() void {
    const first = f.fibonacci(1);
    const second = f.fibonacci(2);
    const third = f.fibonacci(3);
    const fourth = f.fibonacci(40);
    std.debug.print("typeName: {s} ||| typeInfo: {any} ||| TypeOf: {any}\n", .{ @typeName(f), @typeInfo(f), @TypeOf(f) });
    std.debug.print("{!} {!} {!} {any}\n", .{ first, second, third, @TypeOf(fourth) });
}
