if(!isPaused) exit;

//background
draw_set_alpha(.5);
draw_set_colour(c_black);
draw_rectangle(0 ,0 , display_get_gui_width() , display_get_gui_height() , false);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_colour(c_black)


//menu buttons
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fontForPauseScreen);

for (var i = 0; i< array_length(buttonList); i++)
{
	var c = c_white;
	
	//highlight the button you are on
	if i == pos{
		c = c_yellow;
	}
	draw_set_color(c);
	draw_text(menuX,menuY - 64 + (i * 50), buttonList[i]);
}