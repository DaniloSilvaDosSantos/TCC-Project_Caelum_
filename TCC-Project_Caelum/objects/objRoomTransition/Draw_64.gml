// Tipos de animações para a transição de salas

// Progresso da transição

with(objPlayer){
	if(objPlayer.playerState != PlayerDeath){
		playerState = PlayerRoomTransition;
	}
}

if (transitionLeading = TRANSITION_OUT){

	transitionPercent = min(1, transitionPercent + TRANSITION_SPEED);
	// Quando a tela ficar totalmente escura
	if (transitionPercent >= 1){
		room_goto(target);
		transitionLeading = TRANSITION_IN;
	}
	
} else // transitionDirection = TRANSITION_IN
{
	transitionPercent = max(0, transitionPercent - TRANSITION_SPEED);
	// quando a tela ficar totalmente visivel
	if (transitionPercent <= 0){
		with (objPlayer) playerState = PlayerFree;
		instance_destroy();
	}
}

// Desenhando de fato

// Tipos de animações para a transição de salas

if (type == TRANSITION_TYPE.SLIDE){
	draw_set_color(c_black);
	draw_rectangle(0, 0, width, transitionPercent * halfHeight, false);
	draw_rectangle(0,height, width, height - (transitionPercent * halfHeight), false);
}
if (type == TRANSITION_TYPE.FADE){
	draw_set_alpha(transitionPercent);
	draw_set_color(c_black);
	draw_rectangle(0, 0, width, height, false);
}

