// Tipos de animações para a transição de salas

// Progresso da transição
show_debug_message(animationPercent)
if(animationLeading == TRANSITION_OUT){

	animationPercent = min(1, animationPercent + TRANSITION_SPEED/3);
	// Quando a tela ficar totalmente amostra
	if(animationPercent >= 1){
		animationLeading = "TRANSITION_WAIT";
	}
	
}
if(animationLeading == "TRANSITION_WAIT"){
	if(cont < contMax){
		y = y - scrollUpSpd;
		cont = cont + scrollUpSpd;
	}else{
		animationLeading = TRANSITION_IN;
	}
}
if(animationLeading == TRANSITION_IN){
	animationPercent = max(0, animationPercent - TRANSITION_SPEED/4);
	// Quando ficar invisivel novamente, ir para a proxima tela
	if(animationPercent <= 0){
		with(objSoundBox){
			audio_sound_gain(sndCronology, 0, 2000);
		}
		room_goto(rOpenYourEyes);
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

