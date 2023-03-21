DoorBossClose(
	entityCloseDoors[0],
	entityCloseDoors[1],
	entityCloseDoors[2],
	entityCloseDoors[3],
	entityCloseDoors[4],
	entityCloseDoors[5],
	entityCloseDoors[6],
	entityCloseDoors[7],
);

with(objAnimatedArmor){
	enemyState = ENEMY_STATE.CHASE;
}
with(objSoundBox){
	if(!audio_is_playing(sndBossBattle)){
		audio_play_sound(sndBossBattle, 1000, true);
	}
}

instance_destroy();
