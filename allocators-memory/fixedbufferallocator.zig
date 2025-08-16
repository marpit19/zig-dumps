const std = @import("std");

pub fn main() !void {
    var buffer: [10]u8 = undefined;
    for (0..buffer.len) |i| {
        buffer[i] = 0; // initalize with zero
    }

    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = fba.allocator();
    const input = try allocator.alloc(u8, 5);
    defer allocator.destroy(input);

    // we are creating a buffer obj on the stack that is 10 elements long
    // this means that we are limited to this sapce and cannot allocate more than 10 elements with this allocator object if we do it it will return an OutOfMemory error value
}
