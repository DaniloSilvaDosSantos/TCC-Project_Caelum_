depth = (-bbox_bottom) +100;

if (doorIsOpen == true){
	entityCollision = false;
	sprite_index = sprDoorOpen;
} else{
	entityCollision = true;
	sprite_index = sprDoorClosed
}