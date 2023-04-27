//Executar a state machine do inimigo
if (global.gamePaused == false){
	
	if(enemyFunction[enemyState] != -1){
		script_execute(enemyFunction[enemyState]);	
	} 
	depth = -bbox_bottom;
}
//show_debug_message(direction);