function BlowPiderIdle(){
	sprite_index = sprIdle;
	image_speed = 1;
	hSpd = 0;
	vSpd = 0;
		
	// Definindo o proximo destino do pulo
	if(++wait >= waitDuration){
		wait = 0;
		dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
		xTo = x + lengthdir_x(enemyWanderDistance, dir);
		yTo = y + lengthdir_y(enemyWanderDistance, dir);
		sprite_index = sprMove;
		image_index = 0;
		enemyState = ENEMY_STATE.JUMP;
	}
	
	// Verificando se o jogador esta proximo
	if(++aggroCheck >= aggroCheckDuration){
		aggroCheck = 0;
		// Se ele estiver proximo, pular na direção dele
		if (instance_exists(objPlayer)) and (point_distance(x, y, objPlayer.x, objPlayer.y) <= enemyAggroRadius){
			dir = point_direction(x, y, objPlayer.x, objPlayer.y) + irandom_range(-15, 15);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
			sprite_index = sprMove;
			image_index = 0;
			enemyState = ENEMY_STATE.JUMP;
		}
	}
	
}
function BlowPiderJump(){
	
	// Pulando até o proximo destino
	
	// O quão rapido vai ser a movimentação
	var tempSpd = enemySpd;
	
	// Não se mover até começar o pulo
	if(image_index < 3){
		tempSpd = 0;
	}
	// Conjelar a animação enquanto estiver no meio do ar e quando aterrisar no chão
	if(floor(image_index) == 3) or (floor(image_index) == 7){
		image_speed = 0;
	}
	var tempJumpDistanceToGo = point_distance(x, y, xTo, yTo);
	// Começando a animação de aterrisagem quando estiver proxima de ser concluida
	if(tempJumpDistanceToGo < 4) and (image_index < 7){
		image_speed = 1;
	}
		
	// Movimentação em si
	if(tempJumpDistanceToGo > tempSpd){
		dir = point_direction(x, y, xTo, yTo);
		hSpd = lengthdir_x(tempSpd, dir);
		vSpd = lengthdir_y(tempSpd, dir);
		
		if(EnemyCollisionSistem() == true){
			xTo = x;
			yTo = y;
		}
	} else{
		xTo = x;
		yTo = y;
		if(floor(image_index) == 7){
			enemyState = ENEMY_STATE.IDLE;
		}
	}
}

function BlowPiderHurt(){

	sprite_index = sprHurt;
	var distanceToGo = point_distance(x, y, xTo, yTo);
	if (distanceToGo > enemySpd){
		image_speed = 1;
		dir = point_direction(x, y, xTo, yTo);
		hSpd = lengthdir_x(enemySpd, dir);
		vSpd = lengthdir_y(enemySpd, dir);
		
		// Movimentação e colisão
		if(EnemyCollisionSistem() == true){
			xTo = x;
			yTo = y;
		}
	}
	else{
		x = xTo;
		y = yTo;
		enemyState = ENEMY_STATE.IDLE;
	}

}

function BlowPiderDie(){
	
	sprite_index = sprDie;
	image_speed = 1;
	var distanceToGo = point_distance(x, y, xTo, yTo);
	if(distanceToGo > enemySpd){
		dir = point_direction(x, y, xTo, yTo);
		hSpd = lengthdir_x(enemySpd, dir);
		vSpd = lengthdir_y(enemySpd, dir);
		
		// Colisão e movimento
		EnemyCollisionSistem();
	}
	else{
		x = xTo;
		y = yTo;
	}
	// Se a animação de morte acabar, ele esta morto
	if(image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number){
		instance_destroy();
	}
	
}