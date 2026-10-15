resets -= 1;
death_sound = audio_play_sound(snd_death, 0, false);
global.resets -= 1;
if (global.resets <= 0){
	room_goto(gameoverRoom)
	exit
}

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

room_goto(Room1)

global.time_left = max(0, global.time_left - 60);
