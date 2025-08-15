pub fn Point(comptime T: type) type {
    return struct {
        x: T,
        y: T = 0,

        const Self = @This();

        // Namespaced function
        pub fn new(x: T, y: T) Self {
            // anonymous struct literal
            return .{ .x = x, .y = y };
        }

        // Method
        pub fn distance(self: Self, other: Self) f64 {
            const diffx: f64 = switch (@typeInfo(T)) {
                .int => @floatFromInt(other.x - self.x),
                .float => other.x - self.x,
                else => @compileError("Only floats or ints allowed."),
            };

            const diffy: f64 = switch (@typeInfo(T)) {
                .int => @floatFromInt(other.y - self.y),
                .float => other.y - self.y,
                else => @compileError("Only floats or ints allowed."),
            };

            // const diffx = other.x - self.x;
            // const diffy = other.y - self.x;
            return @sqrt(diffx * diffx + diffy * diffy);
        }
    };
}
