//Mostrando a caixa de texto

NineSliceBox(sprTextBox, x1, y1, x2, y2, tbBackgroud);
draw_set_font(fontText);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

var tempPrint = string_copy(messageText, 1, textProgress);

//Desenhado as respostas, quaso tenha alguma para dar
if (responses[0] != -1) and (textProgress >= string_length(messageText)){
	for (var i = 0; i < array_length(responses); i++){
		tempPrint += "\n";
		if (i == responseSelected) tempPrint += "> ";
		tempPrint += responses[i];
		if (i == responseSelected) tempPrint += " <";
	}
}

//Desenhado o texto em si
draw_text((x1+x2) / 2, y1+10, tempPrint);
