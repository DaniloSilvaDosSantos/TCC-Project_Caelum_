//
if (global.gamePaused == false){
	
	// Balanço do fragmento
	if (bounceCount != 0){
		bounce = bounce + (pi*bounceSpd) 
		if (bounce > pi){
			bounce = bounce - pi;
			bounceHeight = bounceHeight * 0.6;
			bounceCount--;
		}
		z = sin(bounce) * bounceHeight;
	}
	else z =0;
	
	// Deterioração do fragmento
	deteriorate++;
	if (deteriorate > deteriorateAfter){
		image_alpha = image_alpha - 1/deteriorateTime;
		if(image_alpha <= 0){
			instance_destroy();
		}
	}
	
	// Atrito que o fragmento vai sofrer
	attrition = 0.05;
	if(z == 0){
		attrition = 0.05;
	}
	
	// Deslocamento do fragmento
	x = x + lengthdir_x(spd, direction);
	y = y + lengthdir_y(spd, direction);
	spd = max(spd - attrition,0);
}



