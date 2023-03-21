function CreateTextBox(){
	//argument[0] é a mensagem da caixa de texto
	//argument[1] é o array de respostas
	
	//Verifica se ja existe alguma caixa de texto
	var tempObj;
	if (instance_exists(objText)){
		tempObj = objTextInWait;
	}
	else{
		tempObj = objText;
	}
	
	//Criando a caixa de texto
	with (instance_create_layer(0, 0, "Instances", tempObj)) {
		messageText = argument[0]
		if (instance_exists(other)){
			originInstance = other.id;
		}
		else{
			originInstance = noone;
		}
		tbBackgroud = 0;
		
		if (argument_count > 1){
			//Armazenando o array de respostas em um array temporario
			var tempArray = argument[1];
			for (var i = 0; i < array_length(tempArray) ; i++){
				responses[i] = tempArray[i];
			}
			
			//Separando as respostas e o id delas pela marcação :
			for (var i = 0; i < array_length(responses); i++){
				var tempMarkedPosition = string_pos(":",responses[i]);
				responseScripts[i] = real(string_copy(responses[i],1,tempMarkedPosition-1));
				responses[i] = string_delete(responses[i],1,tempMarkedPosition);
				breakpoint = 90;
			}
		}
		else{
			responses = [-1];
			responseScripts = [-1];
		}
	}
	
	//Mudando o estado do jogador
	with (objPlayer){
		if(playerState != PlayerLocked){
			lastPlayerState = playerState;
			playerState = PlayerLocked;
		}
	}
}