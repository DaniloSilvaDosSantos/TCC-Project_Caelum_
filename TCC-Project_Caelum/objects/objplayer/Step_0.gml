//Declaração de variaveis gerais de entrada do jogador por teclado ou por um controle

keyLeft = keyboard_check(vk_left) or gamepad_axis_value(global.controller, gp_axislh) <= -0.7 or gamepad_button_check(global.controller, gp_padl);
keyRight = keyboard_check(vk_right) or gamepad_axis_value(global.controller, gp_axislh) >= 0.7 or gamepad_button_check(global.controller, gp_padr);
keyUp = keyboard_check(vk_up) or gamepad_axis_value(global.controller, gp_axislv) <= -0.7 or gamepad_button_check(global.controller, gp_padu);
keyDown = keyboard_check(vk_down) or gamepad_axis_value(global.controller, gp_axislv) >= 0.7 or gamepad_button_check(global.controller, gp_padd);
keyAction = keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(global.controller, gp_face1);
keyAttack = keyboard_check_pressed(ord("X")) or gamepad_button_check_pressed(global.controller, gp_face2);
keyItem = keyboard_check(ord("C")) or gamepad_button_check_pressed(global.controller, gp_face3) or gamepad_button_check_pressed(global.controller, gp_face4); 
keyMenu = keyboard_check_pressed(vk_enter);

//Processando a movimentação

inpDirection=point_direction(0,0,keyRight-keyLeft,keyDown-keyUp); 
// Pega a direção de destino que o jogador vai ir e cria o angulo de uma reta ate lá. 
inpIntensity=(keyRight-keyLeft != 0) or (keyDown-keyUp != 0); 

if (global.gamePaused == false){
	script_execute(playerState);
	invulnerable = max(invulnerable - 1, 0);
}

depth = -bbox_bottom;
