var move_speed = 4;

var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Normalize diagonal movement
var len = point_distance(0, 0, h, v);

if (len > 0) {
    h /= len;
    v /= len;
}

// Horizontal movement
if (h != 0) {
    if (!place_meeting(x + h * move_speed, y, obj_wallEmpty)) {
        x += h * move_speed;
    }
}

// Vertical movement
if (v != 0) {
    if (!place_meeting(x, y + v * move_speed, obj_wallEmpty)) {
        y += v * move_speed;
    }
}


if (keyboard_check_pressed(vk_space)) {
    interact(56); //make 64 after no walls
}

//death things
if (resets == 0) {
	instance_destroy();
}


//if within range and space is pressed, interact
// Interaction range
//var withinRange = 48;

/*/ Space pressed?
if (keyboard_check_pressed(vk_space))
{
    // Find closest chest
    var closest = instance_nearest(x, y, obj_chest);

    // Is there a chest, and is it close enough?
    if (closest != noone && point_distance(x, y, closest.x, closest.y) <= withinRange)
    {
        with (closest)
        {
            //instance_destroy();
			//broadcast open message instead of deleting
        }
    }
}
*/

