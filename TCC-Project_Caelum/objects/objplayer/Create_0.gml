if(global.playerHasWakeUp == false){
	playerState = PlayerWakeUp;
} else{
	playerState = PlayerFree;
}

playerAttackState = SwordAttackSlash;
hitByPlayerAttack = -1;
lastPlayerState = playerState;

CollisionID = layer_tilemap_get_id(layer_get_id("CollisionTiles"));

hSpd = 0;
vSpd = 0;
spdRun = 1.8;
spdRoll = 2.8;
disRoll = 64;
spdBonk = 1.6;
disBonk = 32;
spdDeathBonk = 0;
spdDeathJump = 0;
disBonkRemaining = 0;
disBonkZHeight = 8;
damagePower = 2;
z = 0;
invulnerable = 0;
playerWait = 0;

image_speed = 0;
animationEndScript = -1;
itemGetSprite = -1;

if(global.insLifted == noone){
	sprRoll = sprPlayerRoll;
	sprRun = sprPlayerRun;
	sprIdle = sprPlayer;
} else{
	sprRoll = sprPlayerRoll;
	sprRun = sprPlayerRunCarring;
	sprIdle = sprPlayerCarring;
}
sprFrame = 0;

if (global.targetX != -1){
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}


