switch (fade_state)
{
    case 0:
        // Nothing happening
        break;

    case 1:
        // Fade to black
        fade_alpha = min(1, fade_alpha + fade_speed);

        if (fade_alpha >= 1)
        {
            fade_state = 2;
            room_goto(target_room);
        }
        break;

    case 2:
        // Fade back in
        fade_alpha = max(0, fade_alpha - fade_speed);

        if (fade_alpha <= 0)
        {
            fade_state = 0;
        }
        break;
}