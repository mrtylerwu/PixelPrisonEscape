run_speed = 3;
max_health = 150;
health=max_health
sword_interval = 120
bullet_interval = 90
alarm[0] = sword_interval
alarm[1] = bullet_interval
sword = instance_create_layer(x,y,"Instances",objBossSword)
sword.owner=id
boss_update = function()
{
    if (!instance_exists(obj_player))
    {
        return;
    }

    var _player = instance_nearest(x, y, obj_player);

    var _distance = point_distance(x,y,_player.x,_player.y);

    if (_distance > 1)
    {
        var _direction = point_direction(x,y,_player.x,_player.y);

        var _move = min(run_speed, _distance);

        var _dx = lengthdir_x(_move, _direction);
        var _dy = lengthdir_y(_move, _direction);

        var _steps = max(1, ceil(_move));

        repeat (_steps)
		{
			if (!place_meeting(x + _dx / _steps, y, obj_wallEmpty))
			{
			x += _dx / _steps;
			}

			if (!place_meeting(x, y + _dy / _steps, obj_wallEmpty))
			{
				y += _dy / _steps;
			}
		}
    }
};