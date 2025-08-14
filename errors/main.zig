const std = @import("std");
const Print = std.debug.print;

const MAX_I32: i32 = 2147483647;
const MIN_I32: i32 = -2147483648;

const AddingError = error{ IntegerOVerflowHigh, IntegerOVerflowLow };

fn add(a: i32, b: i32) AddingError!i32 {
    var tmp: i64 = a;
    tmp += b;
    if (tmp > MAX_I32) {
        return AddingError.IntegerOVerflowHigh;
    }
    if (tmp < MIN_I32) {
        return AddingError.IntegerOVerflowLow;
    }
    return a + b;
}

fn run(a: i32, b: i32) void {
    const res = add(a, b);

    if (res) |val| { // if this is not an error store the value in 'val'
        Print("{} + {} = {}\n", .{ a, b, val });
    } else |err| { // if it is an error, store the error in 'err'
        Print("ADD ERR: {} + {} resulted in {}\n", .{ a, b, err });
    }
}

fn run2(a: i32, b: i32) void {
    const res = add(a, b) catch a; // if this func returns set the default val to a
    Print("res: {}\n", .{res});
}

fn run3(a: i32, b: i32) !i32 {
    const res = try add(a, b); // if this func returns set the default val to a
    return res;
}

pub fn main() !void {
    run(MAX_I32, 1);
    run(MIN_I32, -1);
    run(10, 10);
    const x: i32 = run3(MIN_I32, -1) catch MIN_I32;
    Print("{}\n", .{x});
}
