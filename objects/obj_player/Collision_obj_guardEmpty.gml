if (guard_collision_cooldown > 0) exit;

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

		//Update blue chests to match new generated numbers
		with(objBlueBox){
			opened = false
			image_index=0
			image_speed=0
			show_note=false
			message_timer=0
			box_number = objNumCodePuzzleController.solution[box_id]
		}
		with (obj_chest)
		{
		    close = true;
		    image_index = 0;
		    image_speed = 0;
		}

		x = start_x;
		y = start_y;
	}
}
	
