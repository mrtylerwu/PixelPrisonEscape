player_dist = point_distance(x,y,obj_player.x,obj_player.y)
if (player_dist <=100){
	if(keyboard_check_pressed(ord("E"))){
		room_goto(BossRoom)
	}
}