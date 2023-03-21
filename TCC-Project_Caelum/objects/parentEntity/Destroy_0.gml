// Drop dos itens e fragmentos
if (entityFragmentCount > 0){
	fragArray = array_create(entityFragmentCount, entityFragment);
	DropItems(x, y, fragArray);
}
if (entityDropList != -1){
	DropItems(x, y, entityDropList);
}


