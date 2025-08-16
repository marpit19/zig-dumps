const std = @import("std");

pub fn main() !void {
    // a generalpurposeallocator obj as input to the ArenaAllocator() constructor
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var aa = std.heap.ArenaAllocator.init(gpa.allocator());
    defer aa.deinit();
    const allocator = aa.allocator();

    const in1 = try allocator.alloc(u8, 5);
    const in2 = try allocator.alloc(u8, 10);
    const in3 = try allocator.alloc(u8, 15);
    _ = in1;
    _ = in2;
    _ = in3;
}
