//Loop da entidade
if (!global.gamePaused)
{
	depth = -bbox_bottom;
	if(lifted == true) and (instance_exists(objPlayer)){
		if(objPlayer.sprite_index != sprPlayerLift){
			x = objPlayer.x;
			y = objPlayer.y;
			entityCollision = false;
			z = 12;
			depth = objPlayer.depth - 1; 
		}
	}
	if(lifted == false){
		// Se a entidade foi jogada
		if(thrown == true){
			// Deslocando a entidade e aplicando a gravidade
			hSpdEnt = lengthdir_x(spdThrow, direction);
			vSpdEnt = lengthdir_y(spdThrow, direction);
			x = x + hSpdEnt;
			y = y + vSpdEnt;
			z = z - zGravity;
			zGravity = zGravity * 1.2;
			
			// Se encostar no chão ou bater em uma parede, quebrar o objeto
			if(z <= 0){
				thrown = false;
				if(entityThrowBreak == true){
					instance_destroy();
				}
			}
			if(tilemap_get_at_pixel(collisionMapId, x, y) > 0){
				z = 0;
				thrown = false;
				if(entityThrowBreak == true){
					instance_destroy();
				}
			}
			// Se colidir com uma entidade, causar dano ou destruir ela e quebrar o objeto jogado
			var entityGetHit = instance_place(x, y, parentEntity);
			var entityThrowCollided = false;
			if(entityGetHit != noone) and (entityThrowBreak == true) {
				with(entityGetHit){
					// Verificando se a entidade é um inimigo ou um objeto destrutivel
					if(object_is_ancestor(object_index, parentEnemy) ==  true){
						HurtEnemy(id, 5, other.id, 24);
						entityThrowCollided = true;
					} 
				}
				// Se o objeto jogado colidiu
				if(entityThrowCollided == true){
					instance_destroy();
				}
				
			}
			// Se colidir com uma entidade e o objeto jogado não for quebrar, cair no chão
			if(entityGetHit != noone) and (entityThrowBreak == false){
				if(object_get_name(entityGetHit.object_index) == "objWallCracked"){
					z = 0;
					thrown = false;
				}
				// Se colidir com um inimigo, explodir
				with(entityGetHit){
					if(object_is_ancestor(object_index, parentEnemy) ==  true){
						entityThrowCollided = true;
					} 
				}
				// Se o objeto jogado colidiu
				if(entityThrowCollided == true){
					instance_destroy();
				}
			}
		}
	}
	flash = max(flash-0.1, 0)
}


