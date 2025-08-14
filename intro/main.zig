const std = @import("std");
const print = std.debug.print;
const TestFile = @import("test.zig");

pub fn main() void {
    const num_1 = 10;
    var num_2: i32 = 10; // var variables must be mutated

    const isTrue: bool = true;
    var isFalse: bool = false;

    const letter: u8 = 'a';
    const wordArray = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
    const word: []const u8 = "hello";

    const specific_number: i5 = 1; // create an integer with 5 bits
    const word_2 = "what are you doing!?!?";

    _ = num_1;
    num_2 = 2;
    _ = isTrue;
    isFalse = false;
    _ = letter;
    _ = wordArray;
    _ = word;
    _ = specific_number;

    std.debug.print("hello", .{});
    Function(100);
    print("word = {s}\n", .{word_2}); // s here is slice, "s" is a pointer with a length
    
    const x = TestFile.a_new_func(12, 10);
    print("12 + 10 = {}\n", .{x});
}

fn Function(num_1: i32) void {
    var num_1_mut: i32 = num_1;
    num_1_mut += 10;
}
