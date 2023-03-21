
function PlayerCollisionSistem(){
	var tempCollision = false;
	var tempEntityList = ds_list_create(); // Criando uma lista com as entidades que o jogador colidiu
	
	//Verificando se o jogador pode empurrar algo
	if(PlayerPushObject() == true){
		hSpd = 0;
		vSpd = 0;
	}
	
	//Colisão horizontal com os tiles de colisão
	if (tilemap_get_at_pixel(CollisionID,x + hSpd, y)){
		x -= x mod TILE_SIZE;
		if(sign(hSpd)==1){
			x += TILE_SIZE-1;
		}
		hSpd=0;
		tempCollision = true;
	}
	
	// Colisão horizontal com as entidades
	var tempEntityCount = instance_position_list(x + hSpd, y, parentEntity, tempEntityList, false);
	var tempAjustX;
	while (tempEntityCount > 0){
		var tempEntityCheck = tempEntityList[| 0];
		if (tempEntityCheck.entityCollision == true){
			// Mover o jogador o mais proximo possivel
			if (sign(hSpd) == 1){
				tempAjustX = tempEntityCheck.bbox_left-1;
			} else{
				tempAjustX = tempEntityCheck.bbox_right+1;
			}
			x = tempAjustX;
			tempCollision = true;
			tempEntityCount = 0;
			hSpd = 0;
		}
		ds_list_delete(tempEntityList, 0);
		tempEntityCount --;
	}
	
	x = x + hSpd;
	
	//Limpando a lista entre os eixos
	ds_list_clear(tempEntityList);
	
	//Colisão vertical com os tiles de colisão
	if (tilemap_get_at_pixel(CollisionID,x, y + vSpd)){
		y -= y mod TILE_SIZE;
		if(sign(vSpd)==1){
			y += TILE_SIZE-1;
		}
		vSpd=0;
		tempCollision = true;
	}
	
	// Colisão vertical com as entidades
	var tempEntityCount = instance_position_list(x, y + vSpd, parentEntity, tempEntityList, false);
	var tempAjustY;
	while (tempEntityCount > 0){
		var tempEntityCheck = tempEntityList[| 0];
		if (tempEntityCheck.entityCollision == true){
			// Mover o jogador o mais proximo possivel
			if (sign(vSpd) == 1){
				tempAjustY = tempEntityCheck.bbox_top-1;
			} else{
				tempAjustY = tempEntityCheck.bbox_bottom+1;
			}
			y = tempAjustY;
			tempCollision = true;
			tempEntityCount = 0;
			vSpd = 0;
		}
		ds_list_delete(tempEntityList, 0);
		tempEntityCount --;
	}
	
	y = y + vSpd;
	
	//Destruindo a lista
	ds_list_destroy(tempEntityList);
	
	return tempCollision;
}