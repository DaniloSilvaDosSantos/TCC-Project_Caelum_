event_inherited();

// Variaveis esenciais
enemyState = ENEMY_STATE.IDLE;
hSpd = 0;
vSpd = 0;
xTo = xstart;
yTo = ystart;
dir = 0;
timePassed = 0;
wait = 0;
waitDuration = 60;
aggroCheck = 0;
aggroCheckDuration = 10;
enemyStateTarget = enemyState;
enemyStatePrevious = enemyState;
enemyStateWait = 0;
enemyStateWaitDuration = 0;

//Sprites do inimigo
sprMove = sprSlime;

//Funções do inimigo
enemyFunction[ENEMY_STATE.IDLE] = -1;
enemyFunction[ENEMY_STATE.WANDER] = -1;
enemyFunction[ENEMY_STATE.CHASE] = -1;
enemyFunction[ENEMY_STATE.ATTACK] = -1;
enemyFunction[ENEMY_STATE.HURT] = -1;
enemyFunction[ENEMY_STATE.DIE] = -1;
enemyFunction[ENEMY_STATE.JUMP] = -1;
enemyFunction[ENEMY_STATE.WAIT] = EnemyWait;