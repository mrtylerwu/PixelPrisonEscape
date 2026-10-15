if (keyboard_check_pressed(ord("R"))) {
	if (global.resets > 0){
		global.resets -= 1;
		
		if (global.resets <= 0){
			room_goto(gameoverRoom)
		} else {
			room_goto(Room1)
		}
	} else {
		room_goto(gameoverRoom)
	}
}