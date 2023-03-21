if (audio_sound_get_gain(sndTitleScreen) <=0){
	audio_stop_sound(sndTitleScreen);	
}
if (audio_sound_get_gain(sndCronology) <=0){
	audio_stop_sound(sndCronology);	
}
if (audio_sound_get_gain(sndDungeon) <=0){
	audio_stop_sound(sndDungeon);	
}
if(audio_sound_get_gain(sndBossBattle) <=0){
	audio_stop_sound(sndBossBattle);
}