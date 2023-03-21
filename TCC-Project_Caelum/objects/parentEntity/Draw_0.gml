//Desenhando a sombra de cada entidade filha
if(entityShadow == true) draw_sprite(sprShadow, 0, floor(x), floor(y + zShadow));

if(flash !=0){
	shader_set(flashShader)
	shader_set_uniform_f(uFlash, flash);
}

// Desenhando a entidade filha
draw_sprite_ext(
	sprite_index,
	image_index,
	floor(x),
	floor(y-z),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
);

if(shader_current() != -1){
	shader_reset();
}

