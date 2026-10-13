player_dist = point_distance(x,y, obj_player.x, obj_player.y)
if player_dist <= interaction_range
in_range = true
else
in_range = false
if (in_range){
if keyboard_check_pressed(ord("E"))
show_debug_message("Interacted with Cubicle: " + string(cubicle_id));
}
if(in_range and keyboard_check_pressed(ord("E"))){
	with (objMemoryPuzzle){
		if(accepting_input){
			if(other.cubicle_id == sequence[input_index]){
				show_debug_message("Correct Cubicle")
				input_index++
				if(input_index>=sequence_length){
					puzzle_complete = true
					accepting_input = false
					show_debug_message("Puzzle Complete")
				}
			
			}
			else{
				show_debug_message("Wrong Cubicle")
				input_index = 0
			}
		}
	}
}