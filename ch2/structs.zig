const std = @import("std");

const Rectangle = struct {
    width: i32,
    height: i32,

    fn quadruple(self: *Rectangle) void {
        self.width *= 2;
        self.height *= 2;
    }

    fn size(self: Rectangle) i32 {
        return self.width * self.height;
    }
};

pub fn main() !void {
    const arr = [_]i32{ 11, 22, 33, 44, 55 };
    const range = arr[1..4]; // #1

    std.debug.print("range: {any}\n", .{range});

    const stdout_file = std.fs.File.stdout();

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = stdout_file.writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    try stdout.writeAll("All your codebase still belong to us!\n");
    try stdout.flush();

    const rect = Rectangle{ .width = 20, .height = 30 };
    const rect_size = rect.size();
    std.debug.print("rect size using method syntax: {}\n", .{rect_size});
    const rect_size2 = Rectangle.size(rect);
    std.debug.print("rect size using function syntax: {}\n", .{rect_size2});

    var rect_new = Rectangle{ .width = 10, .height = 20 };
    rect_new.quadruple();
    std.debug.print("quadrupled rect: {}\n", .{rect_new.size()});

    Rectangle.quadruple(&rect_new);
    std.debug.print("quadrupled rect again: {}\n", .{rect_new.size()});
}
