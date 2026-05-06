//set up keyboard checks
var up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var down = keyboard_check(vk_down) || keyboard_check(ord("S"));
var left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var space = keyboard_check_pressed( vk_space)
//the path switch statement needs a case for each path
//each case needs to be the name of the path itself
switch (path) {

    //path_1 is a path I created that generally goes up and down
    //path_1's end point is the start point of path_2
    case PathWorldMap1:
  
  
  //enter level
	if (path_started ==false && path_position < 0.05 && (space)) 
	{ room_goto(Tutorial)}
	
 if (space) { show_debug_message("pressed")}
  
        if (path_position == 0) { //if you're at the starting position
            if (right) {  //and you push right
                path_start(path, spd, 0, true); //move along the path
                path_started = true;}} //note that you started moving along the path
          
		  //https://www.youtube.com/watch?v=yE-atp2z74I
		  // https://www.reddit.com/r/gamemaker/comments/2l8rfk/what_is_a_more_efficient_way_to_have_locked_rooms/
		  //   
			  
        if (path_position == 1) { //if you're at the end position
            if (left) { //if you push left
                path_start(path, -spd, 0, true); //go backwards along the path - note negative speed
                path_started = true;} //note that you started moving along the path
      
            if (up) { //if you push right
                path = PathWorldmap2; //switch to another path
                path_start(path, spd, 0, true); //start moving along that path
                path_started = true;}} //note that you started moving along the path
		
		
		
		
        break;
  
    //path_2 is a path I created that goes towards the right
    //path_2's start point is path_1's end point
    //path_2's end point is path_3's start point
    case PathWorldmap2:

        if (path_position == 0) {
            if (up) {
                path_start(path, spd, 0, true);
                path_started = true;}
          
            if (left) {
                path = PathWorldMap1;
                path_start(path, -spd, 0, true);
                path_started = true;}}
          
        if (path_position == 1) {
            if (left) {
                path_start(path, -spd, 0, true);
                path_started = true;}
          
            if (down) {
                path = PathWorldMap3;
                path_start(path, spd, 0, true);
                path_started = true;}}
 
        break;
  
    //path_3 is a path that generally goes up
    //path_3's start point is path_2's end point
    case PathWorldMap3:

        if (path_position == 0) {
            if (down) {
                path_start(path, spd, 0, true);
                path_started = true;}
          
            if (left) {
                path = PathWorldmap2;
                path_start(path, -spd, 0, true);
                path_started = true;}}
          
        if (path_position == 1) {
            if (down) {
                path_start(path, -spd, 0, true);
                path_started = true;}
			
			 if (up) {
                path = PathWorldMap4;
                path_start(path, spd, 0, true);
                path_started = true;}}
				
        break;

    //dit is pad 4 van de agme
    case PathWorldMap4:

        if (path_position == 0) {
            if (up) {
                path_start(path, spd, 0, true);
                path_started = true;}
          
            if (down) {
                path = PathWorldMap3;
                path_start(path, -spd, 0, true);
                path_started = true;}}
          
        if (path_position == 1) {
            if (down) {
                path_start(path, -spd, 0, true);
                path_started = true;}
          
            if (up) {
                path = PathWorldMap5;
                path_start(path, spd, 0, true);
                path_started = true;}}
 
        break; 
		
	//path 5
	case PathWorldMap5:

		 if (path_position == 0) {
			 if (up) {
                path_start(path, spd, 0, true);
                path_started = true;}
          
            if (down) {
			     path = PathWorldMap4;
                path_start(path, -spd, 0, true);
                path_started = true;}}
          
		  if (path_position == 1) {
            if (down) {
                path_start(path, -spd, 0, true);
                path_started = true;}}
 
        break; }


if (path_started == true) { //if you're moving
    if (path_speed > 0) { //and you're moving towards the end of the path
        if (path_position > .98) { //once you're almost there
            path_end(); //end the path before you get there
            var n = path_get_number(path) - 1; //get the number of the last point in the path
            x = path_get_point_x(path, n); //set your x and y to that point's x and y
            y = path_get_point_y(path, n);
            path_position = 1; //manually set the path_position to 1, so it works in the switch statement
            path_started = false;}} //note that you are no longer following the path
    else {  //your moving towards the start of the path
        if (path_position < .02) { //once you're almost there
            path_end(); //end the path
            x = path_get_point_x(path, 0); //manually set your x and y
            y = path_get_point_y(path, 0);
            path_position = 0; //manually set the path position
            path_started = false;}}} //note that you are no longer following the path
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
//if player dead this don matter
//sprite control
//standing still
if path_started == false { sprite_index = sPlayerIdle; };
//walking
if path_started == true { sprite_index = sPlayer; };


