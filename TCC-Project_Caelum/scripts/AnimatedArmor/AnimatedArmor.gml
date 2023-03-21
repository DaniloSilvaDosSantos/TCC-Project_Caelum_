function AnimatedArmorIdle(){
	sprite_index = sprIdle;
	// E ele não vai fazer nada mesmo neste estado
}
function AnimatedArmorChase(){

	sprite_index = sprChase;
	hSpd = 0;
	vSpd = 0;
		
	// Definindo a direção do pulo
	if(++wait >= waitDuration){
		wait = 0;
		dir = point_direction(x, y, objPlayer.x, objPlayer.y) + irandom_range(-15, 15);
		enemyDisJumpRemaining = enemyDisJump;
		enemyState = ENEMY_STATE.JUMP;
	}
}
function AnimatedArmorJump(){
	
	// Efetuando o deslocamento
	var tempSpd = enemySpd;
	hSpd = lengthdir_x(tempSpd, dir);
	vSpd = lengthdir_y(tempSpd, dir);

	enemyDisJumpRemaining = max(0, enemyDisJumpRemaining - tempSpd);
	
	EnemyCollisionSistem();
	
	//Calculando a altura
	z = sin((enemyDisJumpRemaining / enemyDisJump * pi)) * enemyJumpZHeight;
	
	//Atualizando o estado
	if (enemyDisJumpRemaining <= 0){
		enemyState = ENEMY_STATE.CHASE;
	}
}

function AnimatedArmorStun(){
	
	sprite_index = sprIdle;
	z = 0;
	entityAttackImune = false;
	
	// Quando o tempo de atordoamento acabar, atualizar o estado
	if(++stunCont > stunDuration){
		
		stunCont = 0
		enemyState = ENEMY_STATE.CHASE;
		entityAttackImune = true;
		
	}
	
	
}

function AnimatedArmorDie(){
	
	sprite_index = sprBombExplosion;
	image_speed = 1;
	
	// Se a animação de morte acabar, ele esta morto
	if(image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number){
		DoorBossOpen(
			entityOpenDoors[0],
			entityOpenDoors[1],
			entityOpenDoors[2],
			entityOpenDoors[3],
			entityOpenDoors[4],
			entityOpenDoors[5],
			entityOpenDoors[6],
			entityOpenDoors[7],
		);
		with(objSoundBox){
			if(audio_is_playing(sndBossBattle)){
				audio_sound_gain(sndBossBattle, 0, 2000);
			}
		}
		audio_play_sound(sndExplosion, 50, false);
		instance_destroy();
	}

}
