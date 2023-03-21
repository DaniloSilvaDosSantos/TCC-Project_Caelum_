// Script que alimenta as variaveis da camera

// Argument0 sendo a potencia do tremor e o Argument1 os frames que ela vai durar

function ScreenShake(){
	with(global.instCamera){
		if(argument0>shakeRemain){
			shakeMagnetude= argument0;
			shakeRemain = shakeMagnetude;
			shakeLenght = argument1;
		}
	}
	
}