image_xscale = 0.75;
image_yscale = 0.75;

image_speed = 0;

close = true
if (close){

	interacted = function() {
	    var _player = instance_find(obj_player, 0);

	    if (_player != noone)
	    {
	        var _index = array_get_index(_player.inventory, "obj_bazooka");

	        if (_index != -1)
	        {
	            //array_delete(_player.inventory, _index, 1);
				audio_play_sound(snd_explosion, 0, false);
	            _player.alarm[1] = room_speed * 3;
				instance_destroy();
	        }
	    }
	};
}

