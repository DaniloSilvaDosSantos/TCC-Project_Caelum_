function DialogueReactions(){
	//Argument 0 é o array com o id de cada resposta
	
	//switch com cada caso de acordo com o id das respostas
	switch(argument0){
		case 0: break;
		case 1: CreateTextBox("You are a bobao"); break;
		case 2: CreateTextBox("La babidi, Certeza?", ["3:Yes","0:No"]) break;
		case 3: CreateTextBox("Muitas mitadas"); break;
		default: break;
	}
	
}