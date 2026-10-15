// Set font and alignment
draw_set_font(menu_font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Calculate screen coordinates
var _x = room_width / 2;
var _y_start = room_height / 2;
var _spacing = 60; // More space between larger lines

// Text scale
var _scale = 2;

for (var i = 0; i < menu_length; i++)
{
    if (i == menu_index)
    {
        draw_set_color(c_yellow);

        draw_text_transformed(
            _x,
            _y_start + (i * _spacing),
            "> " + menu_options[i] + " <",
            _scale, _scale, 0
        );
    }
    else
    {
        draw_set_color(c_white);

        draw_text_transformed(
            _x,
            _y_start + (i * _spacing),
            menu_options[i],
            _scale, _scale, 0
        );
    }
}

draw_set_color(c_white);