event_inherited();

if(global.gamePaused == false){
	
	//Executando o state machine do bloco
	script_execute(blockState);
	
	//Arrumando a profundidade
	depth = -bbox_bottom+16;
	
}
