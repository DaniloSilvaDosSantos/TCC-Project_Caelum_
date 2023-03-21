function PlayerFree(){
	
	//Movimentação do player
	
	hSpd = lengthdir_x(inpIntensity*spdRun, inpDirection);
	vSpd = lengthdir_y(inpIntensity*spdRun, inpDirection);
	// calculando o deslocamento nescessario nos eixos x e y para se chegar na direção de destino.


	//Mudar o endereço de sprite do personagem do jogador.
	var tempOldSprite = sprite_index;
	if (inpIntensity != 0){
	direction = inpDirection;
	sprite_index = sprRun;
	} else {
	sprite_index = sprIdle;
	}
	
	//Verrificando se o jogador colidiu, se sim seu movimento é impedido
	PlayerCollisionSistem();

	if (tempOldSprite != sprite_index) sprFrame=0; 

	//Atualizar a imagem do sprite do jogador
	PlayerSpriteAnimation();
	
	//Logica do input de ataque
	if (keyAttack == 1) and (global.playerSwordUnlock == true){
		// Verificando se o jogador esta carregando algo
		if(global.insLifted == noone){
			//Atualizando o estado do jogador e o script de ataque
			audio_play_sound(sndSwordSwing, 10, false);
			playerState = PlayerAttack;
			playerAttackState = SwordAttackSlash;
		}
	}
	
	//Logica do input de comando de ação
	if (keyAction == 1){
		
		// Verificando se existe alguma entidade na frente
		var tempActvateX = lengthdir_x(10, direction);
		var tempActvateY = lengthdir_y(10, direction);
		activateEnt = instance_position(x + tempActvateX, y + tempActvateY, parentEntity);
		
		// Se não tem nenhuma entidade o se não tem algum script
		if (activateEnt == noone or activateEnt.entityActivateScript == -1){
			
			//Jogar o que estiver carregando. Se não estiver carregando nada, de uma cambalhota
			if(global.insLifted != noone){
				PlayerThrow();
			} else{
				audio_play_sound(sndRoll, 10, false);
				playerState = PlayerRoll;
				disRollRemaining = disRoll;
			}
		}
		else{ //Executar o script caso a entidade tenha algum
			ExecuteArrayOfScripts(activateEnt.entityActivateScript, activateEnt.entityActivateArgs);
			
			//Fazer o npc olhar para o jogador
			if (activateEnt.entityNPC){
				with(activateEnt){
					direction = point_direction(x, y, other.x, other.y);
					image_index = CARDINAL_DIRECTION;
				}
			}
		}
	}
	
	//Usando o iten equipados
	if(keyItem == 1) and (keyAction == 0) and (global.playerItemEquiped != -1){
		switch(global.playerItemEquiped){
			case "bomb": UseItemBomb(); break;
			default: break;
		}
	}
}

function PlayerRoll(){
	
	//Movimentação da rolagem, o tempo que ela vai durar e chamando o script de colisão
	
	hSpd = lengthdir_x(spdRoll, direction);
	vSpd = lengthdir_y(spdRoll, direction);
	
	disRollRemaining = max(0, disRollRemaining - spdRoll);
	
	var tempPlayerCollided = PlayerCollisionSistem();
	
	//Atualizando o endereço de sprite do personagem do jogador
	
	sprite_index = sprRoll;
	var tempAllFrames=sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIRECTION * tempAllFrames) + min(((1 - (disRollRemaining/disRoll)) * 
	tempAllFrames), tempAllFrames - 1);
	//Calculando o tempo que um loop de animação vai durar e a sua velocidade
	
	//Atualizando o estado do jogador
	if (disRollRemaining <= 0){
		playerState = PlayerFree;
	}
	
	//Se jogador colide em algum tile colidivel
	if(tempPlayerCollided){
		playerState = PlayerBonk;
		disBonkRemaining = disBonk;
		ScreenShake(8, 30);
	}
	
}

function PlayerBonk(){

	//Distancia do knockback(empurram para traz), tempo que ela vai durar o estado e chamando o script de colisão
	
	hSpd = lengthdir_x(spdBonk, direction-180);
	vSpd = lengthdir_y(spdBonk, direction-180);
	
	disBonkRemaining = max(0, disBonkRemaining - spdBonk);
	
	var tempPlayerCollided = PlayerCollisionSistem();
	
	//Atualizando o sprite do jogador
	sprite_index = sprPlayerHurt;
	image_index = CARDINAL_DIRECTION;
	
	//Mudando a altura
	z = sin((disBonkRemaining / disBonk * pi)) * disBonkZHeight;
	
	//Atualizando o estado do jogador
	if (disBonkRemaining <= 0){
		playerState = PlayerFree;
	}

}

function PlayerDeath(){
	
	// Movimentação do knockback e redução da velocidade e da velocidade gradativamente
	hSpd = lengthdir_x(spdDeathBonk, direction-180);
	vSpd = lengthdir_y(spdDeathBonk, direction-180);
	disBonkRemaining = max(0, disBonkRemaining - spdDeathBonk);
	spdDeathBonk = spdDeathBonk * 0.95;
	
	var tempPlayerCollided = PlayerCollisionSistem();
	
	//Atualizando o sprite do jogador
	sprite_index = sprPlayerHurt;
	image_index = CARDINAL_DIRECTION;
	
	//Calculando a distancia do jogador em relação ao chão e reduzindo a velocidade do pulo
	z = z + spdDeathJump;
	spdDeathJump = spdDeathJump * 0.90;
	
	//Se a distancia do knockback virar zero, o jogador morreu e foi para a tela de game over
	if(disBonkRemaining <= 0){
		if (!instance_exists(objRoomTransition)){
			with (objPlayer) playerState = PlayerRoomTransition;
			global.targetX = -1;
			global.targetY = -1;
			RoomTransitionSistem(TRANSITION_TYPE.FADE, rGameOver);
		}
	}
	
}

function PlayerAttack(){
	
	//Executar scripts de ataque do jogador
	script_execute(playerAttackState);
}

function PlayerRoomTransition(){
	
	// Movimentação e colisão
	PlayerCollisionSistem();
	
	//Atualizando e animando o sprite do jogador
	PlayerSpriteAnimation();
}

function PlayerAct(){

	//Atualizar e animar o sprite do jogador
	if(itemGetSprite == -1){
		PlayerSpriteAnimation();
	}else{
		PlayerSpriteAnimationItemGet();
	}
	
	//Se o jogador obter um item, crialo
	if(itemGetSprite != -1){
		with(instance_create_depth(x, y-18, depth-1, objItemGet)){
			sprite_index = other.itemGetSprite;
			image_speed = 0;
		}
	}
	
	if(animationEnd == true){
		playerState = PlayerFree;
		animationEnd = false;
		itemGetSprite = -1;
		if(animationEndScript != -1){
			script_execute(animationEndScript);
			animationEndScript = -1;
		}
	}
	
}

function PlayerWakeUp(){
	
	//Atualizar o sprite do jogador
	sprite_index = sprPlayerWakeUp;
	var tempAllFrames = sprite_get_number(sprite_index); //Definindo todos os frames da animação
	image_index = sprFrame + (CARDINAL_DIRECTION * tempAllFrames);
	sprFrame += sprite_get_number(sprite_index) / FPS_MACRO /2;
		 

	// Se a animação deve reiniciar o loop de 4 frames.
	if(sprFrame >= tempAllFrames){
		playerState = PlayerFree;
		global.playerHasWakeUp = true;
	} 
	
	
}

function PlayerLocked(){

	//O jogador não faz nada nesse estado

}