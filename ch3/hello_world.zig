const std = @import("std");

pub fn main() !void {
    const stdout_file = std.fs.File.stdout();

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = stdout_file.writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    try stdout.writeAll("All your codebase belong to us yet again!");
    try stdout.flush();
}
