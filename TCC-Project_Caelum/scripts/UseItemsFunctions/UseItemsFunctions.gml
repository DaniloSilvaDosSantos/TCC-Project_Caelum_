function UseItemBomb(){
	//Verificando se o jogador possui bombas e se ele não esta carregando nada para ai sim pegar uma bomba
	if(global.playerBombAmmo > 0) and (global.insLifted == noone){
		global.playerBombAmmo--;
		var bomb = instance_create_layer(x, y, "Instances", objBomb);
		ActivateLiftable(bomb);
	}
}

function UseItemLifePotion(){
	//Funcionalidade de beber poção não feita ainda
}