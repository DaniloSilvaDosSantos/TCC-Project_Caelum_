// Atualizar o destino da camera
if (instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;

	if(++desativateCont >= desativateContMax){
		//Variaveis uteis para desativar entidades distantes
		var x1 = follow.x - wViewHalf*2;
		var x2 = follow.x + wViewHalf*2;

		var y1 = follow.y - hViewHalf*2;
		var y2 = follow.y + hViewHalf*2;

		//Desativando entidades que estão a uma tela de distancia do objeto que a camera esta seguindo
		for (var i = 0; i < array_length(global.deactivateList); i++) {
			with (global.deactivateList[i]) {
				if (CullRange(self, x1, x2, y1, y2) == true) {
					instance_deactivate_object(self);
				}
			}
		}
		//Ativando novamente esse objeto se ele estiver dentro dessa região
		instance_activate_region(x1, y1, wViewHalf * 4, hViewHalf * 4, true);
	}
}

// Atualizar o local atual da camera
x += (xTo-x) / 12;
y += (yTo-y) / 12;

// Manter a camera dentro da sala
x = clamp(x, wViewHalf, room_width-wViewHalf);
y = clamp(y, hViewHalf, room_height-hViewHalf);

// Tremer a camera

y += random_range(-shakeRemain, shakeRemain);
x += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - ((1/shakeLenght) * shakeMagnetude));
camera_set_view_pos(cam, x - wViewHalf, y - hViewHalf);

