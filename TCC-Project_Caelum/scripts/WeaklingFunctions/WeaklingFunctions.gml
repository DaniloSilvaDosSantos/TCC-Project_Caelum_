function WeaklingIdle(){
	sprite_index = sprIdle;
	hSpd = 0;
	vSpd = 0;
	
	//Animando o Weakling
	EnemySpriteAnimation();
	
	// Definindo o proximo destino
	if(++wait >= waitDuration) and (enemyNotMove == false){
		wait = 0;
		if(x == xstart) and (y == ystart){
			dir = (irandom_range(0,3)) * 90;
			//Verificando se o Weakling vai colidir com alguma parede, se sim vai determinar a direção novamente
			while(WeaklingCheckMoviment(dir) == true){
				dir = (irandom_range(0,3)) * 90;
			}
			
		} else{
			dir = WeaklingMoveDirection();
			//Verificando se o Weakling vai colidir com alguma parede, se sim vai determinar a direção novamente
			while(WeaklingCheckMoviment(dir) == true){
				dir = WeaklingMoveDirection();
			}
		}
		direction = dir;
		sprFrame = 0;
		xTo = x + lengthdir_x(enemyWanderDistance, dir);
		yTo = y + lengthdir_y(enemyWanderDistance, dir);
		sprite_index = sprMove;
		enemyState = ENEMY_STATE.WANDER;
	}
	
	// Verificando se o jogador esta proximo o suficiente para atacar
	if(instance_exists(objPlayer)) and (point_distance(x, y, objPlayer.x, objPlayer.y) <= enemyAggroRadius){
		// Fazer um switch case com o direction do weakling, verificando se o jogador esta na frente do weakling
		switch(direction){
			case 0 :{
				if(objPlayer.x >= x) and (objPlayer.y >= bbox_top and objPlayer.y <= bbox_bottom+12){
					surprised = true;
					surprisedCont = 15;
					enemyNotMove = false;
					enemyState = ENEMY_STATE.SURPRISED;
					audio_play_sound(sndAlert, 20, false);
				}
			}break;
			case 90 :{
				if(objPlayer.x >= bbox_left and objPlayer.x <= bbox_right) and (objPlayer.y <= y){
					surprised = true;
					surprisedCont = 15;
					enemyNotMove = false;
					enemyState = ENEMY_STATE.SURPRISED;
					audio_play_sound(sndAlert, 20, false);
				}
			}break;
			case 180 :{
				if(objPlayer.x <= x) and (objPlayer.y >= bbox_top and objPlayer.y <= bbox_bottom+12){
					surprised = true;
					surprisedCont = 15;
					enemyNotMove = false;
					enemyState = ENEMY_STATE.SURPRISED;
					audio_play_sound(sndAlert, 20, false);
				}
			}break;
			case 270 :{
				if(objPlayer.x >= bbox_left and objPlayer.x <= bbox_right) and (objPlayer.y >= y){
					surprised = true;
					surprisedCont = 15;
					enemyNotMove = false;
					enemyState = ENEMY_STATE.SURPRISED;
					audio_play_sound(sndAlert, 20, false);
				}
			}break;
		}
	}
	
	EnemyCollisionSistem();
}

function WeaklingWander(){
	sprite_index = sprMove
	timePassed++;
	
	//Animando o Weakling
	EnemySpriteAnimation();
	
	// Verificando se o jogador esta proximo o suficiente para atacar
	if(instance_exists(objPlayer)) and (point_distance(x, y, objPlayer.x, objPlayer.y) <= enemyAggroRadius){
		// Fazer um switch case com o direction do weakling, verificando se o jogador esta na frente do weakling
		switch(direction){
			case 0 :{
				if(objPlayer.x >= x) and (objPlayer.y >= bbox_top and objPlayer.y <= bbox_bottom+12){
					surprised = true;
					surprisedCont = 15;
					enemyState = ENEMY_STATE.SURPRISED;
					audio_play_sound(sndAlert, 20, false);
				}
			}break;
			case 90 :{
				if(objPlayer.x >= bbox_left and objPlayer.x <= bbox_right) and (objPlayer.y <= y){
					surprised = true;
					surprisedCont = 15;
					enemyState = ENEMY_STATE.SURPRISED;
					audio_play_sound(sndAlert, 20, false);
				}
			}break;
			case 180 :{
				if(objPlayer.x <= x) and (objPlayer.y >= bbox_top and objPlayer.y <= bbox_bottom+12){
					surprised = true;
					surprisedCont = 15;
					enemyState = ENEMY_STATE.SURPRISED;
					audio_play_sound(sndAlert, 20, false);
				}
			}break;
			case 270 :{
				if(objPlayer.x >= bbox_left and objPlayer.x <= bbox_right) and (objPlayer.y >= y){
					surprised = true;
					surprisedCont = 15;
					enemyState = ENEMY_STATE.SURPRISED;
					audio_play_sound(sndAlert, 20, false);
				}
			}break;
		}
	}
	
	//Calculando a distancia do deslocamento no frame atual
	var tempDistanceToGo = point_distance(x, y, xTo, yTo);
	var tempSpeedInThisFrame = enemySpd;
	if(tempDistanceToGo < enemySpd) tempSpeedInThisFrame = tempDistanceToGo;
	// Se o Weakling chegou no seu destino ou desistiu
	if(tempDistanceToGo <= 0) or (timePassed > enemyWanderDistance / enemySpd){
		timePassed = 0;
		sprFrame = 0;
		enemyState = ENEMY_STATE.IDLE;
	}
	
	dir = point_direction(x, y, xTo, yTo);
	hSpd = lengthdir_x(tempSpeedInThisFrame, dir);
	vSpd = lengthdir_y(tempSpeedInThisFrame, dir);
		
	// Efetuando a movimentação e colisão de fato
	EnemyCollisionSistem();
	
}

