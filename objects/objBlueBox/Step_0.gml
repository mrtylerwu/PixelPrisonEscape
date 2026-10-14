if (point_distance(x,y,obj_player.x,obj_player.y) <= 100){
	if(keyboard_check_pressed(ord("E"))){
		if(!opened){
			opened = true
			image_speed = 1
		}
		show_debug_message("Box contains: " + string(box_number))
	}
}