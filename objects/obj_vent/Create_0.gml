//image_xscale = 0.75;
//image_yscale = 0.75;

image_speed = 0;

close = true
if (close){

	interacted = function() {
	    var _player = instance_find(obj_player, 0);

	    if (_player != noone)
	    {
	        var _index = array_get_index(_player.inventory, "obj_screwdriver");

	        if (_index != -1)
	        {
	            //array_delete(_player.inventory, _index, 1);
	            instance_destroy();
	        }
	    }
	};
}

