// Verificar se esta colidindo com o jogador

if(transitionAnimation == true){
	if (instance_exists(objPlayer)) and (position_meeting(objPlayer.x, objPlayer.y, id)){
		if (!instance_exists(objRoomTransition)) and (objPlayer.playerState != PlayerDeath){
			global.targetRoom = targetRoom;
			global.targetX = targetX;
			global.targetY = targetY;
			global.targetDirection = objPlayer.direction;
			with (objPlayer) playerState = PlayerRoomTransition;
			RoomTransitionSistem(TRANSITION_TYPE.FADE, targetRoom);
			instance_destroy();
		}
	}

}else{
	if (instance_exists(objPlayer)) and 
	(position_meeting(objPlayer.x, objPlayer.y, id)){
		room_goto(targetRoom);
	}
}

