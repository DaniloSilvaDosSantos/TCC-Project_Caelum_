event_inherited();

if(global.gamePaused == false){
	
	//Executando o state machine do bloco
	script_execute(blockState);
	
	//Arrumando a profundidade
	if(instance_exists(objPlayer)){
		depth = objPlayer.depth+1;
	}
	
}
