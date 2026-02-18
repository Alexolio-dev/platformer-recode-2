//Get inputs
rightKey = keyboard_check( vk_right );
leftKey = keyboard_check( vk_left );
jumpKeyPressed = keyboard_check_pressed( vk_space )

//x movement
//Direction
moveDir = rightKey - leftKey

// Get xspd
xspd = moveDir * moveSpd;

//X collision
var _subPixel = .5;
if place_meeting( x + xspd, y, oWall )
{
	//scoot up to wall precisely
	var _pixelCheck = _subPixel * sign(xspd)
	while !place_meeting( x + _pixelCheck, y, oWall)
	{
		x += _pixelCheck;
	}
	
	//set xspd to zero to collide
	xspd = 0;
}

//move
x += xspd;


//y movement
	//gravity
	yspd += grav;
	
	//jump
	if jumpKeyPressed && place_meeting( x, y+1, oWall)
	{
		yspd = jspd
	}
	
	//Y collision
	var _subPixel = .5;
	if place_meeting( x, y +yspd, oWall)
	{
		//scoot up to the wall precisely
		var _pixelCheck = _subPixel * sign(yspd);
		while !place_meeting( x, y + _pixelCheck, oWall)
		{
				y += _pixelCheck;
		}
		//Set yspd to 0 to collide
		yspd = 0;
	}
	
	//move
	y += yspd
	
	
	//lol
	//YEAH
