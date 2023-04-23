room_goto_next();
global.level = global.level + 1;
audio_play_sound(background_music, 0, true)
if (global.level > 10)
{
	audio_stop_all();
}