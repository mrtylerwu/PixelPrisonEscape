function scr_wallCollision(){
	if (place_meeting(x + hspeed, y, obj_wallEmpty)) {
	    while (!place_meeting(x + sign(hspeed), y, obj_wallEmpty)) {
	        x += sign(hspeed);
	    }
	    hspeed = 0;
	}

	if (place_meeting(x, y + vspeed, obj_wallEmpty)) {
	    while (!place_meeting(x, y + sign(vspeed), obj_wallEmpty)) {
	        y += sign(vspeed);
	    }
	    vspeed = 0;
	}
}