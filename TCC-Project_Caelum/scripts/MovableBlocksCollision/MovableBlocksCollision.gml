function MovableBlocksCollision(){
	
	var tempCollision = false;
	
	// COLISÃO COM OS TILES DE COLISÃO
	
	// Colisão horizontal na direita
	if(tilemap_get_at_pixel(collisionMapId, bbox_right, y)){
		hSpd = 0;
		tempCollision = true;
	}
	
	// Colisão horizontal na esquerda
	if(tilemap_get_at_pixel(collisionMapId, bbox_left-1, y)){
		hSpd = 0;
		tempCollision = true;
	}
	
	
	// Colisão vertical para cima
	if(tilemap_get_at_pixel(collisionMapId, x, bbox_top-1)){
		vSpd = 0;
		tempCollision = true;
	}
	
	// Colisão vertical para baixo
	if(tilemap_get_at_pixel(collisionMapId, x, bbox_bottom)){
		vSpd = 0;
		tempCollision = true;
	}
	
	// COLISÃO COM ENTIDADES
	
	// Colisão horizontal com entidades solidas
	if(place_meeting(x+hSpd, y, parentEntity)){
		var entitySolid = instance_place(x+hSpd, y, parentEntity)
		if(entitySolid.entityCollision == true){
			hSpd = 0;
			tempCollision = true;
		}
	}
	
	// Colisão vertical com entidades solidas
	if(place_meeting(x, y+vSpd, parentEntity)){
		var entitySolid = instance_place(x, y+vSpd, parentEntity)
		if(entitySolid.entityCollision == true){
			vSpd = 0;
			tempCollision = true;
		}
	}
	
	x = x + hSpd;
	y = y + vSpd;
	
	return tempCollision;
	
}