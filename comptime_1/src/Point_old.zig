x: f32,
y: f32 = 0,

const Point = @This();

// Namespaced function
pub fn new(x: f32, y: f32) Point {
    // anonymous struct literal
    return .{ .x = x, .y = y };
}

// Method
pub fn distance(self: Point, other: Point) f32 {
    const diffx = other.x - self.x;
    const diffy = other.y - self.x;
    return @sqrt(diffx * diffx + diffy * diffy);
}
