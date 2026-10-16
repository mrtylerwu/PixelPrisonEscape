audio_stop_sound(snd_menu_music)
audio_stop_sound(snd_game_music)
audio_play_sound(snd_pickup, 0, false);

if (music_track != -1) {
    audio_play_sound(music_track, 0, true);
}