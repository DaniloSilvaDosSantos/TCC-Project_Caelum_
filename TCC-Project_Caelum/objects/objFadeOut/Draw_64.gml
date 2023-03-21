
transitionPercent = max(0, transitionPercent - TRANSITION_SPEED/2);
// quando a tela ficar totalmente visivel
if (transitionPercent <= 0){
		instance_destroy();
}

draw_set_alpha(transitionPercent);
draw_set_color(c_black);
draw_rectangle(0, 0, width, height, false);