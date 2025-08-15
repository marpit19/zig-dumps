const std = @import("std");
const testing = std.testing;

fn add(a: i32, b: i32) i32 {
    return a + b;
}

// put your tests close to what they're testing
test "basic add func" {
    try testing.expect(add(3, 10) == 13);
}

fn sub(a: i32, b: i32) i32 {
    return a - b;
}

// put your tests close to what they're testing
test "basic sub func" {
    try testing.expect(sub(3, 10) == -7);
}

const Foo = struct {
    a: bool,
    b: u8,
    c: []const usize,
    d: []const u8,

    fn new(flag: bool) Foo {
        return if (flag) .{
            .a = true,
            .b = 1,
            .c = &[_]usize{ 1, 2, 3 },
            .d = "Hello",
        } else .{
            .a = false,
            .b = 0,
            .c = &[_]usize{ 4, 5, 6 },
            .d = "Bye",
        };
    }

    // You can have tests in any container.
    test "Inside Foo" {
        try testing.expect(true);
    }
};

test "new Foo: true" {
    const foo = Foo.new(true);
    try testing.expect(foo.a);
    try testing.expectEqual(@as(u8, 1), foo.b);
    try testing.expectEqualSlices(usize, &[_]usize{ 1, 2, 3 }, foo.c);
    try testing.expectEqualStrings("Hello", foo.d);
}

const Error = error{Boom};

fn harmless() Error!void {
    return error.Boom;
}

// You can test for a specific error too.
test "explosive error" {
    try testing.expectError(error.Boom, harmless());
}

pub fn main() void {}
