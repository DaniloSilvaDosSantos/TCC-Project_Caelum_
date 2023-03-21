
attrition = 0.05;

if (instance_exists(objPlayer)){
	var playerX = objPlayer.x;
	var playerY = objPlayer.y;
	var distance = point_distance(x, y, playerX, playerY);
	
	// Se o jogador esta proximo o suficiente, ele vai pegar o item se ele for coletavel
	if(distance <= 8){
		if(collectScriptArg != -1){
			script_execute(collectScript, collectScriptArg);
		} else{
			if(collectScript != -1){
				script_execute(collectScript);
			}
		}
		instance_destroy();
	}
	
}

depth=-bbox_bottom;



