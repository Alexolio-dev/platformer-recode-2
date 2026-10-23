show_debug_message(global.secret_thing);


//pretty simple and standard. if player touches the diamond, you get the secret thing. (simple but works ig)
if room == The_Forest
{
	if place_meeting(x,y,Oplayer)
	{
		global.secret_thing[1] = true;
	}
}

if room == Desert
{
	if place_meeting(x,y,Oplayer)
	{
		global.secret_thing[2] = true;
	}
}

if room == Icy_middle
{
	if place_meeting(x,y,Oplayer)
	{
		global.secret_thing[3] = true;
	}
}

if room == TopIce
{
	if place_meeting(x,y,Oplayer)
	{
		global.secret_thing[4] = true;
	}
}

if room == LavaTip
{
	if place_meeting(x,y,Oplayer)
	{
		global.secret_thing[5] = true;
	}
}

//eventueel ook dit voor tutorial plek
if room == Tutorial
{
	if place_meeting(x,y,Oplayer)
	{
		global.secret_thing[0] = true;
	}
}