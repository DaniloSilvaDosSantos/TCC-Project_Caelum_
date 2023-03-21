function ActivateLiftable(){
	// Argumento 1 - id
	
	// Levantando o objeto levantavel
	if(global.insLifted == noone){
		PlayerActOutAnimation(sprPlayerLift);
		global.insLifted = argument0;
		sprIdle = sprPlayerCarring;
		sprRun = sprPlayerRunCarring;
		with(global.insLifted){
			lifted = true;
			persistent = true;
			entityActivateScript = -1;
		}
	}
}