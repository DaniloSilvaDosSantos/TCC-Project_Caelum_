function SlimeWander(){
	
	// Chegou no destino ou desistiu?
	if((x == xTo) and (y == yTo)) or (timePassed > enemyWanderDistance / enemySpd){
		hSpd = 0;
		vSpd = 0;
		// Finalizar a animação de movimentação
		if (image_index < 1){
			image_index = 0;
			image_speed = 0;
		}
		
		// Estabelecer nova posição de destino
		if(++wait >= waitDuration){
			wait = 0;
			timePassed = 0;
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-45,45);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
	} else { //Movendo ate o proximo destino
		timePassed++;
		image_speed = 1;
		var tempDistanceToGo = point_distance(x, y, xTo, yTo);
		var tempSpeedInThisFrame = enemySpd;
		if(tempDistanceToGo < enemySpd){
			tempSpeedInThisFrame = tempDistanceToGo;
		}
		dir = point_direction(x, y, xTo, yTo);
		hSpd = lengthdir_x(tempSpeedInThisFrame, dir);
		vSpd = lengthdir_y(tempSpeedInThisFrame, dir);
		if(hSpd != 0){
			image_xscale = sign(hSpd);
		}
		
		// Efetuando a movimentação e colisão de fato
		EnemyCollisionSistem();
		
	}
	
	// Verificando se o jogador esta proximo
	if(++aggroCheck >= aggroCheckDuration){
		aggroCheck = 0;
		if (instance_exists(objPlayer)) and (point_distance(x, y, objPlayer.x, objPlayer.y) <= enemyAggroRadius){
			enemyState = ENEMY_STATE.CHASE;
		}
	}
	
}


function SlimeChase(){
	sprite_index = sprMove;
	
	if(instance_exists(objPlayer)){
		// Definindo a posição do jogador como o destino
		xTo = objPlayer.x;
		yTo = objPlayer.y;
		
		// Calculando a movimentação
		var tempDistanceToGo = point_distance(x, y, xTo, yTo);
		image_speed = 1;
		dir = point_direction(x, y, xTo, yTo);
		if(tempDistanceToGo > enemySpd){
			hSpd = lengthdir_x(enemySpd, dir);
			vSpd = lengthdir_y(enemySpd, dir);
		} else{
			hSpd = lengthdir_x(tempDistanceToGo, dir);
			vSpd = lengthdir_y(tempDistanceToGo, dir);
		}
		if(hSpd != 0){
			image_xscale = sign(hSpd);
		}
		
		// Se o jogador estiver muito longe, desistir de persegui-lo
		if(point_distance(x, y, xTo, yTo) > enemyAggroGiveUpRadius){
			enemyState = ENEMY_STATE.WANDER;
		}
		
		//Efetuando a movimentação e colisão de fato
		EnemyCollisionSistem();
		
		// Verificar se o jogador esta proximo o suficiente para atacar
		if(point_distance(x, y, objPlayer.x, objPlayer.y) <= enemyAttackRadius){
			enemyState = ENEMY_STATE.ATTACK;
			sprite_index = sprAttack;
			image_index = 0;
			image_speed = 1;
			// A posição final do ataque vai ser 8 pixels alem da posição do jogador
			xTo = xTo + lengthdir_x(8, dir); 
			yTo = yTo + lengthdir_y(8, dir);
		}
	}
}

function SlimeAttack(){
	//O quão rapido vai ser a movimentação
	var tempSpd = enemySpd;
	
	//Não se mover até começar o pulo do ataque
	if(image_index < 2){
		tempSpd = 0;
	}
	//Conjelar a animação enquanto estiver no meio do ar e quando aterrisar no chão
	if(floor(image_index) == 3) or (floor(image_index) == 5){
		image_speed = 0;
		tempSpd = tempSpd * 1.5;
	}
	var tempJumpDistanceToGo = point_distance(x, y, xTo, yTo);
	// Começando a animação de aterrisagem quando estiver proxima de ser concluida
	if(tempJumpDistanceToGo < 4) and (image_index < 5){
		image_speed = 1;
	}
	
	// Movimentação em si
	if(tempJumpDistanceToGo > tempSpd){
		dir = point_direction(x, y, xTo, yTo);
		hSpd = lengthdir_x(tempSpd, dir);
		vSpd = lengthdir_y(tempSpd, dir);
		if(hSpd != 0){
			image_xscale = sign(hSpd);
		}
		
		if(EnemyCollisionSistem() == true){
			xTo = x;
			yTo = y;
		}
	}
	else{
		x = xTo;
		y = yTo;
		if(floor(image_index) == 5){
			enemyStateTarget = ENEMY_STATE.CHASE;
			enemyStateWaitDuration = 30;
			enemyState = ENEMY_STATE.WAIT;
		}
	}
}

function SlimeHurt(){
	
	sprite_index = sprHurt;
	var distanceToGo = point_distance(x, y, xTo, yTo);
	if (distanceToGo > enemySpd){
		image_speed = 1;
		dir = point_direction(x, y, xTo, yTo);
		hSpd = lengthdir_x(enemySpd, dir);
		vSpd = lengthdir_y(enemySpd, dir);
		if(hSpd != 0){
			image_xscale = -sign(hSpd);
		}
		
		// Movimentação e colisão
		if(EnemyCollisionSistem() == true){
			xTo = x;
			yTo = y;
		}
	}
	else{
		x = xTo;
		y = yTo;
		if(enemyStatePrevious != ENEMY_STATE.ATTACK ){
			enemyState = enemyStatePrevious;
		}
		else{
			enemyState = ENEMY_STATE.CHASE;
		}
	}
	
}

function SlimeDie(){
	
	sprite_index = sprDie;
	image_speed = 1;
	var distanceToGo = point_distance(x, y, xTo, yTo);
	if(distanceToGo > enemySpd){
		dir = point_direction(x, y, xTo, yTo);
		hSpd = lengthdir_x(enemySpd, dir);
		vSpd = lengthdir_y(enemySpd, dir);
		if(hSpd != 0){
			image_xscale = -sign(hSpd);
		}
		
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