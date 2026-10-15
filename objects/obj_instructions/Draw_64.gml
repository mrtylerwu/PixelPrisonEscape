// Get GUI dimensions
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

// Background
draw_set_color(c_black);
draw_rectangle(0, 0, _gui_w, _gui_h, false);

// Set text color
draw_set_color(c_white);

// -------------------------
// Title: Instructions
// -------------------------

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw title larger
draw_text_transformed(
    _gui_w / 2,
    _gui_h * 0.2,
    "Instructions:",
    4,
    4,
    0
);

// -------------------------
// Instruction text
// -------------------------

draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _text_x = _gui_w * 0.2;
var _text_y = _gui_h * 0.35;

draw_text_transformed(_text_x, _text_y,
    "WASD - Move\n"
    + "SPACE - Interact with objects\n"
    + "Open chests to find items\n"
    + "Solve the puzzles to escape",
	2,
	2,
	0
);

// Reset drawing settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);