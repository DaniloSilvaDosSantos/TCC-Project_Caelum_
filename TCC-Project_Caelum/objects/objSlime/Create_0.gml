event_inherited();

//Estado do Slime
enemyState = ENEMY_STATE.WANDER;

// Sprites do Slime
sprMove = sprSlime;
sprAttack = sprSlimeAttack;
sprHurt = sprSlimeHurt;
sprDie = sprSlimeDie;

// Funções do slime
enemyFunction[ENEMY_STATE.WANDER] = SlimeWander;
enemyFunction[ENEMY_STATE.CHASE] = SlimeChase;
enemyFunction[ENEMY_STATE.ATTACK] = SlimeAttack;
enemyFunction[ENEMY_STATE.HURT] = SlimeHurt;
enemyFunction[ENEMY_STATE.DIE] = SlimeDie;

//Items dropaveis
entityDropList = choose(
	[objBronzeCoin],
	[objBronzeCoin],
	[objHeartDrop],
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1
);
