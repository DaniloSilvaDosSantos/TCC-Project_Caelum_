// Atualizar o destino da camera
if (instance_exists(follow)){

xTo = follow.x;
yTo = follow.y;

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

