global.secret_thing[4] = true;
level_unlocked = 6;

if place_meeting(x,y, Oplayer)
{
	if global.secret_thing[1] == true && global.secret_thing[2] == true && global.secret_thing[3] == true && global.secret_thing[4] == true && global.secret_thing[5] == true && global.secret_thing[6] == true{
	level_unlocked = 6;
	} else {
		show_message("You are not ready to enter")
	}
}

