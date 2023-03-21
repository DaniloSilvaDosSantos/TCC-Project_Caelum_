function RoomTransitionSistem(){
	
	// Argumento 1 - Type, 
	// Argumento 2 - TargetRoom, a sala de destino
	
	if (!instance_exists(objRoomTransition)){
		with(instance_create_depth(0, 0, -8999, objRoomTransition)){
			type = argument[0];
			target = argument[1];
		}
	} else{
		show_debug_message("Tentando mudar de sala durante uma transição");	
	}
	
}