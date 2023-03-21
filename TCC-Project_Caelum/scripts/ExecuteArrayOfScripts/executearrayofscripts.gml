//Argumentos a serem recebidos (activateEnt.entityActivateScript, activateEnt.EntityActivateArgs)

function ExecuteArrayOfScripts(){
	var tempScr = argument0;
	var tempArgs = argument1;
	
	//Executando os scripst do array de acordo com o tamanho do mesmo
	switch (array_length(tempArgs)){
		case 1: return script_execute(tempScr, tempArgs[0]);
		
		case 2: return script_execute(tempScr, tempArgs[0], tempArgs[1]);
		
		case 3: return script_execute(tempScr, tempArgs[0], tempArgs[1], tempArgs[2]);
		
		case 4: return script_execute(tempScr, tempArgs[0], tempArgs[1], tempArgs[2], tempArgs[3]);
		
		case 5: return script_execute(tempScr, tempArgs[0], tempArgs[1], tempArgs[2], tempArgs[3], tempArgs[4]);
		
		case 6: return script_execute(tempScr, tempArgs[0], tempArgs[1], tempArgs[2], tempArgs[3], tempArgs[4], tempArgs[5]);
		
		case 7: return script_execute(tempScr, tempArgs[0], tempArgs[1], tempArgs[2], tempArgs[3],tempArgs[4], tempArgs[5], tempArgs[6]);
 
		default: show_error("execute_array_of_scripts: quantidade de argumentos não suportado", false);
	}
}