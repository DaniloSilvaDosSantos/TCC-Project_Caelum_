// Verificando qual porta tem um controle

var controllerNumSlots = gamepad_get_device_count();
global.controllerIsConected = false;

for(var i = 0; i < controllerNumSlots+1; i++){
	if(gamepad_is_connected(i))
	{
		global.controllerIsConected = true;
		global.controller = i;
	}
}