var move_speed = 4;

var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

//Speed Change Variable
a_speed = 6

//Stamina Bar Logic
if (keyboard_check(vk_shift) && staminaBar > 0){
	staminaBar -= 2;
} else if (staminaBar != 100){
	staminaBar = clamp(staminaBar + stamina_Regen, 0, 100)
}


// Normalize diagonal movement
var len = point_distance(0, 0, h, v);

if (len > 0) {
    h /= len;
    v /= len;
}
current_speed = move_speed

if (keyboard_check(vk_shift) and staminaBar > 0)
{
    current_speed = a_speed
}

// Horizontal movement
if (h != 0)
{
    hit_h = instance_place(x + h * current_speed, y, all)
    if (hit_h == noone || !hit_h.solid)
    {
        x += h * current_speed;
    }
}

// Vertical movement
if (v != 0)
{
    hit_v = instance_place(x, y + v * current_speed, all)
    if (hit_v == noone || !hit_v.solid)
    {
        y += v * current_speed
    }
}


if (keyboard_check_pressed(vk_space)) {
    interact(56); //make 64 after no walls
}

//death things
if (resets == 0) {
	audio_play_sound(snd_death, 0, false);
	alarm[0] = room_speed * 5;
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


//animation silly
if (!blinking) {
    blink_timer--;

    if (blink_timer <= 0) {
        blinking = true;
        image_index = 0;
    }
} else {
    image_index += 0.2;

    if (image_index >= image_number) {
        image_index = 0;
        blinking = false;
        blink_timer = irandom_range(120, 300);
    }
}


death_sound = -1;

if (death_sound != -1 && !audio_is_playing(death_sound))
{
    death_sound = -1;

    // Code to run after the sound finishes
    // For example: restart the room
    room_restart();
}