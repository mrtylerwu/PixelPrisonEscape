
draw_set_font(menu_font);
draw_set_alpha(1);
draw_set_color(c_white);

var total = ceil(global.time_left);
var minutes = total div 60;
var seconds = total mod 60;

var mm = string(minutes);
var ss = string(seconds);

if (minutes < 10) mm = "0" + mm;
if (seconds < 10) ss = "0" + ss;

var _xpos = display_get_gui_width() / 2;
var _ypos = 12;

draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text_transformed(_xpos, _ypos, mm + ":" + ss,2,2,0);

// Reset alignment for other drawing.
draw_set_halign(fa_left);
draw_set_valign(fa_top);