global.game_over = false
is_invisible = false
invisible_timer = 0

has_shield = false
guard_collision_cooldown = 0;

has_stamina_powerup = false
stamina_powerup_timer = 0
//animation variables
image_speed = 0;
image_index = 0;
blink_timer = irandom_range(120, 300);
blinking = false;

image_xscale = 0.5;
image_yscale = 0.5;

start_x = x;
start_y = y;

if (!variable_global_exists("resets")){
	global.resets = 5
}


//Stamina Bar
staminaBar = 100;
stamina_Regen = 0.5;

//Inventory Bar
if(!variable_global_exists("run_inventory")){
	global.run_inventory = []
}
inventory = global.run_inventory

if(array_get_index(inventory,"obj_gun")) == -1{
	array_push(inventory,"obj_gun")
	global.run_inventory = inventory
}

interact = function(_distance)
{
    var _target = instance_nearest(x, y, obj_blockEmpty);

    if (_target != noone)
    {
        if (point_distance(x, y, _target.x, _target.y) <= _distance)
        {
			audio_play_sound(snd_interaction, 0, false);
            with (_target)
            {
                interacted();
            }
        }
    }
};

audio_stop_sound(snd_menu_music);