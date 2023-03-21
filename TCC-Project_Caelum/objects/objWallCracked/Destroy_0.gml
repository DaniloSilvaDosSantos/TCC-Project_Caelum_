// Verificando se a entidade ja foi destruida
if(ds_list_find_index(global.savedObjectProperties, id) != -1){
	
	//Não dropa nada
	
}else{
	audio_play_sound(sndJarBreak, 10, false);
	//Drop de fragmentos
	if (entityFragmentCount > 0){
		fragArray = array_create(entityFragmentCount, entityFragment);
		DropItems(x, y, fragArray);
	}
	
	ds_list_add(global.savedObjectProperties, id);
	show_debug_message(ds_list_find_index(global.savedObjectProperties, id));

	// Se essa entidade for destruida, destruir outra
	var x2 = entityChainDestruction[0];
	var y2 = entityChainDestruction[1];

	var entityDestroy = instance_position(x2, y2, objWallCracked);

	with(entityDestroy){
		ds_list_add(global.savedObjectProperties, id);
		show_debug_message(ds_list_find_index(global.savedObjectProperties, id));
		instance_destroy();
	}
}