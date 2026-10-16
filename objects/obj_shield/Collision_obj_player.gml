
/// Activate shield automatically
other.has_shield = true;
show_debug_message("Shield activated!");


audio_play_sound(snd_pickup, 0, false);

instance_destroy();
