function PlayerPushObject(){
	
	var pushDone = false;
	var block = instance_place(x + hSpd, y + vSpd, objMovableBlock);
	
	// Verificando se na frente do jogador esta um bloco empurravel e se deu o input de empurrar(o mesmo andar)
	if(block != noone) and (inpIntensity != 0){
		
		pushDone = true;
		PlayerActOutAnimation(sprPlayerHurt);
		var pushDir = objPlayer.image_index;
		
		//Verificando a direção que vai ser empurrado o objeto
		switch(round(pushDir)){
			case 0 : { //Para a direita
				with(block){
					if(objPlayer.inpDirection == 0){
						dir = point_direction(x, y, x + moveDistance, y);
						xTo = x + lengthdir_x(moveDistance, dir);
						yTo = y + lengthdir_y(moveDistance, dir);
						blockState = BlockMoving;
					}
				}
			}; break;
			case 1 : { //Para cima
				with(block){
					if(objPlayer.inpDirection == 90){
						dir = point_direction(x, y , x, y - moveDistance);
						xTo = x + lengthdir_x(moveDistance, dir);
						yTo = y + lengthdir_y(moveDistance, dir);
						blockState = BlockMoving;
					}
				}
			}; break;
			case 2 : { //Para esquerda
				with(block){
					if(objPlayer.inpDirection == 180){
						dir = point_direction(x, y, x - moveDistance, y);
						xTo = x + lengthdir_x(moveDistance, dir);
						yTo = y + lengthdir_y(moveDistance, dir);
						blockState = BlockMoving;
					}
				}
			}; break;
			case 3 : { //Para baixo
				with(block){
					if(objPlayer.inpDirection == 270){
						dir = point_direction(x, y, x, y + moveDistance);
						xTo = x + lengthdir_x(moveDistance, dir);
						yTo = y + lengthdir_y(moveDistance, dir);
						blockState = BlockMoving;
					}
				}
			}; break;
		}
		
		return pushDone;
	}
}