//set up keyboard checks
var up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var down = keyboard_check(vk_down) || keyboard_check(ord("S"));
var left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var right = keyboard_check(vk_right) || keyboard_check(ord("D"));

//the path switch statement needs a case for each path
//each case needs to be the name of the path itself
switch (path) {

    //path_1 is a path I created that generally goes up and down
    //path_1's end point is the start point of path_2
    case path_1:
  
        if (path_position == 0) { //if you're at the starting position
            if (up) {  //and you push up
                path_start(path, spd, 0, true); //move along the path
                path_started = true;}} //note that you started moving along the path
          
        if (path_position == 1) { //if you're at the end position
            if (down) { //if you push down
                path_start(path, -spd, 0, true); //go backwards along the path - note negative speed
                path_started = true;} //note that you started moving along the path
      
            if (right) { //if you push right
                path = path_2; //switch to another path
                path_start(path, spd, 0, true); //start moving along that path
                path_started = true;}} //note that you started moving along the path
  
        break;
  
    //path_2 is a path I created that goes towards the right
    //path_2's start point is path_1's end point
    //path_2's end point is path_3's start point
    case path_2:

        if (path_position == 0) {
            if (right) {
                path_start(path, spd, 0, true);
                path_started = true;}
          
            if (down) {
                path = path_1;
                path_start(path, -spd, 0, true);
                path_started = true;}}
          
        if (path_position == 1) {
            if (left) {
                path_start(path, -spd, 0, true);
                path_started = true;}
          
            if (up) {
                path = path_3;
                path_start(path, spd, 0, true);
                path_started = true;}}
 
        break;
  
    //path_3 is a path that generally goes up
    //path_3's start point is path_2's end point
    case path_3:

        if (path_position == 0) {
            if (up) {
                path_start(path, spd, 0, true);
                path_started = true;}
          
            if (left) {
                path = path_2;
                path_start(path, -spd, 0, true);
                path_started = true;}}
          
        if (path_position == 1) {
            if (down) {
                path_start(path, -spd, 0, true);
                path_started = true;}}
 
        break;}



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
if !playerDead
{
//sprite control
//walking
if abs(xspd) > 0 { sprite_index = walkSpr; };
//running
if abs(xspd) >= moveSpd[1] { sprite_index = runSpr; };
//standing still
if xspd == 0 { sprite_index = idleSpr; };
//in the air
if !onGround { sprite_index = jumpSpr; };
//crouching
if crouching { sprite_index = crouchSpr; };
}
	//set the collsion mask
	mask_index = maskSpr;
	if crouching { mask_index = crouchSpr; };



