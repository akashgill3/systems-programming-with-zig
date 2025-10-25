const std = @import("std");

pub fn main() !void {
    const produce = [_][]const u8{ "carrots", "peas", "dragonfruit", "avocados" };
    const counts = [_]i32{ 32, 96, 7, 0 };
    for (produce, counts, 0..) |name, count, i| {
        std.debug.print("{s}. {any}: {any}\n", .{ name, count, i + 1 });
    }

    std.debug.print("{any}\n", .{indexOf(&counts, 1)});
    std.debug.print("{any}\n", .{collatzIterations(124891274)});
}

fn indexOf(items: []const i32, value: i32) error{NotFound}!usize {
    return for (items, 0..) |item, i| {
        if (item == value) {
            break i;
        }
    } else error.NotFound;
}

fn collatzIterations(start: usize) usize {
    var count: usize = 0;
    var n = start;
    while (n != 1) : (count += 1) {
        if (n % 2 == 0) {
            n = @divExact(n, 2);
        } else {
            n = 3 * n + 1;
        }
    }

    return count;
}
