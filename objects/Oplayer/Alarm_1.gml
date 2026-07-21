//if room is desert
if (room == Desert)
{
	//change the windsate for particles
	windState = "changing";
	
    //make a random number out of 360
	global.r = random(360)
	//if it is smaller tan 120 make wind blow this way
    if global.r < 120
    {
        targetWind = -0.5; // wind left
		particleDirection = 180;
    }
	//if its bigger than 240 make wind blow that way
    else if global.r > 240
    {
        targetWind = 0.5; // wind right
		particleDirection = 0;
    }
	//otherwise nothing moves
    else
    {
        targetWind = 0; // no wind
    }
	
	
	
	
	//just for debugging
	//show_debug_message("Wind = " + string(DesertWind));
	
    //restart timer so it can happen again (about 10 seccond)
    alarm[1] = game_get_speed(gamespeed_fps) * 11.5;
}