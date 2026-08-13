if blocksThatWillAppear == 1
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
} 
	
	
if blocksThatWillAppear == 2
{
	instance_create_layer(5472, 1152, "Instances" , oIceBlock);
	instance_create_layer(5392, 1216, "Instances" , oWall);
	instance_create_layer(5408, 1216, "Instances" , oWall);
	instance_create_layer(5424, 1216, "Instances" , oWall);
	instance_create_layer(5456, 1072, "Instances" , oFallingBlock);
	image_index = 1;
} 

if blocksThatWillAppear == 3
{
	oLava.rising = true;
} 


	