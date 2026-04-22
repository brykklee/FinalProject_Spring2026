if (keyboard_check_pressed(vk_space))
{
	audio_play_sound(select, 5, false);
	room_goto(main)
}