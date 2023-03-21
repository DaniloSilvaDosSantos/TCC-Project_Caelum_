if(buttonWasPressed == false){
	audio_play_sound(sndButtonPressed, 100, false);
    //Chamando a função que abre a porta
    ButtonDoorOpen(
        entityButtonArgs[0],
        entityButtonArgs[1],
        entityButtonArgs[2],
        entityButtonArgs[3]
    );
}
