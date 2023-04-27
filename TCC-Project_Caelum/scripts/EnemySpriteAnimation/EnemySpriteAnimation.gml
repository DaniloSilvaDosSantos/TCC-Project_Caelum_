function EnemySpriteAnimation(){
	//Atualizar o sprite do inimigo
	var tempAllFrames = sprite_get_number(sprite_index) / 4; //Definindo todos os frames de uma das animações
	image_index = sprFrame + (CARDINAL_DIRECTION * tempAllFrames);
	sprFrame += sprite_get_number(sprite_index) / FPS_MACRO /2;
		 

	// Se a animação deve reiniciar o loop.
	if(sprFrame >= tempAllFrames){
		animationEnd = true;
		sprFrame -= tempAllFrames;
		sprFrame = abs(sprFrame);
	} else animationEnd = false;
}