function WeaklingSurprised(){
	image_speed = 0;
	
	// Verificando se o tempo de ficar surpreso acabou para que assim mudar o estado para atacando
	if(--surprisedCont <= 0){
		surprised = false;
		entityAttackImune = true;
		enemyState = ENEMY_STATE.ATTACK;
	}
}

function WeaklingAttack(){
	//Animando a investida do Weakling
	sprite_index = sprMove;
	var tempAllFrames = sprite_get_number(sprite_index) / 4; //Definindo todos os frames de uma das animações
	image_index = sprFrame + (CARDINAL_DIRECTION * tempAllFrames);
	sprFrame += sprite_get_number(sprite_index) / FPS_MACRO;
		 
	//Efeito sonoro de passos
	if(++sfxRunCount mod 6 == 0){
		audio_play_sound(sndRoll, 10, false);
	}

	// Se a animação deve reiniciar o loop.
	if(sprFrame >= tempAllFrames){
		sprFrame -= tempAllFrames;
		sprFrame = abs(sprFrame);
	}
	
	//Calculando a velocidade do deslocamento
	hSpd = lengthdir_x(enemySpd*3, direction);
	vSpd = lengthdir_y(enemySpd*3, direction);
	
	// Efetuando a movimentação e colisão de fato e verificando se colidiu em algo
	if(EnemyCollisionSistem() == true){
		audio_play_sound(sndGetHit, 10, false);
		xTo = x + lengthdir_x(16, direction-180);
		yTo = y + lengthdir_y(16, direction-180);
		wait = 0;
		enemyState = ENEMY_STATE.STUN;
	}
}

function WeaklingStun(){
	entityAttackImune = false;
	//Atualizando o sprite
	sprite_index = sprHurt;
		switch(direction){
			case 0 :{
				image_index = 0;
			}break;
			case 90 :{
				image_index = 1;
			}break;
			case 180 :{
				image_index = 2;
			}break;
			case 270 :{
				image_index = 3;
			}break;
		}
	
	//Verificando a distancia do knockback
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
		//Verificando se o tempo dele ficar tonto acabou
		if(++wait >= 30){
			wait = 0;
			x = xTo;
			y = yTo;
			enemyState = ENEMY_STATE.IDLE;
		}
	}
}

function WeaklingHurt(){
	enemyNotMove = false;
	//Atualizando o sprite
	sprite_index = sprHurt;
		switch(direction){
			case 0 :{
				image_index = 0;
			}break;
			case 90 :{
				image_index = 1;
			}break;
			case 180 :{
				image_index = 2;
			}break;
			case 270 :{
				image_index = 3;
			}break;
		}
	
	//Verificando a distancia do knockback
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
		direction = round((point_direction(x, y, objPlayer.x, objPlayer.y)/90));
		direction = direction*90
		enemyState = ENEMY_STATE.IDLE;
	}
}

function WeaklingDie(){
	//Atualizando o sprite
	sprite_index = sprHurt;
		switch(direction){
			case 0 :{
				image_index = 0;
			}break;
			case 90 :{
				image_index = 1;
			}break;
			case 180 :{
				image_index = 2;
			}break;
			case 270 :{
				image_index = 3;
			}break;
		}
	
	//Verificando a distancia do knockback
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
		instance_destroy();
		instance_create_depth(x, y, -bbox_bottom, objSmoke);
	}
}

function WeaklingMoveDirection(){
	// Calcula as posições futuras nas 4 direções
	var posRight = [x + enemyWanderDistance, y];
	var posDown = [x, y + enemyWanderDistance];
	var posLeft = [x - enemyWanderDistance, y];
	var posUp = [x, y - enemyWanderDistance];

	// Calcula as distâncias das posições futuras para a posição inicial
	var disRight = point_distance(xstart, ystart, posRight[0], posRight[1]);
	var disDown = point_distance(xstart, ystart, posDown[0], posDown[1]);
	var disLeft = point_distance(xstart, ystart, posLeft[0], posLeft[1]);
	var disUp = point_distance(xstart, ystart, posUp[0], posUp[1]);
	
	// Armazenando as futuras posições em um vetor e definindo variavel que vai armazenar a maior distancia
	var futureDistances = [disRight, disUp, disLeft, disDown];
	var longerDistance = -1;
	
	// Encontrando as posições futuras mais distantes
	for(i = 0; i < array_length(futureDistances); i++){
		if(futureDistances[i] > longerDistance){
			longerDistance = futureDistances[i];
			
		}
	}

	// Define as direções possíveis do movimento
	var directions = [0, 90, 180, 270];
	
	// Remove as direções que resultam nas posições mais distantes	
	var cont = 0
	while(cont < array_length(directions)){
		if(futureDistances[cont] == longerDistance){
			array_delete(directions, cont, 1);
			array_delete(futureDistances, cont, 1);
		}else{
			cont++;
		}
	}

	// Escolhe aleatoriamente uma das direções restantes
	var chosenDirection = directions[irandom(array_length(directions) - 1)];
	return chosenDirection;
}

function WeaklingCheckMoviment(dir){
	
	//Inicializa a variável col como false
	var col = false; 

	// Calcula a posição x e y do objeto inimigo com base na direção e na distância
	var xTo = x + lengthdir_x(enemyWanderDistance-8, dir);
	var yTo = y + lengthdir_y(enemyWanderDistance-8, dir);

	// Verifica se há uma colisão com os tiles na nova posição do objeto inimigo
	if (tilemap_get_at_pixel(collisionMapId, xTo, yTo) != 0) {
		col = true; // Se houver uma colisão, a variável col é definida como true
	}

	return col;
}