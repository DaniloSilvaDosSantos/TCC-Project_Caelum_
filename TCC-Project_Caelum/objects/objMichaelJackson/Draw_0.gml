if(animationLeading == "TRANSITION_WAIT"){
	cont++;
	//Ficar um tempo totalmente amostra
	if(cont >= contMax){
		animationLeading = TRANSITION_IN;
	}
}
if(animationLeading == TRANSITION_IN){
	animationPercent = max(0, animationPercent - TRANSITION_SPEED/3);
	// Quando ficar invisivel novamente, ir para a proxima tela
	if(animationPercent <= 0){
		audio_stop_all();
		room_goto(rEndGame);
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