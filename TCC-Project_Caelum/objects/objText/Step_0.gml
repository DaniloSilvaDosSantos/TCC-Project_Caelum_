
// Definindo a velocidade da animação
textBoxProgress += (1 - textBoxProgress)/50;
textProgress += global.textSpd;

// Progresso da animação em porcentagem em relação ao local inicial e final da caixa de texto
x1 = lerp(x1,x1Goal,textBoxProgress);
x2 = lerp(x2,x2Goal,textBoxProgress);

//Mudando a resposta selecionada caso o jogador mude ela
keyUp = keyboard_check_pressed(vk_up);
keyDown = keyboard_check_pressed(vk_down);
responseSelected += (keyDown-keyUp);
var tempMax = array_length(responses)-1;
var tempMin = 0;

if (responseSelected > tempMax) responseSelected = tempMin;
if (responseSelected < tempMin) responseSelected = tempMax;

// Se a mensagem estiver 100% a mostra, destruir a caixa de texto, senão mostra toda a mensagem
if (keyboard_check(vk_enter) or keyboard_check(ord("Z"))){

	var tempMsLenght =  string_length(messageText);
	if(textProgress >= tempMsLenght){
		
		if (responses[0] != -1){
			with(originInstance) DialogueReactions(other.responseScripts[other.responseSelected]);
		}
		
		instance_destroy();
		
		//Se existe alguma caixa de texto em espera, reduza o lugar delas na fila de espera
		if (instance_exists(objTextInWait)){
			with(objTextInWait) textPlaceInTheQueue --;
		}
		else{
			with (objPlayer) playerState = lastPlayerState;
		}
	}
	else{
		if (textProgress > 6){
			textProgress = tempMsLenght;
		}
	}
}