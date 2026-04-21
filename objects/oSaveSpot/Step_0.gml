oif place_meeting( x, y, Oplayer)
{
	global.checkpoint = id;
	global.checkpointx = x;
	global.checkpointy = y;
	global.checkpointR = room;
	
}

if (global.checkpointR == room)
{
	if (global.checkpoint == id){ image_index = 1;} else {image_index = 0;}
}

