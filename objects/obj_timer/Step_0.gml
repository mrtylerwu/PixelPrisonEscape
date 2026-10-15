if (!global.game_over) {
    if (!global.timer_paused) {
        global.time_left = max(
            0,
            global.time_left - delta_time / 1000000
        );
    }

    if (global.time_left <= 0) {
        global.game_over = true;
        room_goto(rm_game_over);
    }
}