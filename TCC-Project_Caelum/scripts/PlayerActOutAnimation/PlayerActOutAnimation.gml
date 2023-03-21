
function PlayerActOutAnimation(playerSprite, Script, itemSprite){
	
	// Atualizar o sprite da animação
	playerState = PlayerAct;
	sprite_index = playerSprite;
	
	// Quando receber uma função, executar ela no final da animação
	if(Script){
		animationEndScript = Script;
		//Se o jogador vai segurar um item durante a animação
		show_debug_message(itemSprite);
		if(itemSprite){
			itemGetSprite = itemSprite;
		}
	}
	sprFrame = 0;
	image_index = 0;
	PlayerSpriteAnimation();
	
}