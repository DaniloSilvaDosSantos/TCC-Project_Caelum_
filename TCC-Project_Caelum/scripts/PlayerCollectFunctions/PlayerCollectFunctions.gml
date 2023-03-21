function GetCoins(amount){
	
	//Coletando moedas
	global.playerMoney = global.playerMoney + amount;
	audio_play_sound(sndCoin, 10, false);
	
}

function GetBombAmmo(amount){
	
	//Coletando a munição do item
	global.playerBombAmmo = global.playerBombAmmo + amount;
	audio_play_sound(sndCoin, 10, false);
	
}

function GetHeart(amount){
	
	//Coletando corações
	if(global.playerLife <= global.playerLifeMax){
		audio_play_sound(sndGetHearts, 10, false);
		global.playerLife = global.playerLife + 4;
		
		//Impedindo que o jogador tenha mais vida atual que a vida maxima
		if(global.playerLife > global.playerLifeMax){
			global.playerLife = global.playerLifeMax;
		}
	}
}

function GetKeys(amount){
	
	//Coletando chaves
	global.playerKeys = global.playerKeys + 1;
	audio_play_sound(sndCoin, 10, false);
	
}