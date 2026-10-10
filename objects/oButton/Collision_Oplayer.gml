if place_meeting(x,y,Oplayer)
{
	blocksThatWillAppear = blocksForTriggers;
}


if blocksThatWillAppear == 1 && !blocksSpawned
{
	instance_create_layer(4624, 1840, "Instances" , oWall);
	instance_create_layer(4624, 1856, "Instances" , oWall);
	instance_create_layer(4624, 1872, "Instances" , oWall);
	instance_create_layer(4624, 1888, "Instances" , oWall);
	instance_create_layer(4624, 1904, "Instances" , oWall);
	instance_create_layer(4624, 1920, "Instances" , oWall);
	instance_create_layer(4624, 1936, "Instances" , oWall);
	instance_create_layer(4624, 1952, "Instances" , oWall);
	instance_create_layer(4624, 1968, "Instances" , oWall);
	instance_create_layer(4624, 1984, "Instances" , oWall);
	instance_create_layer(4624, 2000, "Instances" , oWall);
	instance_create_layer(4624, 2016, "Instances" , oWall);
	instance_create_layer(4624, 2032, "Instances" , oWall);
	instance_create_layer(4624, 2048, "Instances" , oWall);
	image_index = 1;
	blocksSpawned = true;
} 
	
	
if blocksThatWillAppear == 2 && !blocksSpawned
{
	instance_create_layer(5472, 1152, "Instances" , oIceBlock);
	instance_create_layer(5392, 1216, "Instances" , oWall);
	instance_create_layer(5408, 1216, "Instances" , oWall);
	instance_create_layer(5424, 1216, "Instances" , oWall);
	instance_create_layer(5456, 1072, "Instances" , oFallingBlock);
	image_index = 1;
	blocksSpawned = true;
} 


	
	
if blocksThatWillAppear == 3 && !blocksSpawned
{
	alarm[0] = game_get_speed(gamespeed_fps) * 0.60;
	blocksSpawned = true;
}

if blocksThatWillAppear == 4 && !blocksSpawned
{
	instance_create_layer(1184, 2304, "Instances" , oFallingBlock);
	instance_create_layer(1040, 2246, "Instances" , oFallingBlock);
	instance_create_layer(976, 2158, "Instances" , oIceBlock);
	//instance_create_layer(1140, 2736, "Instances" , oFallingBlock);
	instance_create_layer(880, 2096, "Instances" , oFallingBlock);
	instance_create_layer(816, 2096, "Instances" , oFallingBlock);

	image_index = 1;
	blocksSpawned = true;
}


//
if blocksThatWillAppear == 5 && !blocksSpawned
{
	Oboss.bossFightStarted = true;
	instance_destroy();
}

/*/if Oboss.HP == 0
{
	Bossfight = false;
	//Oboss.bossFightStarted = false;
}
