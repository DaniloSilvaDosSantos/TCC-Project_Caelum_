if(transitionAnimation == true){
	// Verificar se esta colidindo com o jogador para que assim possa trocar de sala
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
	if (instance_exists(objPlayer)) and (position_meeting(objPlayer.x, objPlayer.y, id)){
		if(global.playerHasGotHit == false){
			room_goto(rMichaelJackson);
		}else{
			room_goto(targetRoom);
		}
	}
}

