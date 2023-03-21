if(animationLeading == TRANSITION_OUT){

	animationPercent = min(1, animationPercent + TRANSITION_SPEED/3);
	// Quando a tela ficar totalmente amostra
	if(animationPercent >= 1){
		animationLeading = "TRANSITION_WAIT";
		instance_create_layer(0, 0, "Instances", objTitleScreenMenu);
	}
	
}
if(animationLeading == TRANSITION_IN){
	animationPercent = max(0, animationPercent - TRANSITION_SPEED/3);
	with(objSoundBox){
		audio_sound_gain(sndTitleScreen, 0, 2000);
	}
	//Quando a tela ficar toda escura
	if(animationPercent <= 0){
		switch(optionSelected){
			case 0 : {
				room_goto(rCronologyScreen);
			} break;
			case 1 : {
				game_end();
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
