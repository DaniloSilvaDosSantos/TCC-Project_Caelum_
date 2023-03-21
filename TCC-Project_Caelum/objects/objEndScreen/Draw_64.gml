if(animationLeading == TRANSITION_OUT){

	animationPercent = min(1, animationPercent + TRANSITION_SPEED/2);
	// Quando a tela ficar totalmente amostra
	if(animationPercent >= 1){
		animationLeading = "TRANSITION_WAIT";
	}
	
}

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