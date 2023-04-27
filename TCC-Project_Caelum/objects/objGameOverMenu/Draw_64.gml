// Mudando as opções de munu selecionadas
keyUp = keyboard_check_pressed(vk_up) or gamepad_axis_value(global.controller, gp_axislv) <= -0.7 or gamepad_button_check_pressed(global.controller, gp_padu);
keyDown = keyboard_check_pressed(vk_down) or gamepad_axis_value(global.controller, gp_axislv) >= 0.7 or gamepad_button_check_pressed(global.controller, gp_padd);
optionSelected += (keyDown-keyUp);
var tempMax = 1;
var tempMin = 0;

if (optionSelected > tempMax) optionSelected  = tempMin;
if (optionSelected  < tempMin) optionSelected  = tempMax;
	

if(keyboard_check(vk_enter) == 1) or (keyboard_check(vk_space) == 1) or (keyboard_check(ord("X")) == 1)
or (gamepad_button_check_pressed(global.controller, gp_face1) ==1) or (gamepad_button_check_pressed(global.controller, gp_start) == 1)
{
	with(objGameOver){
		animationLeading = TRANSITION_IN;
		optionSelected = other.optionSelected;
	}
	instance_destroy();
}

// Desenhando o menu
draw_sprite_ext(
	sprite_index,
	optionSelected,
	x,
	y,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
);
