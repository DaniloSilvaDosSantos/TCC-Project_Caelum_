// Progresso da transição

if(animationLeading == TRANSITION_OUT){
	
	image_speed = 0;
	animationPercent = min(1, animationPercent + TRANSITION_SPEED/2);
	// Quando a tela ficar totalmente amostra
	if(animationPercent >= 1){
		animationLeading = "TRANSITION_WAIT";
	}
	
}
if(animationLeading == "TRANSITION_WAIT"){
	
	//Mostrar os quadros da animação
	image_speed = 1;
	if(image_index >= sprite_get_number(sprite_index)-1){
		animationLeading = TRANSITION_IN;
	}
	
}
if(animationLeading == TRANSITION_IN){
	image_speed = 0;
	animationPercent = max(0, animationPercent - TRANSITION_SPEED/2);
	// Quando ficar invisivel novamente, ir para a proxima tela
	if(animationPercent <= 0){
		room_goto(rCaveF1);
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
