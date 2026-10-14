array_push(other.inventory, object_get_name(object_index));
show_debug_message(json_stringify(other.inventory));
audio_play_sound(snd_pickup, 0, false);
instance_destroy();