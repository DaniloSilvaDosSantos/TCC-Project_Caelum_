function DropItems(){
	//Argumentos x, y e [items]
	var xItem = argument0;
	var yItem = argument1;
	var itemsArray = argument2;
	
	//Pegando o tamanho do array de itens para decidir se vai "doprar' um unico item ou um circulo de itens"
	var tempItems = array_length(itemsArray);
	if (tempItems > 1){
		//Definindo angulos entre os itens "dropados" e criando os mesmos
		var tempAnglePItems = 360/tempItems;
		var tempAngle = random(360);
		for (var i = 0; i < tempItems; i++){
			with(instance_create_layer(xItem, yItem-8, "Instances", itemsArray[i])){
				direction = tempAngle;
				spd = 0.5 + (tempItems * 0.1) + random(0.1); 
			}
			tempAngle = tempAngle + tempAnglePItems;
		}
	} else {
		instance_create_layer(xItem, yItem-8, "Instances", itemsArray[0]);
	}
}