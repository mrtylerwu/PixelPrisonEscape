// Get input
var _key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var _key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var _key_select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

// Move through options (and wrap around)
menu_index += _key_down - _key_up;
if (menu_index >= menu_length) menu_index = 0;
if (menu_index < 0) menu_index = menu_length - 1;

// Trigger action when Enter/Space is pressed
if (_key_select) {
    switch(menu_index) {
        case 0: // Start Game
            room_goto(Room1);
            break;
        case 1: // Rules
            // Rule logic
            break;
        case 2: // Quit
            game_end();
            break;
    }
}
