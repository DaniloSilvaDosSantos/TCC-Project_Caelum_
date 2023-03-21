function PlayerThrow(){
	
	//Fazendo com que o objeto seja arremessado pelo jogador
	with(global.insLifted){
		lifted = false;
		persistent = false;
		thrown = true;
		z = 12;
		zGravity = 0.1;
		direction = other.direction;
	}
	PlayerActOutAnimation(sprPlayerLift);
	sprIdle = sprPlayer;
	sprRun = sprPlayerRun;
	global.insLifted = noone;
}