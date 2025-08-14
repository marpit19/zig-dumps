const std = @import("std");
const Print = std.debug.print;
const TestFile = @import("test.zig");

pub fn main() void {
    const char_1: u8 = 'a';

    Print("single char (): {}\n", .{char_1}); // print number
    Print("single char (c): {c}\n", .{char_1}); // print letter

    const char_arr = [5]u8{ 'H', 'e', 'l', 'l', 'o' }; // collection of letterss
    const char_slice: []const u8 = "Hello"; // slice of chars
    const inferred_arr_slice = char_arr[0..]; // slice of the first array
    const inferred_slice = "hello"; // inferred slice of u8 chars
    const char_slice2: []const u8 = char_arr[0..3]; // smaller slice of the first arr

    Print("char_arr: {c}{c}{c}{c}{c}", .{ char_arr[0], char_arr[1], char_arr[2], char_arr[3], char_arr[4] });
    Print("\nchar slice: {s}", .{char_slice});
    Print("\ninferred arr slice: {s}\n", .{inferred_arr_slice});
    Print("inferred_slice: {s}\n", .{inferred_slice});
    Print("char_slice2: {s}\n", .{char_slice2});

    const n: i32 = 10;
    const n_arr = [_]i32{ 1, 2, 3 }; // arr of numbers
    const n_slice = n_arr[0..];

    Print("\nPrint number: {}\n", .{n});
    Print("number arr: {},{},{}\n", .{ n_arr[0], n_arr[1], n_arr[2] });

    // Loops
    Print("n_slice: ", .{});
    for (n_slice) |num_in_slice| {
        Print("{}, ", .{num_in_slice});
    }

    Print("\nn_arr loop: ", .{});
    for (n_arr) |n_in_arr| {
        Print("{}, ", .{n_in_arr});
    }

    Print("\nChar arr with loop: ", .{});
    for (char_arr) |character| {
        Print("{c}, ", .{character});
    }
    Print("\n", .{});

    Print("type: {} || n: {}\n", .{ @TypeOf(n), n });
    
    ArrIndexer();
}

fn ArrIndexer() void {
    const n_arr = [10]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    const val_to_find = 6;

    var idx: usize = 0;
    const ARR_LEN = n_arr.len;

    for (0..ARR_LEN) |i| {
        if (n_arr[i] == val_to_find) {
            idx = i;
        }
    }

    Print("idx: {}, val: {}\n", .{ idx, n_arr[idx] });
}
