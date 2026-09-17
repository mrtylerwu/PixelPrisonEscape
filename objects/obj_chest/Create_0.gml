image_xscale = 0.65;
image_yscale = 0.65;

image_index = 0;
image_speed = 0;

/*interacted = function() {
    var drop = drop_pool[irandom(array_length(drop_pool) - 1)];

    instance_create_layer(x, y - 50, "Instances", drop);
};*/

interacted = function() {
	show_debug_message("Loot table: " + string(loot_table));
    show_debug_message("Chest ID: " + string(chest_id));
    show_debug_message("Loot value: " + string(loot));
	if (loot == noone) {
        show_debug_message("RESULT: EMPTY");
    }
	image_index = 1;
    if (loot != noone) {
		show_debug_message("item spawned: " + object_get_name(loot));
        instance_create_layer(x - spawn_offset_x, y - spawn_offset_y, "Instances", loot);
    }
};

