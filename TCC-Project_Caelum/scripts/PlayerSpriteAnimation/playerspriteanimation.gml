function PlayerSpriteAnimation() {

	//Atualizar o sprite do jogador
	var tempAllFrames = sprite_get_number(sprite_index) / 4; //Definindo todos os frames de uma das animações
	image_index = sprFrame + (CARDINAL_DIRECTION * tempAllFrames);
	sprFrame += sprite_get_number(sprite_index) / FPS_MACRO /2;
		 

	// Se a animação deve reiniciar o loop de 4 frames.
	if(sprFrame >= tempAllFrames){
		animationEnd = true;
		sprFrame -= tempAllFrames;
		sprFrame = abs(sprFrame);
	} else animationEnd = false;
}
function PlayerSpriteAnimationItemGet() {

	//Atualizar o sprite do jogador
	var tempAllFrames = sprite_get_number(sprite_index) / 4; //Definindo todos os frames de uma das animações
	image_index = sprFrame + (CARDINAL_DIRECTION * tempAllFrames);
	sprFrame += sprite_get_number(sprite_index) / FPS_MACRO /8;
		 

	// Se a animação deve reiniciar o loop de 4 frames.
	if(sprFrame >= tempAllFrames){
		animationEnd = true;
		sprFrame -= tempAllFrames;
		sprFrame = abs(sprFrame);
	} else animationEnd = false;
}
