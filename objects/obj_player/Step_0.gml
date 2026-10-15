var move_speed = 4;

var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

//Speed Change Variable
a_speed = 6

//Stamina Bar Logic
if (keyboard_check(vk_shift) && staminaBar > 0){
	if (!has_stamina_powerup){
		staminaBar -= 2
	}
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
if (global.resets == 0) {
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

//Invisible Mechanic
if (is_invisible) {
    invisibility_timer -= 1 / game_get_speed(gamespeed_fps);

    if (invisibility_timer <= 0) {
        is_invisible = false;
        invisibility_timer = 0;
    }
}
//Collision Cooldown
if (guard_collision_cooldown > 0) {
    guard_collision_cooldown -= 1;
}

//Using Invisible PowerUp
if (keyboard_check_pressed(ord("F"))) {
    var item_index = array_get_index(inventory, "obj_invis");

    if (item_index != -1 && !is_invisible) {
        is_invisible = true;
        invisibility_timer = 5;

        array_delete(inventory, item_index, 1);
        global.run_inventory = inventory;
    }
}

//Use Stamina PowerUp
if (keyboard_check_pressed(ord("T"))) {
    var item_index = array_get_index(inventory, "obj_stamina");

    if (item_index != -1 && !has_stamina_powerup) {
        has_stamina_powerup = true;
        stamina_powerup_timer = 5;

        array_delete(inventory, item_index, 1);
        global.run_inventory = inventory;
    }
}

if (has_stamina_powerup) {
    stamina_powerup_timer -= 1 / game_get_speed(gamespeed_fps);

    if (stamina_powerup_timer <= 0) {
        has_stamina_powerup = false;
        stamina_powerup_timer = 0;
    }
}