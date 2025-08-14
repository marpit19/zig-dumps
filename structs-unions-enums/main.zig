const std = @import("std");
const Print = std.debug.print;

const Number = union(enum) { small: u8, medium: u16, large: u32 };

fn GetUnion() Number {
    const number_union = Number{ .small = 10 };
    return number_union;
}

fn showUnions() void {
    var num = Number{ .small = 200 };
    Print("num = {}\n", .{num.small});
    Print("num type = {}\n", .{@TypeOf(num.small)});
    num.small -= 10;

    num = Number{ .medium = 1000 };
    Print("num = {}\n", .{num.medium});
    Print("num type = {}\n", .{@TypeOf(num.medium)});
    num.medium -= 540;

    num = Number{ .large = 100000 };
    Print("num = {}\n", .{num.large});
    Print("num type = {}\n", .{@TypeOf(num.large)});
    num.large -= 5240;

    Print("num = type: {}", .{@TypeOf(num)});
    Print("\n\n\n", .{});

    const union_val = GetUnion();
    Print("union_val - type '{}', address '{}', val: '{}'\n", .{@TypeOf(union_val), union_val, union_val.small});

    switch (union_val) {
        .small => |s| Print("small: {}\n", .{s}),
        .medium => |m| Print("medium: {}\n", .{m}),
        .large => |l| Print("large: {}\n", .{l}),
    }
}
 

pub fn main() void {
    showUnions();
}
