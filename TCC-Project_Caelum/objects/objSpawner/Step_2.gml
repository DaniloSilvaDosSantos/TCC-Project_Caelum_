if(instance_exists(objPlayer)){
	var mob = instance_nearest(x, y, spawnMob);
	if(mob != noone){
		if(point_distance(x, y, objPlayer.x, objPlayer.y) >= 400) and
		(point_distance(x, y, mob.x, mob.y) >= 100){
			//Criando a entidade se o jogador e se existe uma entidade do mesmo 
			//tipo da que vai ser criada estiver distante
			instance_create_depth(x, y, -bbox_bottom, spawnMob);
		}
	}else{
		if(point_distance(x, y, objPlayer.x, objPlayer.y) >= 400){
			//Criando a entidade se o jogador estiver distante
			instance_create_depth(x, y, -bbox_bottom, spawnMob);
		}
	}
}