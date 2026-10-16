//resets -= 1;


if (can_damage == true) {
	can_damage = false
	can_move = false
	death_sound = audio_play_sound(snd_death, 0, false);
	show_debug_message("Resets: " + string(global.resets))
	alarm[0] = room_speed * 2.5;
	global.time_left = max(0, global.time_left - 60);
}

if (global.resets <= 0){
	room_goto(gameoverRoom)
	exit
}

if (has_shield) {
	guard_collision_cooldown = 30
	show_debug_message("SHIELD BLOCKED COLLISION")
    has_shield = false;

    // Stun the guard for 2 seconds
    other.guard_stunned = true;
    other.stun_timer = 2;

    other.guard_chasing = false;
    other.guard_alert = 0;
    other.guard_memory = 0;
} else {
	show_debug_message("RESET LOGIC RUNNING")
	global.resets -= 1;
	if (global.resets <= 0){
		room_goto(gameoverRoom)
	} else {
		global.run_inventory = [];
		if(instance_exists(obj_player)){
			obj_player.inventory=[]
		}

		if (instance_exists(objMemoryPuzzle))
		{
		    with (objMemoryPuzzle)
		    {
		        puzzle_complete = false;
		        accepting_input = false;
		        input_index = 0;

		        // regenerate memory sequence
		        for (var i = 0; i < sequence_length; i++)
		        {
		            sequence[i] = irandom_range(1, 24);
		        }
		    }
		}

		if (instance_exists(objNumCodePuzzleController))
		{
		    with (objNumCodePuzzleController)
		    {
		        puzzle_complete = false;
		        input_index = 0;

		        // regenerate number-code solution
		        for (var i = 0; i < solution_length; i++)
		        {
		            solution[i] = irandom_range(1, 9);
		        }
		    }
		}



