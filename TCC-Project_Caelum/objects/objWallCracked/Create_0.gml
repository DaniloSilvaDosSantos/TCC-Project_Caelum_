event_inherited();
image_speed = 0;

if (ds_list_find_index(global.savedObjectProperties, id) != -1){
	wallIsOpen = true;
	instance_destroy();
} else{
	wallIsOpen = false;
}
