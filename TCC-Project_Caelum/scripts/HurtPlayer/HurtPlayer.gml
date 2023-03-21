function HurtPlayer(enemyAttackDir, knockback, damage){
	audio_play_sound(sndGetHit, 10, false);
	if(objPlayer.invulnerable <= 0){
		global.playerLife = max(0, global.playerLife - damage);
		
		if(global.playerLife > 0){
			// Causando dano no jogador e o empurrando 
			with(objPlayer){
				playerState = PlayerBonk;
				disBonkRemaining = knockback;
				invulnerable = 60;
				direction = enemyAttackDir - 180;
				ScreenShake(8, 30);
			}
		} else{
			// Matando o jogador
			with(objPlayer){
				playerState = PlayerDeath;
				disBonkRemaining = knockback;
				spdDeathBonk = spdBonk;
				spdDeathJump = 0.5;
				direction = enemyAttackDir - 180;
				ScreenShake(8, 30);
			}
		}
	}
}