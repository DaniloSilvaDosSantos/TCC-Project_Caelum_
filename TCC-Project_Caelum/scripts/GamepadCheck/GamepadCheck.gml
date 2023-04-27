function GamepadCheck(controller){
	//Verificando se algum input do controle foi prescionado
	for ( var i = gp_face1; i < gp_axisrv; i++ ) {
		if ( gamepad_button_check(controller, i ) ) return true;
	}
	if (gamepad_axis_value(controller, gp_axislh) != 0) return true;
    if (gamepad_axis_value(controller, gp_axislv) != 0) return true;
    if (gamepad_axis_value(controller, gp_axisrh) != 0) return true;
    if (gamepad_axis_value(controller, gp_axisrv) != 0) return true;
	
	return false;
}