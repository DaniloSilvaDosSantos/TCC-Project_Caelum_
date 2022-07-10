function PlayerSpriteAnimation() {

	//Atualizar o sprite do jogador

	var tempCardinalDirection=round(direction/90); 
	var tempAllFrames=sprite_get_number(sprite_index)/4;
	//pegando a direção cardinal do jogador, variando de 0 a 3 e definindo todos os frames de uma das animações
	image_index=sprFrame+(tempCardinalDirection*tempAllFrames);
	sprFrame+=sprite_get_number(sprite_index)/FPS_MACRO;
	//mudando o sprite do jogador.
	
	// Se a animação deve reiniciar o loop de 8 frames.

	if(sprFrame >= tempAllFrames){
		animaEnd=true;
		sprFrame-=tempAllFrames;
	} else animaEnd=false;
}
