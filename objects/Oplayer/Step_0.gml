//Get inputs
getControls();




//x movement
//Direction
moveDir = rightKey - leftKey
//get my face
if moveDir != 0 {face = moveDir; };

//Get xspd
runType = runKey;
// Get xspd
xspd = moveDir * moveSpd[runType];






//X collision
var _subPixel = .5;
if place_meeting( x + xspd, y, oWall )
{
	//first check if there is a slope to go up
	if !place_meeting( x + xspd, y -abs(xspd)-1, oWall)
	{
		
		while place_meeting( x + xspd, y, oWall) { y -= _subPixel; };
		
	}
	// if there is no slope regular collision
	else
	{
		//scoot up to wall precisely
		var _pixelCheck = _subPixel * sign(xspd);
		while !place_meeting( x + _pixelCheck, y, oWall)
		{
			x += _pixelCheck;
		}
	
		//set xspd to zero to collide
		xspd = 0;
	}
}

//move
x += xspd;








//y movement
	//gravity
	if coyoteHangTimer > 0
	{
		//count timer down
		coyoteHangTimer--;
	}else{
		//apply gravity to player
		yspd += grav;
		//we are not on ground anymore
		setOnGround(false)
	}
	

	
	
	
	
	
	
	//reset / prepare jumping variable
	if onGround
	{
		jumpCount = 0;
		coyoteJumpTimer = coyoteJumpFrames;
	} else {
		// if the player is in the air, make sure they cant do an extra jump
		coyoteJumpTimer--;
		if jumpCount == 0 && coyoteJumpTimer <= 0 { jumpCount = 1; };
	}


	// iniate jump
	if jumpKeyBufferd && jumpCount < jumpMax
	{
		//reset the buffer
		jumpKeyBufferd = false;
		jumpKeyBufferTimer = 0;
		//increase the number of prefomred jumps
		jumpCount++;
		// set the jump hold timer
		jumpHoldTimer = jumpHoldFrames[jumpCount-1];
		//tell ourselvs whe are no longer on the ground
		setOnGround(false)
	}
	//Cut off the jump by releasing the jump button
	if !jumpkey
	{
	jumpHoldTimer = 0;
	}
	
	
	//jump based on the timer/ holding the button
	if jumpHoldTimer > 0
	{
		//consatntly set yspd to be jspd
		yspd = jspd[jumpCount-1];
		//count down the jump timer
		jumpHoldTimer--;
	}
	
	
	
	
	
	
	
	
	//Y collision and movement
		//cap our falling speed
		if yspd > termVel { yspd = termVel; };
		//colisiom
		var _subPixel = .5;
		if place_meeting( x, y +yspd, oWall)
		{
			//scoot up to the wall precisely
			var _pixelCheck = _subPixel * sign(yspd);
			while !place_meeting( x, y + _pixelCheck, oWall)
			{
					y += _pixelCheck;
			}
			
			//bonkcode (optional)
			if yspd < 0
			{
				jumpHoldTimer = 0;
			}
			
			//Set yspd to 0 to collide
			yspd = 0;
		}
		
		//set if im on the ground
		if yspd >= 0 && place_meeting( x, y+1, oWall)
		{
			setOnGround(true)
		} 
		
		//move
		y += yspd
	
	
//sprite control
//walking
if abs(xspd) > 0 { sprite_index = walkSpr; };
//running
if abs(xspd) >= moveSpd[1] { sprite_index = runSpr; };
//standing still
if xspd == 0 { sprite_index = idleSpr; };
//in the air
if !onGround { sprite_index = jumpSpr; };

	//set the collsion mask
	mask_index = maskSpr;



