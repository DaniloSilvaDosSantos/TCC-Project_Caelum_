if(!instance_exists(objRoomTransition) and (!instance_exists(objGameOverMenu)) and (menuWasCreated == false)){

	//Criando o menu quando a transição de sala acabar
	instance_create_layer(0, 0, "Instances", objGameOverMenu);
	menuWasCreated = true;
	
}
if(animationLeading == TRANSITION_IN){
	animationPercent = max(0, animationPercent - TRANSITION_SPEED/3);
	global.playerLife = global.playerLifeMax;
	global.playerHasWakeUp = false;
	//Quando a tela ficar toda escura
	if(animationPercent <= 0){
		switch(optionSelected){
			case 0 : {
				room_goto(global.respawnRoom);
			} break;
			case 1 : {
				//Resetando as variaveis
				global.respawnRoom = rCaveF1;
				global.playerHasGotHit = false;
				global.playerSwordUnlock = false;
				global.playerItemEquiped = -1;
				global.playerBombUnlocked = false;
				global.playerBombAmmo = -1;
				global.playerHasWakeUp = false;
				global.playerMoney = 0;
				global.playerKeys = 0;
				ds_list_destroy(global.savedObjectProperties);
				
				room_goto(rSplashScreen);
			} break;
		}
	}
}

// Desenhando a tela de fundo
draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	animationPercent
);

