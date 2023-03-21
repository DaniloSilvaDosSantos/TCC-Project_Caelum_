function EnemyWait(){
	if (++enemyStateWait >= enemyStateWaitDuration){
		enemyStateWait = 0;
		enemyState = enemyStateTarget;
	}
}