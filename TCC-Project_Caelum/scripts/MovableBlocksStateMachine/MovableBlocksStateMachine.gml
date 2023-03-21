function BlockIdle(){
	//Nada acontece
}
function BlockMoving(){
	//Definindo a velocidade do movimento
	var spd = moveSpd;
	var DistanceToGo = point_distance(x, y, xTo, yTo);
	
	// Se ainda tem distancia a ser percorrida, mover se
	if(DistanceToGo > 0){
		dir = point_direction(x, y, xTo, yTo);
		hSpd = lengthdir_x(spd, dir);
		vSpd = lengthdir_y(spd, dir);
		
		//Verificando se colidiu em algo, se não vai contunuar o movimento
		MovableBlocksCollision();
		
	} else{ // Se não, parar de se mover
		xTo = x;
		yTo = y;
		blockState = BlockIdle;
	}
	
}