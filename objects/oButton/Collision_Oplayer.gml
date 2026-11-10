if place_meeting(x,y,Oplayer) && Oplayer.playerDead == false
{
	blocksThatWillAppear = blocksForTriggers;
}


if blocksThatWillAppear == 1 && !blocksSpawned
{
	instance_create_layer(4624, 2992, "Instances" , oWall);
	instance_create_layer(4624, 2976, "Instances" , oWall);
	instance_create_layer(4624, 2960, "Instances" , oWall);
	instance_create_layer(4624, 2944, "Instances" , oWall);
	instance_create_layer(4624, 2928, "Instances" , oWall);
	instance_create_layer(4624, 2912, "Instances" , oWall);
	instance_create_layer(4624, 2896, "Instances" , oWall);
	instance_create_layer(4624, 2880, "Instances" , oWall);
	instance_create_layer(4624, 2864, "Instances" , oWall);
	instance_create_layer(4624, 2848, "Instances" , oWall);
	instance_create_layer(4624, 2830, "Instances" , oWall);
	instance_create_layer(4624, 2814, "Instances" , oWall);
	instance_create_layer(4624, 2798, "Instances" , oWall);
	instance_create_layer(4624, 2782, "Instances" , oWall);
	image_index = 1;
	blocksSpawned = true;
} 
	
	
if blocksThatWillAppear == 2 && !blocksSpawned
{
	instance_create_layer(5472, 1152, "Instances" , oIceBlock);
	instance_create_layer(5392, 1216, "Instances" , oWall);
	instance_create_layer(5552, 2080, "Instances" , oWall);
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

if blocksThatWillAppear == 5 && !blocksSpawned
{
	Oboss.bossFightStarted = true;
	instance_destroy(inst_2B15D5A4);
	instance_destroy();
	image_index = 1;
}

if blocksThatWillAppear == 6 && !blocksSpawned
{
	instance_create_layer(1120, 2592, "Instances" , oWall);
	image_index = 1;
}

if blocksThatWillAppear == 7 && !blocksSpawned
{
	instance_create_layer(912, 2592, "Instances" , oWall);
	image_index = 1;
}

if blocksThatWillAppear == 8 && !blocksSpawned
{
	instance_create_layer(704, 2592, "Instances" , oWall);
	image_index = 1;
}














if bossDefeated == true
{
	bossDefeated = false;
	instance_create_layer(3056,1440, "Instances", oWall);
	instance_create_layer(3072,1440, "Instances", oWall);
	instance_create_layer(3088,1440, "Instances", oWall);
	instance_create_layer(3104,1440, "Instances", oWall);
	instance_create_layer(3120,1440, "Instances", oWall);
}

