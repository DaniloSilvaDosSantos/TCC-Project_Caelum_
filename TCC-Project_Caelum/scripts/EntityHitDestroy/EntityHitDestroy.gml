
function EntityHitDestroy(){
	instance_destroy();
}
function EntityHitDamage(){
	entityHits++;
	if(entityHits >= entityHitsToDestroi){
		instance_destroy();
	}
	image_index = entityHits;
}