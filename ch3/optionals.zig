const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const numbers = [_]i32{ 1, 2, 3 };

    if (indexOf(&numbers, 4)) |index_of_4| {
        print("index of 4: {}\n", .{index_of_4});
    } else {
        print("35 not found.\n", .{});
    }

    const index_of_3 = indexOf(&numbers, 3).?;
    print("index of 3: {}\n", .{index_of_3});

    const index_of_6 = indexOf(&numbers, 6) orelse {
        return error.SixNotFound;
    };
    print("index of 6: {}\n", .{index_of_6});
}

fn indexOf(items: []const i32, value: i32) ?usize {
    return for (items, 0..) |item, i| {
        if (item == value) {
            break i;
        }
    } else null;
}
