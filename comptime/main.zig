const std = @import("std");
const print = std.debug.print;

const AddingError = error{ IntegerOVerflowHigh, IntegerOVerflowLow, Overflow };

fn add_i8(a: i8, b: i8) AddingError!i8 {
    if (a + b > 127) {
        return AddingError.Overflow;
    }
    return a + b;
}

fn ShowComptime() void {}

pub fn main() void {
    ShowComptime();
}
