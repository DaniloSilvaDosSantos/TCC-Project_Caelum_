gamePausedImageSpeed = 0;

with(objSoundBox){
	if(!audio_is_playing(sndDungeon)){
		audio_play_sound(sndDungeon, 1000, true);
	}
}