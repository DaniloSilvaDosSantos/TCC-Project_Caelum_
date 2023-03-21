event_inherited();

waitDuration = 60;

//Estado do BlowPider
enemyState = ENEMY_STATE.IDLE;

// Sprites do BlowPider
sprIdle = sprBlowPider;
sprMove= sprBlowPiderJump;
sprHurt = sprBlowPiderHurt;
sprDie = sprBlowPiderDeath;

// Funções doBlowPider
enemyFunction[ENEMY_STATE.IDLE] = BlowPiderIdle;
enemyFunction[ENEMY_STATE.JUMP] = BlowPiderJump;
enemyFunction[ENEMY_STATE.HURT] = BlowPiderHurt;
enemyFunction[ENEMY_STATE.DIE] = BlowPiderDie;