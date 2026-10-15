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
    _gui_h * 0.10,
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

var _text_x = _gui_w * 0.05;
var _text_y = _gui_h * 0.15;

draw_text_transformed(_text_x, _text_y,
    "You have been wrongly incarcerated after a hit and run.\n"
	+ "While in prison, you discover an ability to reset your location.\n"
	+ "But while experimenting, you realize you only get 5 charges left.\n"
	+ "Find a way to escape, before you lose the chance forever.\n"
	+ "\n"
	+ "WASD - Move\n"
    + "SPACE - Interact with objects\n"
    + "R - reset location. You keep all your items!\n"
	+ "F - Use an ability\n"
	+ "\n"
	+ "You start with 5 resets\n"
	+ "Getting caught resets all progress\n"
	+ "Open chests to find items and solve the puzzles to escape\n"
	+ "\n"
	+ "Hit 'ESC' to go return to menu",
	2,
	2,
	0
);

// Reset drawing settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);