if (point_distance(x,y,obj_player.x,obj_player.y) <= 100){
	if(keyboard_check_pressed(ord("E"))){
		var item_index = array_get_index(obj_player.inventory,"objMemoryReward")
		if(item_index !=-1){
			if(!opened){
				opened = true
				image_speed = 1
				message_timer=180
			}
			show_note=true
			show_debug_message("Box contains: " + string(box_number))
		}
		else{
			show_debug_message("Need Memory Puzzle Item")
			}
	}


}
if(show_note){
	message_timer--
	if(message_timer<=0){
		show_note=false
	}
}
