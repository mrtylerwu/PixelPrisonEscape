var _old_color = draw_get_color();
var _old_alpha = draw_get_alpha();
var _color = merge_color(make_color_rgb(255, 235, 135), c_red, guard_alert); // 0 = yellow, 1 == red
var _previous_x = x;
var _previous_y = y;

// send each ray against walls, so the visible beam matches line of sight of guard
for (var _i = 0; _i <= vision_segments; _i++) { // for each segment in our cone send out a ray
   
   var _angle = vision_direction - vision_angle * 0.5 //angle
        + vision_angle * _i / vision_segments;
    var _ray_x = x + lengthdir_x(vision_range, _angle); // x y pos
    var _ray_y = y + lengthdir_y(vision_range, _angle);
    var _length = vision_range; // length
	
	// if we dont collide with a wall ( aka a guards LOS) 
    if (collision_line(x, y, _ray_x, _ray_y, obj_wallEmpty, false, true) != noone) {
        var _low = 0;
        var _high = vision_range;
        repeat (10) {
            var _middle = (_low + _high) * 0.5;
            if (collision_line(x, y, x + lengthdir_x(_middle, _angle),
                y + lengthdir_y(_middle, _angle), obj_wallEmpty, false, true) != noone) {
                _high = _middle;
            } else {
                _low = _middle;
            }
        }
        _length = _low;
    }
    _ray_x = x + lengthdir_x(_length, _angle);
    _ray_y = y + lengthdir_y(_length, _angle);
    if (_i > 0) {
        draw_set_alpha(0.24);
        draw_triangle_color(x, y, _previous_x, _previous_y, _ray_x, _ray_y,
            _color, _color, _color, false);
        draw_set_alpha(0.55);
        draw_set_color(_color);
        draw_line(_previous_x, _previous_y, _ray_x, _ray_y);
    }
    if (_i == 0 || _i == vision_segments) {
        draw_set_alpha(0.4);
        draw_set_color(_color);
        draw_line(x, y, _ray_x, _ray_y);
    }
    _previous_x = _ray_x;
    _previous_y = _ray_y;
}
draw_set_color(_old_color);
draw_set_alpha(_old_alpha);
draw_self();
if (guard_alert > 0) {
    draw_set_color(_color);
    draw_set_alpha(1);
    draw_rectangle(x - 12, bbox_top - 9, x + 12, bbox_top - 5, true);
    draw_rectangle(x - 12, bbox_top - 9, x - 12 + 24 * guard_alert, bbox_top - 5, false);
    draw_set_color(_old_color);
    draw_set_alpha(_old_alpha);
}
