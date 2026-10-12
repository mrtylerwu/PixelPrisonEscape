// Set font and alignment
draw_set_font(menu_font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Calculate screen coordinates (centering the menu)
var _x = room_width / 2;
var _y_start = room_height / 2;
var _spacing = 40; // Pixels between lines

// Loop through array and draw the text
for (var i = 0; i < menu_length; i++) {
    // Change color if the option is currently hovered over
    if (i == menu_index) {
        draw_set_color(c_yellow); // Highlight color
        draw_text(_x, _y_start + (i * _spacing), "> " + menu_options[i] + " <");
    } else {
        draw_set_color(c_white); // Standard color
        draw_text(_x, _y_start + (i * _spacing), menu_options[i]);
    }
}
