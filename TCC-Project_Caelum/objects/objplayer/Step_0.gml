//Declaração de variaveis gerais de entrada do jogador

keyLeft=keyboard_check(vk_left);
keyRight=keyboard_check(vk_right);
keyUp=keyboard_check(vk_up);
keyDown=keyboard_check(vk_down);
keyAction=keyboard_check_pressed(ord("Z"));
keyAttack=keyboard_check_pressed(ord("X"));
keyItem=keyboard_check(ord("C")); 
keyMenu=keyboard_check_pressed(vk_enter);

//Processando a movimentação

inpDirection=point_direction(0,0,keyRight-keyLeft,keyDown-keyUp); 
// Pega a direção de destino que o jogador vai ir e cria o angulo de uma reta ate lá. 
inpIntensity=(keyRight-keyLeft != 0) or (keyDown-keyUp != 0); 

if (global.gamePaused == false){
	script_execute(playerState);
	invulnerable = max(invulnerable - 1, 0);
}

depth = -bbox_bottom;
