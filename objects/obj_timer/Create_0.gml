if (instance_number(obj_timer) > 1) {
    instance_destroy();
    exit;
}


persistent = true;

global.time_left = 10 * 60;
global.timer_paused = false; // no implmentition yet
global.game_over = false;

show_debug_message(
    "Timer count: " + string(instance_number(obj_timer))
);