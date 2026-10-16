image_xscale = 0.65;
image_yscale = 0.65;
//Stun Variable
guard_stunned = false
stun_timer = 0;
// this is the flashlight variables
vision_range = 220; // how far the gaurd sees
vision_angle = 60; // how large the cone width is 
vision_direction = 0; //the direction the guard is looking (default 0): 0 == right, 90 == up, 180 left, 270 down 
vision_segments = 40; // just how many segments the cone is made of, this just makes it look smoother

// guards "memory" the only form of AI i could make.
// just goes to players last x and y pos
guard_alert = 0; // alert detection
guard_chasing = false; // chasing, true == chasing you 
guard_memory = 0; // amount of time guard chases you, default 0
guard_last_x = x; // players last x and y pos
guard_last_y = y; 
guard_sees_player = false; // checks wether the gaurd "sees you" during a step


// returns true or false (false means go back to what ever you were doing) (like patroling)
// function for guarding chasing you
guard_update = function() {
	
	// nearest player
    var _player = instance_nearest(x, y, obj_player);
    guard_sees_player = false;
	//gamespeed
    var _dt = 1 / game_get_speed(gamespeed_fps);
	
	// 
    if (instance_exists(_player)) {
		// how far the player is from gaurd & and direction
        var _distance = point_distance(x, y, _player.x, _player.y);
        var _angle = point_direction(x, y, _player.x, _player.y);
		
		// checks if the player is in our flashlight & not behind a wall & half the cone width (hitbox stuff)
        //guard_sees_player = _distance <= vision_range
            //&& abs(angle_difference(vision_direction, _angle)) <= vision_angle * 0.5
            //&& collision_line(x, y, _player.x, _player.y, obj_wallEmpty, false, true) == noone;
			//*Code has been Adjusted for Invisible powerup
		guard_sees_player = !_player.is_invisible
			&& _distance <= vision_range
			&& abs(angle_difference(vision_direction, _angle)) <= vision_angle * 0.5
			&& collision_line(x, y, _player.x, _player.y, obj_wallEmpty, false, true) == noone;	
			// if all coditions true; chase player ( go to current x y pos)
        if (guard_sees_player) {
            guard_last_x = _player.x;
            guard_last_y = _player.y;
            guard_memory = 2; // keep refreshing guards memory to 2
            guard_alert = min(1, guard_alert + _dt / 0.5); // increase alert detection
            if (guard_alert >= 1) guard_chasing = true; // chase player after altering
        }
    }
    if (!guard_sees_player) {
        guard_memory = max(0, guard_memory - _dt);
        guard_alert = max(0, guard_alert - _dt);
    }
    if (!guard_chasing) return false;
	// smartest ai ever
    // investigate the last seen position briefly, then resume the patrol
    speed = 0; 
    if (guard_memory <= 0) {
        guard_chasing = false; // stop chasing, after 2 seconds past of no LOS
        guard_alert = 0;
        return false; // if we return false then go back to patrolling
    } 
	// the actual movment 
    var _dist = point_distance(x, y, guard_last_x, guard_last_y);
    if (_dist > 1) {
        vision_direction = point_direction(x, y, guard_last_x, guard_last_y);
        var _move = min(run_speed, _dist); // min so we go less than the player, so we dont overextend
        var _dx = lengthdir_x(_move, vision_direction);
        var _dy = lengthdir_y(_move, vision_direction);
        // small movement steps keep pursuing guards out of wallsx
        var _steps = max(1, ceil(_move));
        repeat (_steps) {
			// check for walls, i did not make it go around them (idk how to do that) 
            if (!place_meeting(x + _dx / _steps, y, obj_wallEmpty)) x += _dx / _steps;
            if (!place_meeting(x, y + _dy / _steps, obj_wallEmpty)) y += _dy / _steps;
        }
    }
    return true;
};
