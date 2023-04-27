function CullRange(entity, x1, x2, y1, y2){
	//Desativando a entidade se ela estiver muito longe do jogador de acordo com coordenadas definidas no objCamera
	if (entity.x < x1 or entity.x > x2 or entity.y < y1 or entity.y > y2) 
	and (entity.entityCanBeDesable == true) {
		return true;
	} else return false;
}