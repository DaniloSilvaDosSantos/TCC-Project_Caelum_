// Desenhando a vida do jogador
var tempPlayerLife = global.playerLife;
var tempPlayerMaxHearts = global.playerLifeMax / LIFE_PER_HEARTH;
var tempPlayerLifeFrag = tempPlayerLife % LIFE_PER_HEARTH;
// Para descobrir qual dos corações de vida não esta completo
var tempPlayerPartHeart = floor(tempPlayerLife / LIFE_PER_HEARTH) + 1;

if (room != rSplashScreen) and (room != rLogoScreen) and (room != rTitleScreen)
and (room != rGameOver) and (room != rOpenYourEyes) and (room != rCronologyScreen)
and (room != rEndGame) and (room != rMichaelJackson){
	draw_set_alpha(1);
} else{
	draw_set_alpha(0);
}

for(var i = 1; i <= tempPlayerMaxHearts; i++;)
{
	var tempImageIndex = ((i * LIFE_PER_HEARTH) > tempPlayerLife);
	
	if(tempPlayerLife != 0){
		if(i == tempPlayerPartHeart){ 
			tempImageIndex = 1 + tempPlayerLifeFrag;
			}
	}
	else{
		tempImageIndex = 1;
	}
	
	draw_sprite(sprLifeHeart, tempImageIndex, 6 + ((i-1) * 8), 8);
}

// Desenhando a quantidade de moedas que o jogador possui

// Icone da moeda
var xUI, yUI;
xUI = 276;
yUI = 164;
draw_sprite(sprCoinUI, 0, xUI, yUI);

// Desenhando os numeros de moedas
draw_set_color(c_black);
draw_set_font(fontText);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

xUI = xUI + sprite_get_width(sprCoinUI) + 4;
yUI = 161;
var text = string(global.playerMoney);
draw_text(xUI+1, yUI, text);
draw_text(xUI, yUI+1, text);
draw_text(xUI-1, yUI, text);
draw_text(xUI, yUI-1, text);
draw_set_color(c_white);
draw_text(xUI, yUI, text);

// Desenhando a quantidade de chaves que o jogador possui

// Desenhando o icone da chave
xUI = 276;
yUI = 148;
draw_sprite(sprKeyUI, 0, xUI, yUI);

// Desenhando a quantidade de chaves
draw_set_color(c_black);
draw_set_font(fontText);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

xUI = xUI + sprite_get_width(sprCoinUI) + 4;
yUI = 146;
text = string(global.playerKeys);
draw_text(xUI+1, yUI, text);
draw_text(xUI, yUI+1, text);
draw_text(xUI-1, yUI, text);
draw_text(xUI, yUI-1, text);
draw_set_color(c_white);
draw_text(xUI, yUI, text);

// Desenhando os botões

// Desenhando o botão C dos items equipados
xUI = 286;
yUI = 16;
if(keyboard_check(ord("C")) == 0){
	draw_sprite(sprCButtonUI, 0,xUI, yUI);
} else{
	draw_sprite(sprCButtonUI, 1,xUI, yUI);
}

//Verificando se o jogador possui algum item equipado e desenhando o icone dele
if(global.playerItemEquiped != -1){
	
	if(global.playerItemEquiped == "bomb"){
		
		draw_sprite(sprBombUI, 0, xUI - 2, yUI - 5);
	
		// Desenhando a quantidade atual de munição
		draw_set_font(ammoText);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_set_color(c_black);
		draw_text(
			xUI + sprite_get_width(sprCButtonUI)+3,
			yUI + sprite_get_height(sprCButtonUI)-2,
			string(global.playerBombAmmo)
		);
		draw_text(
			xUI + sprite_get_width(sprCButtonUI)+1,
			yUI + sprite_get_height(sprCButtonUI)-2,
			string(global.playerBombAmmo)
		);
		draw_text(
			xUI + sprite_get_width(sprCButtonUI)+2,
			yUI + sprite_get_height(sprCButtonUI)-3,
			string(global.playerBombAmmo)
		);
		draw_text(
			xUI + sprite_get_width(sprCButtonUI)+2,
			yUI + sprite_get_height(sprCButtonUI)-1,
			string(global.playerBombAmmo)
		);
		
		draw_set_color(c_white);
		draw_text(
			xUI + sprite_get_width(sprCButtonUI)+2,
			yUI + sprite_get_height(sprCButtonUI)-2,
			string(global.playerBombAmmo)
		);
		
	}
}

// Desenhando o botão X do comando de ataque
xUI = 266;
yUI = 16;

if(keyboard_check(ord("X")) == 0){
	draw_sprite(sprXButtonUI, 0,xUI, yUI);
} else{
	draw_sprite(sprXButtonUI, 1,xUI, yUI);
}

// Verificando se jogador possui a espada desbloqueada, se sim desenhar ela
if(global.playerSwordUnlock == true){
	draw_sprite(sprSwordUI, 0, xUI - 4, yUI - 9);
}

// Desenhando o botão Z de ação
xUI = 246;
yUI = 16;
if(keyboard_check(ord("Z")) == 0){
	draw_sprite(sprZButtonUI, 0,xUI, yUI);
} else{
	draw_sprite(sprZButtonUI, 1,xUI, yUI);
}

// Desenhando a palavra ação
draw_set_font(ammoText);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_color(c_black);
draw_text(
	xUI + sprite_get_width(sprCButtonUI)+1,
	yUI + sprite_get_height(sprCButtonUI)-11,
	"agir"
);
draw_text(
	xUI + sprite_get_width(sprCButtonUI)-1,
	yUI + sprite_get_height(sprCButtonUI)-11,
	"agir"
);
draw_text(
	xUI + sprite_get_width(sprCButtonUI),
	yUI + sprite_get_height(sprCButtonUI)-12,
	"agir"
);
draw_text(
	xUI + sprite_get_width(sprCButtonUI),
	yUI + sprite_get_height(sprCButtonUI)-10,
	"agir"
);
		
draw_set_color(c_white);
draw_text(
	xUI + sprite_get_width(sprCButtonUI),
	yUI + sprite_get_height(sprCButtonUI)-11,
	"agir"
);
