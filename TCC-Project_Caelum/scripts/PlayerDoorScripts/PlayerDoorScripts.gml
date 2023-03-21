function DoorOpen(doorID, otherDoorX, otherDoorY){
	
	audio_play_sound(sndOpenChest, 20, false);
	//Verificando se o jogador possui alguma chave
	if(global.playerKeys >= 1){
		//Abrindo a porta
		with(doorID){
			sprite_index = sprDoorOpen;
			doorIsOpen = true;
			entityCollision = false;
			ds_list_add(global.savedObjectProperties, doorID);
		}
		//Abrindo o outro lado da porta
		var otherDoorID = instance_position(otherDoorX, otherDoorY, objDoorLocked);
		with(otherDoorID){
			sprite_index = sprDoorOpen;
			doorIsOpen = true;
			entityCollision = false;
			ds_list_add(global.savedObjectProperties, otherDoorID);
		}
		global.playerKeys = global.playerKeys - 1;
	}
	
}

function ButtonDoorOpen(door1X, door1Y, door2X, door2Y){
	
	//Abrindo as portas
	var door1ID = instance_position(door1X, door1Y, objDoorClosed);
	var door2ID = instance_position(door2X, door2Y, objDoorClosed);
	
	with(door1ID){
		sprite_index = sprDoorOpen;
		doorIsOpen = true;
		entityCollision = false;
		ds_list_add(global.savedObjectProperties, door1ID);
	}
	with(door2ID){
		sprite_index = sprDoorOpen;
		doorIsOpen = true;
		entityCollision = false;
		ds_list_add(global.savedObjectProperties, door2ID);
	}
	buttonWasPressed = true;
	image_index = 1;
}

function DoorBossClose(door1X, door1Y, door2X, door2Y, door3X, door3Y, door4X, door4Y){
	
	audio_play_sound(sndOpenChest, 20, false);
	//Fechando as portas de chefe
	var door1ID = instance_position(door1X, door1Y, objDoorBoss);
	var door2ID = instance_position(door2X, door2Y, objDoorBoss);
	var door3ID = instance_position(door3X, door3Y, objDoorBoss);
	var door4ID = instance_position(door4X, door4Y, objDoorBoss);
	
	with(door1ID){
		sprite_index = sprDoorClosed;
		doorIsOpen = false;
		entityCollision = true;
	}
	with(door2ID){
		sprite_index = sprDoorClosed;
		doorIsOpen = false;
		entityCollision = true;
	}
	with(door3ID){
		sprite_index = sprDoorClosed;
		doorIsOpen = false;
		entityCollision = true;
	}
	with(door4ID){
		sprite_index = sprDoorClosed;
		doorIsOpen = false;
		entityCollision = true;
	}
	
}
function DoorBossOpen(door1X, door1Y, door2X, door2Y, door3X, door3Y, door4X, door4Y){
	
	audio_play_sound(sndOpenChest, 20, false);
	//Abrindo as portas de chefe
	var door1ID = instance_position(door1X, door1Y, objDoorBoss);
	var door2ID = instance_position(door2X, door2Y, objDoorBoss);
	var door3ID = instance_position(door3X, door3Y, objDoorBoss);
	var door4ID = instance_position(door4X, door4Y, objDoorBoss);
	
	with(door1ID){
		sprite_index = sprDoorOpen;
		doorIsOpen = true;
		entityCollision = false;
	}
	with(door2ID){
		sprite_index = sprDoorOpen;
		doorIsOpen = true;
		entityCollision = false;
	}
	with(door3ID){
		sprite_index = sprDoorOpen;
		doorIsOpen = true;
		entityCollision = false;
	}
	with(door4ID){
		sprite_index = sprDoorOpen;
		doorIsOpen = true;
		entityCollision = false;
	}
	
}