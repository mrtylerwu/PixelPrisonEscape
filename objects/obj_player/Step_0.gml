var move_speed = 4;

var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Normalize diagonal movement
var len = point_distance(0, 0, h, v);

if (len > 0) {
    h /= len;
    v /= len;
}

// Horizontal movement
if (h != 0) {
    if (!place_meeting(x + h * move_speed, y, obj_wallEmpty)) {
        x += h * move_speed;
    }
}

// Vertical movement
if (v != 0) {
    if (!place_meeting(x, y + v * move_speed, obj_wallEmpty)) {
        y += v * move_speed;
    }
}