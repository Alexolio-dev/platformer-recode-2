//path stuff
spd = 4; //this will be the speed along the path
path = PathWorldMap1; //path is the variable that we use to track the assigned path
x = path_get_point_x(path, 0); //set the object's x and y to the assigned path's x and y
y = path_get_point_y(path, 0);
path_started = false; //a variable we'll use later



//level unlcok systeem
if (!variable_global_exists("level_unlocked"))
{
	//maak array voor de 5 unlockable level (mis 6-7)
	global.level_unlocked = array_create(5, false);
	
	//eerste level unlocked
	global.level_unlocked[0] = true;
}




/*/
Het is een lang verteld verhaal dat er een boze hamburger deity leeft in een vulkaan.
dit wordt al jaren lang vertelt in de stam van .... .
maar ... heeft het nooit zelf geloven, dus nu gaat hij er zelf achteraan.

hij gaat dus dooor de levels van de vulkaan heen.
aan het einde wordt hij aangevallen en hij verslaat de god.
na het verslaan wordt hij gecursed om voor altijd een boze burger deity te worden.