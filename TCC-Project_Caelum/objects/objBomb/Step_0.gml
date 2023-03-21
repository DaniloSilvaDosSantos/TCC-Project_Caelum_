// Inherit the parent event
event_inherited();

// Mudando o sprite da bomba de acordo com o tempo que falta para explodir
if(bombCount <= bombCountMax / 2){
	sprite_index = sprBomb;
	image_speed = 1;
} else{
	sprite_index = sprBombPreExplosion;
	image_speed = 1;
}

bombCount++;

// Caso o tempo de explodir chegue, ela vai explodir
if(bombCount >= bombCountMax){
	if(lifted == true){
		PlayerDropItem();
	}
	instance_destroy();
}