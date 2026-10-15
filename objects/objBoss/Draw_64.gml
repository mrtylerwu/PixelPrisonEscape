var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var bar_w = 300;
var bar_h = 24;

var left = (gui_w - bar_w) / 2;
var top = gui_h - 50;
var right = left + bar_w;
var bottom = top + bar_h;

var health_percent = (max_health / 150) * 100;

draw_healthbar(left,top,right,bottom,health_percent,c_black,c_red,c_lime,0,true,true);