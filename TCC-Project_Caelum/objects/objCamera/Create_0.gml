// Configurando a camera

cam = view_camera[0];
follow = objPlayer;
wViewHalf = camera_get_view_width(cam) * 0.5;
hViewHalf = camera_get_view_height(cam) * 0.5;
xTo= xstart;
yTo= ystart;

//Variaveis para tremer a camera
shakeLenght =0;
shakeMagnetude =0;
shakeRemain = 0;

desativateCont = 0;
desativateContMax = 12;

