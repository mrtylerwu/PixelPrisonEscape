player_dist = point_distance(x,y, obj_player.x, obj_player.y)
if player_dist <= interaction_distance
in_range = true
else
in_range = false
if (in_range){
if keyboard_check_pressed(ord("E")){
	if(!showing_sequence){
		normalcamX = camera_get_view_x(cam)
		normalcamY = camera_get_view_y(cam)
		normalcamH = camera_get_view_height(cam)
		normalcamW = camera_get_view_width(cam)
		
		camera_set_view_pos(cam,4704,992)
		camera_set_view_size(cam,2304,3456)
		display_index = 0
		showing_sequence = true
		show_debug_message("Sequence being made")
		alarm[0] = 1
		
	}
}
}