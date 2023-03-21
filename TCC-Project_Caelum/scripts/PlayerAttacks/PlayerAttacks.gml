 function SwordAttackSlash(){
	
	//Quando o ataque começar
	if (sprite_index != sprPlayerAttackSword){
		//Atualizar e animar o sprite do jogador
		sprite_index = sprPlayerAttackSword;
		image_index = 0;
		sprFrame = 0;
		
		//Limpando todos os dados da lista
		if (!ds_exists(hitByPlayerAttack, ds_type_list)) hitByPlayerAttack = ds_list_create();
		ds_list_clear(hitByPlayerAttack);
		
	}
	
	CalculatePlayerAttack(SprPlayerAttackSlashHB);
	
	//Animar o sprite do jogador
	PlayerSpriteAnimation();
	
	//Se a animação do jogador atacando chegar ao fim
	if(animationEnd == true){
		playerState = PlayerFree;
		animationEnd = false;
	}
	
}

function SwordAttackSpin(){

	//Não foi implementado ainda
	
}
 
 function CalculatePlayerAttack(){

	//Usando o sprite da hitbox do ataque para verificar se acertou algo
	mask_index = argument0;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, parentEntity, hitByAttackNow, false);
	if (hits > 0){
		for (var i = 0; i < hits; i++ )
		{
			// Se esta instancia não foi acertada pelo ataque ainda, acerte ela
			var hitID = hitByAttackNow[| i]; // ds_list_find_value(hitByAttackNow, i);
			if(ds_list_find_index(hitByPlayerAttack, hitID) == -1)
			{
				ds_list_add(hitByPlayerAttack, hitID);
				with(hitID)
				{
					if (object_is_ancestor(object_index, parentEnemy) and (entityAttackImune == false)){
						audio_play_sound(sndGetHit,10,false);
						HurtEnemy(id, other.damagePower, other.id, 12);
					}
					else if (entityHitScript != -1) and (entityAttackImune == false){
						audio_play_sound(sndJarBreak, 10, false);
						script_execute(entityHitScript);	
					}
				}
			}
		}
	}
	
	ds_list_destroy(hitByAttackNow);
	mask_index = sprPlayer;
}

function HurtEnemy(enemy, damage, source, knockback){
	
	with(enemy){
		
		if(enemyState != ENEMY_STATE.DIE){
			enemyHitPoints = enemyHitPoints - damage;
			flash = 1;
			
			// Se o HP chegou a zero ele morre, se não vai para o estado ferido 
			if(enemyHitPoints <= 0){
				enemyState = ENEMY_STATE.DIE;
			} 
			else{
				if(enemyState != ENEMY_STATE.HURT){
					enemyStatePrevious = enemyState;
				}
				enemyState = ENEMY_STATE.HURT;
			}
			image_index = 0;
			// Empurrando a entidade
			if(knockback != 0){
				var knockbackDirection = point_direction(x, y, (source).x, (source).y);
				direction = knockbackDirection;
				xTo = x - lengthdir_x(knockback, knockbackDirection);
				yTo = y - lengthdir_y(knockback, knockbackDirection);
			}
			
		}
	}
}