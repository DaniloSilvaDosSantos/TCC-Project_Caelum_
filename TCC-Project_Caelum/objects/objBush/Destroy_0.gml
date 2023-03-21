if(global.playerBombUnlocked == true){
	entityDropList = choose(
		[objBronzeCoin],
		[objBronzeCoin],
		[objHeartDrop],
		[objBombDrop],
		-1,
		-1,
		-1,
		-1,
		-1,
		-1
	);
} else{
	entityDropList = choose(
		[objBronzeCoin],
		[objBronzeCoin],
		[objHeartDrop],
		-1,
		-1,
		-1,
		-1,
		-1,
		-1,
		-1
	);
}
audio_play_sound(sndJarBreak, 10, false);

event_inherited();