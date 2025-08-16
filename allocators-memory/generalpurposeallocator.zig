const std = @import("std");

pub fn main() !void {
    // here we are allocating enough space to store a single integer in the object some_number
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    const some_number = try allocator.create(u32);
    defer allocator.destroy(some_number);

    some_number.* = @as(u32, 45);
}
