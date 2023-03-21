if (global.gamePaused == false)
{
	image_speed = 1.0
	mask_index = sprExplosionHB;

	if (image_index <= 3){
		
		// Usando da hitbox da explosão para ver se atingiu alguem
		var entityList = ds_list_create();
		var entityCount = instance_place_list(x,y,parentEntity,entityList,false);
		var entityId = noone;
		//Verificando se a hitbox da explosão colidiu com o jogador
		var playerID = instance_place(x, y, objPlayer);
		
		// Enquanto estiver alguem na lista de entidades que foram atingidas
		while (entityCount > 0){
			entityId = entityList[| 0];
			
			// Se a entidade não estiver na lista que guarda que foi atingido
			if (ds_list_find_index(hitByExplosion, entityId) == -1){
				
				// Verificando se a entidade é um inimigo ou se pode ser destruida mesmo 
				with (entityId){
					if (object_is_ancestor(object_index,parentEnemy) == true){
						HurtEnemy(id,10,other.id,24);
					}
					else{
						if (entityHitScript != -1){
							script_execute(entityHitScript);
						}
					}
				}
				// Adicionando a entidade na lista que contem todos que foram atingidos
				ds_list_add(hitByExplosion,entityId);
			}
			// Retirando a entidade da lista inicial dos que foram pegos pela esplosão
			ds_list_delete(entityList,0);
			entityCount--;
		}
		ds_list_destroy(entityList);
		
		// Vendo se o jogador for pego na explosão
		if(playerID != noone){
			
			// Verificando se o mesmo ja foi ferido pela explosão
			if(playerWasHit == false){
				//Ferindo o jogador, e registrando que ele ja foi ferido
				HurtPlayer(point_direction(x, y, objPlayer.x, objPlayer.y), 24, 4);
				playerWasHit = true;
			}	
		}
	}
}
else{
	image_speed = 0.0;
}

