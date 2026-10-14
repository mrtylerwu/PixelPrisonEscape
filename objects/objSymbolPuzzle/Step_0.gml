if(instance_exists(obj_player)){
	player_dist = point_distance(x,y,obj_player.x,obj_player.y)
	in_range = (player_dist <= interaction_distance)
	if(in_range and keyboard_check_pressed(ord("E"))){
		show_debug_message("Symbol Padlock Opened")
		keypad_open = true
	}
	else{
		in_range = false
	}
	if(keypad_open and keyboard_check_pressed(vk_escape)){
		keypad_open=false
	}
}