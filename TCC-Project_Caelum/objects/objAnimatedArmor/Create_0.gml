event_inherited();

waitDuration = 90;
stunDuration = 300;
stunCont = 0;

//Estado do BlowPider
enemyState = ENEMY_STATE.IDLE;

// Sprites do BlowPider
sprIdle = sprAnimatedArmor;
sprChase = sprAnimatedArmorChase;

// Funções doBlowPider
enemyFunction[ENEMY_STATE.IDLE] = AnimatedArmorIdle;
enemyFunction[ENEMY_STATE.JUMP] = AnimatedArmorJump;
enemyFunction[ENEMY_STATE.CHASE] = AnimatedArmorChase;
enemyFunction[ENEMY_STATE.HURT] = AnimatedArmorStun;
enemyFunction[ENEMY_STATE.DIE] = AnimatedArmorDie;