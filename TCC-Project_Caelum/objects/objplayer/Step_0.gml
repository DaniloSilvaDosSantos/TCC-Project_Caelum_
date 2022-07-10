//Declaração de variaveis gerais de entradavvvd do jogador

keyLeft=keyboard_check(vk_left);
keyRight=keyboard_check(vk_right);
keyUp=keyboard_check(vk_up);
keyDown=keyboard_check(vk_down);
keyAction=keyboard_check_pressed(ord("Z"));
keyAttack=keyboard_check_pressed(ord("X"));
keyMenu=keyboard_check_pressed(vk_enter);

//Processando a movimentação

inpDirection=point_direction(0,0,keyRight-keyLeft,keyDown-keyUp); 
// Pega a direção de destino que o jogador vai ir e cria o angulo de uma reta ate lá. 
inpIntensity=(keyRight-keyLeft!=0) or (keyDown-keyUp!=0); // para saber se o jogador esta apertando duas teclas do mesmo eixo.

hSpd=lengthdir_x(inpIntensity*spdRun, inpDirection);
vSpd=lengthdir_y(inpIntensity*spdRun, inpDirection);
// calculando o deslocamento nescessario nos eixos x e y para se chegar na direção de destino.

x+=hSpd;
y+=vSpd;

//Mudar o endereço de sprite do personagem do jogador.

var tempOldSprite=sprite_index;
if (inpIntensity!=0){
	direction=inpDirection;
	sprite_index=sprPlayerRun;
} else {
	sprite_index = sprIdle;
}

if (tempOldSprite != sprite_index) sprFrame=0; 

//Atualizar a imagem do sprite do jogador
PlayerSpriteAnimation();



