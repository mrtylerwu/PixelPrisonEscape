persistent = true;

fade_alpha = 0;
fade_speed = 0.05;
fade_state = 0;
target_room = noone;

start_fade = function(_room)
{
    if (fade_state == 0)
    {
        target_room = _room;
        fade_state = 1;
    }
};