// Progresso da transição

if(animationLeading == TRANSITION_OUT){

	animationPercent = min(1, animationPercent + TRANSITION_SPEED/3);
	// Quando a tela ficar totalmente amostra
	if(animationPercent >= 1){
		animationLeading = "TRANSITION_WAIT";
	}
	
}
if(animationLeading == "TRANSITION_WAIT"){
	waitCont++;
	//Ficar um tempo totalmente amostra
	if(waitCont >= waitDuration){
		animationLeading = TRANSITION_IN;
	}
}
if(animationLeading == TRANSITION_IN){
	animationPercent = max(0, animationPercent - TRANSITION_SPEED/3);
	// Quando ficar invisivel novamente, ir para a proxima tela
	if(animationPercent <= 0){
		room_goto(rLogoScreen);
		instance_destroy();
	}
}

// Desenhando de fato
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

