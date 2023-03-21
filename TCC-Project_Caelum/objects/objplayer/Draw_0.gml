// Desenhando a sombra do jogador
draw_sprite(sprShadow, 0, floor(x), floor(y));

if(invulnerable != 0) and ((invulnerable mod 8) < 1){
	//Não desenha o jogador
} else{
// Desenhando o jogador
draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y-z,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
);
}


