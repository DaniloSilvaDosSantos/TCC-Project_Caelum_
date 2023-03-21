// Argumentos a serem recebidos (sprite, x1, y1, x2, y2)

function NineSliceBox(){
	// Armazenando os argumentos recebidos em variaveis
	var tempSize = sprite_get_width(argument0)/3;
	var tempX1 = argument1;
	var tempY1 = argument2;
	var tempX2 = argument3;
	var tempY2 = argument4;
	var bg = argument5;
	
	// Definindo o tamanho da caixa, quantidade de colunas e linhas
	var tempW = tempX2 - tempX1;
	var tempH = tempY2 - tempY1;
	var tempColumns = tempW div tempSize;
	var tempRows = tempH div tempSize;
	
	// Desenhar os CANTOS da caixa
	
	//Topo Esquerdo
	draw_sprite_part(argument0, bg, 0, 0, tempSize, tempSize, tempX1, tempY1);
	//Topo Direito
	draw_sprite_part(argument0, bg, tempSize*2, 0, tempSize, tempSize, tempX1+tempW-tempSize, tempY1);
	//Inferior Esquerdo
	draw_sprite_part(argument0, bg, 0, tempSize*2, tempSize, tempSize, tempX1, tempY1+tempH-tempSize);
	//Inferior Direito
	draw_sprite_part(argument0, bg, tempSize*2, tempSize*2, tempSize, tempSize, tempX1+tempW-tempSize, tempY1+tempH-tempSize);
	
	// Desenhar as BORDAS da caixa
	
	//Borda Esquerda
	draw_sprite_part_ext(argument0, bg, 0, tempSize, tempSize, 1, tempX1, tempY1+tempSize, 1, tempH-(tempSize*2), c_white, 1);
	//Borda Direita
	draw_sprite_part_ext(argument0, bg, tempSize*2, tempSize, tempSize, 1, tempX1+tempW-tempSize, tempY1+tempSize, 1,  tempH-(tempSize*2), c_white, 1);
	//Borda Superior
	draw_sprite_part_ext(argument0, bg, tempSize, 0, 1, tempSize, tempX1+tempSize, tempY1, tempW-(tempSize*2), 1, c_white, 1);
	//Borda Inferior
	draw_sprite_part_ext(argument0, bg, tempSize, tempSize*2, 1, tempSize, tempX1+tempSize, tempY1+tempH-(tempSize), tempW-(tempSize*2), 1, c_white, 1);
	
	
	// Desenhar o MEIO da caixa

	draw_sprite_part_ext(argument0, bg, tempSize, tempSize, 1, 1, tempX1+tempSize, tempY1+tempSize,tempW-(tempSize*2), tempH-(tempSize*2), c_white, 1);

}