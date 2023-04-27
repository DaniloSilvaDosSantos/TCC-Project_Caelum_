event_inherited();

// Estados do Weakling
enemyState = ENEMY_STATE.IDLE;

// Sprites do Slime
sprIdle = sprWeakling;
sprMove = sprWeaklingWalk;
sprHurt = sprWeaklingHurt;

sprFrame = 0;
sfxRunCount = 0;
surprised = false;
surprisedCont = 0;

direction = enemyDir;

// Funções do slime
enemyFunction[ENEMY_STATE.IDLE] = WeaklingIdle;
enemyFunction[ENEMY_STATE.WANDER] = WeaklingWander;
enemyFunction[ENEMY_STATE.SURPRISED] = WeaklingSurprised;
enemyFunction[ENEMY_STATE.ATTACK] = WeaklingAttack;
enemyFunction[ENEMY_STATE.HURT] = WeaklingHurt;
enemyFunction[ENEMY_STATE.STUN] = WeaklingStun;
enemyFunction[ENEMY_STATE.DIE] = WeaklingDie;

//Items dropaveis
entityDropList = choose(
	[objBronzeCoin],
	[objHeartDrop],
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1
);