if (instance_exists(obj_player)){
	player_dist = point_distance(x,y,obj_player.x,obj_player.y)
} else {
	player_dist = -1
}
if (player_dist <=100 && player_dist >= 0){
	if(keyboard_check_pressed(ord("E"))){
		room_goto(MemoryRoom)
	}
}