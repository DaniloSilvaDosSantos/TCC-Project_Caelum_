function PlayerDropItem(){
	//Forçando o jogador a largar o que estiver segurando
	with(objPlayer){
		global.insLifted = noone;
		sprRun = sprPlayerRun;
		sprIdle = sprPlayer;
	}
}