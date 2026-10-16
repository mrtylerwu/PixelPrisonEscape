if(instance_exists(obj_player)){
	player_dist = point_distance(x,y,obj_player.x,obj_player.y)
	in_range = (player_dist <= interaction_distance)
	if(!objNumCodePuzzleController.puzzle_complete){
		if(in_range and keyboard_check_pressed(ord("E"))){
			show_debug_message("Symbol Padlock Opened")
			keypad_open = true
		}
	}
	if(keypad_open and keyboard_check_pressed(vk_escape)){
		keypad_open=false
	}
	if(keypad_open){
		gui_w = display_get_gui_width()
		gui_h = display_get_gui_height()
		panel_w = 420
		panel_h = 500
		panel_x = (gui_w - panel_w)/2
		panel_y = (gui_h - panel_h)/2
		button_size  =75
		gap = 15
		start_x = panel_x + 80
		start_y = panel_y + 130
		mx = device_mouse_x_to_gui(0)
		my = device_mouse_y_to_gui(0)
		if(mouse_check_button_pressed(mb_left)){
			for(i = 0; i<9; i++){
				col = i mod 3
				row = i div 3
				bx = start_x + col * (button_size+gap)
				by = start_y + row * (button_size+gap)
				if(point_in_rectangle(mx,my,bx,by,bx+button_size,by+button_size)){
					if(array_length(entered_code) < max_code_length){
						array_push(entered_code,i+1)
					}
				}
			}
			bottom_y = start_y+3 * (button_size+gap)
			if(point_in_rectangle(mx,my,start_x,bottom_y,start_x+button_size,bottom_y+button_size)){
				if(array_length(entered_code) > 0){
					array_pop(entered_code)
				}
			}
			submit_x = start_x + 2 * (button_size + gap)
			if(point_in_rectangle(mx,my,submit_x,bottom_y,submit_x + button_size,bottom_y+button_size)){
				if(array_length(entered_code) == max_code_length){
					var correct = true
					for(i = 0; i < objNumCodePuzzleController.solution_length;i++){
						if(entered_code[i] != objNumCodePuzzleController.solution[i]){
							correct = false
							break
						}
					}
					if(correct){
						show_debug_message("Correct Code")
						objNumCodePuzzleController.puzzle_complete=true
						keypad_open=false
					}
					else{
						show_debug_message("Wrong Code")
						entered_code=[]
					}
				}
				else{
					show_debug_message("Enter all 4 symbols")
				}
				
			}
		}
	}
}