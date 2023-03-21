depth = (-bbox_bottom) +100;

if (ds_list_find_index(global.savedObjectProperties, id) != -1){
	doorIsOpen = true;
	sprite_index = sprDoorOpen;
	entityCollision = false;
} else{
	doorIsOpen = false;
}