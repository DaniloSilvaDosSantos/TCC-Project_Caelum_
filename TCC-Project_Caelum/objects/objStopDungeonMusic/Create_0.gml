gamePausedImageSpeed = 0;
with(objSoundBox){
	if(audio_is_playing(sndDungeon)){
		audio_sound_gain(sndDungeon, 0, 2000);
	}
}
