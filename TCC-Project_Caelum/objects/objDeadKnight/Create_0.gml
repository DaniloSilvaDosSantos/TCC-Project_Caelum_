event_inherited();
image_speed = 0;

if (ds_list_find_index(global.savedObjectProperties, id) != -1){
	chestIsOpen = true;
	image_index = 1;
} else{
	chestIsOpen = false;
	image_index = 0;
}
