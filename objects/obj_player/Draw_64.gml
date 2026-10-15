var _gui_w = display_get_gui_width();

var _x = _gui_w - 100;
var _y = 40;
var _panel_w = 300;

var _right = _gui_w - 20;
var _left = _right - _panel_w;

// Count visible inventory rows (duplicate keys count as one)
var _display_count = 0;
var _key_found = false;

for (var i = 0; i < array_length(inventory); i++)
{
    if (inventory[i] == "obj_keyGeneric")
    {
        if (!_key_found)
        {
            _display_count++;
            _key_found = true;
        }
    }
    else
    {
        _display_count++;
    }
}

var _panel_h = 45 + (_display_count * 25);

// Draw semi-transparent dark panel
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(
    _left + 80,
    _y - 20,
    _right,
    _y + _panel_h,
    false
);

// Reset alpha for text
draw_set_alpha(1);
draw_set_color(c_white);

draw_text(_x - 80, _y, "Inventory:");

// Track whether we've drawn the key entry
var _key_drawn = false;
var _display_i = 0;

for (var i = 0; i < array_length(inventory); i++)
{
    var _name = inventory[i];
    var _sprite = -1;

    if (_name == "obj_keyGeneric")
    {
        if (_key_drawn)
        {
            continue;
        }

        _key_drawn = true;

        var _key_count = 0;

        for (var j = 0; j < array_length(inventory); j++)
        {
            if (inventory[j] == "obj_keyGeneric")
            {
                _key_count++;
            }
        }

        _name = "Normal Key x " + string(_key_count);
        _sprite = spr_keyGeneric;
    }
    else
    {
        switch (_name)
        {
            case "obj_hammer":
                _name = "Hammer";
                _sprite = spr_hammer;
                break;

            case "obj_screwdriver":
                _name = "Screwdriver";
                _sprite = spr_screwdriver;
                break;
				
			case "obj_health":
                _name = "Health Power Up";
                _sprite = spr_health;
                break;
				
			case "obj_invis":
                _name = "Invis Power Up";
                _sprite = spr_invis;
                break;
				
			case "obj_stamina":
                _name = "Stamina Power Up";
                _sprite = spr_stamina;
                break;
				
			case "obj_shield":
                _name = "Shield Power Up";
                _sprite = spr_shield;
                break;
        }
    }

    // Calculate item position using visible rows
    var _item_y = _y + 25 + (_display_i * 25);

    // Draw mini sprite
    if (_sprite != -1)
    {
        draw_sprite_ext(
            _sprite,
            0,
            _right - 180,
            _item_y,
            0.4,
            0.4,
            0,
            c_white,
            1
        );
    }

    draw_text(_gui_w - 180, _item_y, _name);

    _display_i++;
}

draw_set_halign(fa_left);
draw_set_alpha(1);
draw_set_color(c_white);