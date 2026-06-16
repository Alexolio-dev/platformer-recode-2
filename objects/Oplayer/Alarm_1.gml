//if room is desert
if (room == Desert)
{
    //make a random number out of 360
	var r = random(360)
	//if it is smaller tan 120 make wind blow this way
    if r < 120
    {
        DesertWind = -0.5; // wind left
    }
	//if its bigger than 240 make wind blow that way
    else if r > 240
    {
        DesertWind = 0.5; // wind right
    }
	//otherwise nothing moves
    else
    {
        DesertWind = 0; // no wind
    }
	
	//just for debugging
	show_debug_message("Wind = " + string(DesertWind));
	
    //restart timer so it can happen again (about 10 seccond)
    alarm[1] = game_get_speed(gamespeed_fps) * 10;
}