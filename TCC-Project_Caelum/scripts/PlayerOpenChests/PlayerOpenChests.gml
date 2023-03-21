function OpenChest(chestID, getItem, spriteItem, isChest){
	
	if(isChest == "yes"){
		audio_play_sound(sndOpenChest, 20, false);
	}
	//Abrindo o bau
	if(chestID.chestIsOpen == false){
		with(chestID){
			image_index = 1;
			chestIsOpen = true;
			ds_list_add(global.savedObjectProperties, chestID);
		}
		//Jogador fazendo a animação de pegar o item
		PlayerActOutAnimation(sprPlayerItemGet, getItem, spriteItem);
	}
}
function UnlockBomb(){

	audio_play_sound(sndItemGet, 1000, false);
	//Jogador desbloqueando as bombas
	global.playerBombUnlocked = true;
	global.playerItemEquiped = "bomb";
	global.playerBombAmmo = 5;

}

function GetKeyFromChest(){
	
	audio_play_sound(sndItemGet, 1000, false);
	// Jogador pegando uma chave
	global.playerKeys++;
	
}

function UnlockSword(){
	
	audio_play_sound(sndItemGet, 1000, false);
	//Jogador desbloqueando a espada
	global.playerSwordUnlock = true;
	
}