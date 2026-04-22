//if playa dead game stop
if (playerDead) exit;



//Get inputs
getControls();



//vid 8 18 min


//the move plat collisions
#region
//get out of solid moveplats that have positioned themselves into player in the begin step
	var _topWall = noone;
	var _rightWall = noone;
	var _leftWall = noone;
	var _bottomWall = noone;
	var _list = ds_list_create();
	var _listSize = instance_place_list( x, y, oMovePlat, _list, false);

//loop trough all colliding moveplats
	for( var i = 0; i < _listSize; i++)
	{
		var _listInst = _list[| i];
	
		//find closest walls in each direction
		
		//=right walls
		if _listInst.bbox_left - _listInst.xspd >= bbox_right-1
		{
			if !instance_exists(_rightWall) || _listInst.bbox_left < _rightWall.bbox_left
			{
				_rightWall = _listInst;
			}
		}
		//left walls
		if _listInst.bbox_right - _listInst.xspd <= bbox_left+1
		{
			if !instance_exists(_leftWall) || _listInst.bbox_right > _leftWall.bbox_right
			{
				_leftWall = _listInst;
			}
		}
		//Bottom wall
		if _listInst.bbox_top - _listInst.yspd >= bbox_bottom-1
		{
			if !instance_exists(_bottomWall) || _listInst.bbox_top < _bottomWall.bbox_top
			{
				_bottomWall = _listInst;
			}
		}
		//Top
		if _listInst.bbox_bottom - _listInst.yspd <= bbox_top+1
		{
			if !instance_exists(_topWall) || _listInst.bbox_bottom > _topWall.bbox_bottom
			{
				_topWall = _listInst;
			}
		}
	}

	//destroy ds list to free memory
	ds_list_destroy(_list);
	
	
	
	
	
	//get out of the walls
		//rigt wall
		if instance_exists(_rightWall)
		{
			var _rightDist = bbox_right - x;
			x = _rightWall.bbox_left - _rightDist;
		}
		//left wall
		if instance_exists(_leftWall)
		{
			var _leftDist = x - bbox_left;
			x = _leftWall.bbox_right + _leftDist;
		}
		//bottom wall
		if instance_exists(_bottomWall)
		{
			var _bottomDist = bbox_bottom - y;
			y = _bottomWall.bbox_top - _bottomDist;
		}
		//Topwall ( includes collision for polish and crouching features)
		if instance_exists(_topWall)
		{
			var _upDist = y - bbox_top;
			var _targetY = _topWall.bbox_bottom + _upDist;
			//check if there isnt a wall in the way
			if !place_meeting( x, _targetY, oWall)
			{
				y = _targetY;
			}
		}
		
	#endregion	
		
		
		
		
	
//dont get left behind by my move plat
earlyMovePlatXspd = false;
if instance_exists(myFloorPlat) && myFloorPlat.xspd != 0 && !place_meeting( x, y + moveplatMaxYspd+1, myFloorPlat)
{
	//go ahead and move ourselves back onto that platform if there is no wall in the way
	if !place_meeting( x + myFloorPlat.xspd, y, oWall)
	{
		x += myFloorPlat.xspd;
		earlyMovePlatXspd = true;
	}
}



		
//crouching
		//transition to crouch
		//manual =downkey | automatic = wall collision
		if onGround && (downKey || place_meeting( x, y, oWall))
		{
			crouching = true;
		}
		//change colission mask
		if crouching { mask_index = crouchSpr; };
//transition out of crouching
	//manual = !downkey | Automatic = !on
	if crouching && (!downKey || !onGround)
	{
		//check if i can uncrouch
		mask_index = maskSpr;
		//uncrouch if no solid wallis in the way
		if !place_meeting( x, y, oWall)
		{
			crouching = false;
		}
		//go back to crouhcing mask index if we cant uncrouch
		else
		{
			mask_index = crouchSpr;
		}
	}







//x movement
//Direction
moveDir = rightKey - leftKey
//get my face
if moveDir != 0 {face = moveDir; };

//Get xspd
runType = runKey;
// Get xspd
xspd = moveDir * moveSpd[runType];
//slow xspd if crouching
if crouching { xspd = moveDir * crouchMoveSpd; };






//X collision
var _subPixel = .5;
if place_meeting( x + xspd, y, oWall )
{
	//first check if there is a slope to go up
	if !place_meeting( x + xspd, y -abs(xspd)-1, oWall)
	{
		
		while place_meeting( x + xspd, y, oWall) { y -= _subPixel; };
		
	}
	// Next check for ceiling slopes, otherwise, check for regular collision
	else
	{
		//ceilling slopes
		if !place_meeting( x+ xspd, y + abs(xspd*2) + 1, oWall)
		{
			while place_meeting( x + xspd, y, oWall) {y += _subPixel}
		}
		//normal collision
		else
		{
			//scoot up to wall precisely
			var _pixelCheck = _subPixel * sign(xspd);
			while !place_meeting( x + _pixelCheck, y, oWall){ x += _pixelCheck; };
	
			//set xspd to zero to collide
			xspd = 0;
		}
	}
}




	//go down slopes 
	downSlopeSemiSolid = noone;
	if yspd >= 0 && !place_meeting( x + xspd, y + 1, oWall) && place_meeting( x + xspd, y + abs(xspd) + 1, oWall)
	{
		//check for a semisolid in the way
		downSlopeSemiSolid = checkForSemisolidPlatform( x + xspd, y + abs(xspd)+1  );
		//precisly mode down slope if there isnt a semisolid in the way
		if !instance_exists(downSlopeSemiSolid)
		{
		while !place_meeting( x + xspd, y + _subPixel, oWall) { y += _subPixel; };
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
		jumpHoldTimer = 0;
	} else {
		// if the player is in the air, make sure they cant do an extra jump
		coyoteJumpTimer--;
		if jumpCount == 0 && coyoteJumpTimer <= 0 { jumpCount = 1; };
	}


	// iniate jump
	var _floorIsSolid = false;
	if instance_exists(myFloorPlat)
	&& ( myFloorPlat.object_index == oWall || object_is_ancestor(myFloorPlat.object_index, oWall) )
	{
		_floorIsSolid = true;
	}
	
	if jumpKeyBufferd && jumpCount < jumpMax && (!downKey || _floorIsSolid)
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

	
	

	
	
	//ga video 2 kijken om te bug checken bij dit stuk specifiek :)
	
	//jump based on the timer/ holding the button
	if jumpHoldTimer > 0
	{
		
		//consatntly set yspd to be jspd
		yspd = jspd[jumpCount-1];
		
		//count down the jump timer
		jumpHoldTimer--;
	}

	
	//Cut off the jump by releasing the jump button
	if !jumpkey
	{
	jumpHoldTimer = 0;
	}
	
	
	
	
	
	
	//Y collision and movement
		//cap our falling speed
		if yspd > termVel { yspd = termVel; };
		//Y collision
		var _subPixel = .5;
	
		
		// upwards Y colission (with ceilling slopes)
		if yspd < 0 && place_meeting( x, y + yspd, oWall)
		{
			//jump into sloped ceillings
			var _slopeSlide = false;
			
			//Slide upleft slope
			if moveDir == 0 && !place_meeting( x - abs(yspd) - 1, y + yspd, oWall)
			{
				while place_meeting( x, y + yspd, oWall) { x -= 1; };
				_slopeSlide = true;
			}
			
			//slide upright slope
			if moveDir == 0 && !place_meeting( x + abs(yspd) + 1, y + yspd, oWall)
			{
				while place_meeting( x, y + yspd, oWall) { x += 1; };
				_slopeSlide = true;
			}
			
			// normal y colission
			if !_slopeSlide
			{
				//scoot up to the wall precisely
				var _pixelCheck = _subPixel * sign(yspd);
				while !place_meeting( x, y + _pixelCheck, oWall)
				{
						y += _pixelCheck;
				}
			
				//bonkcode (optional)
				if yspd < 0 { jumpHoldTimer = 0; };
			
				//Set yspd to 0 to collide
				yspd = 0;
			}
		}
		
		
		
		
		
		
		//(to test if everyhting the same: vid 7: 54.40}
		//Floor y colision
		
		//check for solid and semisolid platforms under me
		var _clampYspd = max( 0, yspd);
		var _list = ds_list_create(); //create a ds list to store all the objects we run into
		var _array = array_create(0);
		array_push( _array, oWall, oSemiSolidWall );
		
		// do the actual check and objects to list
		var _listSize = instance_place_list( x, y+1 + _clampYspd + moveplatMaxYspd, _array, _list, false );
		
			/////////(FIX FOR HIGH RESOLUTION/HIGH SPEED PROJECTILES - same prncipal as how i fixed the downwards slope issue) Check for a semisolid palt below me
			var _yCheck = y+1 + _clampYspd;
			if instance_exists(myFloorPlat) { _yCheck += max(0, myFloorPlat.yspd) ; };
			var _semiSolid = checkForSemisolidPlatform(x, _yCheck );
			
			
			
		//loop through the colliding instances and only reutrn if its top is bellow the player
		for( var i = 0; i < _listSize; i++)
		{
			//get instance of o wall or osemisolid wall form the list
			var _listInst = _list[| i];
			
			//avoid magnetizm
			if _listInst != forgetSemiSolid
			&& ( _listInst.yspd <= yspd || instance_exists(myFloorPlat) )
			&& ( _listInst.yspd > 0 || place_meeting( x, y+1 + _clampYspd, _listInst ) )
			|| (_listInst == _semiSolid)////////(HIGH SPEED FIX)
			{
				//return a solid wall or any semisolid walls that are below the player
				if _listInst.object_index == oWall
				|| object_is_ancestor(_listInst.object_index, oWall )
				|| floor(bbox_bottom) <= ceil( _listInst.bbox_top - _listInst.yspd )
				{
					//return the 'highest' wall object
					if !instance_exists(myFloorPlat)
					|| _listInst.bbox_top + _listInst.yspd <= myFloorPlat.bbox_top + myFloorPlat.yspd
					|| _listInst.bbox_top + _listInst.yspd <= bbox_bottom
					{
						myFloorPlat = _listInst
					}
				}
			}
		}
		//destory the dslist to avoid memory leak
		ds_list_destroy(_list);
		
		//Downslope semisolid for making sure we dont miss semisoluds while going down slopes
		if instance_exists(downSlopeSemiSolid) { myFloorPlat = downSlopeSemiSolid; };
		
		// one last check to make sure the floor platform is actually below us
		if instance_exists(myFloorPlat) && !place_meeting( x, y + moveplatMaxYspd, myFloorPlat)
		{
			myFloorPlat = noone;
		}
		
		
		
		
		
		// land on the ground platform if there is one.
		if instance_exists(myFloorPlat)
		{
			//scoot up to our wall pricesly
			var _subPixel = 0.5;
			while !place_meeting( x, y + _subPixel, myFloorPlat) && !place_meeting( x, y, oWall) { y += _subPixel }
			//make sure we dont end up below the top of our semisolid
			if myFloorPlat.object_index == oSemiSolidWall || object_is_ancestor(myFloorPlat.object_index, oSemiSolidWall)
			{
				while place_meeting( x, y, myFloorPlat ) { y -= _subPixel; };
			}
			//floor the y variable
			y = floor(y);
			
			//collide with the ground
			yspd = 0;
			setOnGround(true);
		}
		
		
		
		
		
		
		//manually fall through a semisolid platform
		if downKey && jumpKeyPressed
		{
			//make sure we have a floor platform that is a semisolid
			if instance_exists(myFloorPlat)
			&& ( myFloorPlat.object_index == oSemiSolidWall || object_is_ancestor(myFloorPlat.object_index, oSemiSolidWall) )
			{
				//check if we can go below the semisolid
				var _yCheck = max( 1, myFloorPlat.yspd + 1);
				if !place_meeting( x, y + _yCheck, oWall )
				{
					//move below the platform
					y += 1;
					
					//inherit any downward speed from my floorplatform so it doesnt catch me
					yspd = _yCheck-1;
					
					//forget this platform for a brief time so we dont get caught again
					forgetSemiSolid = myFloorPlat;
					
					//no more floor platform
					setOnGround(false);
				}
			}
		}
		//move
		if !place_meeting( x, y + yspd , oWall) { y += yspd; };
		
		
		
		
		//reset forgetsemisolid variable
		if instance_exists(forgetSemiSolid) && !place_meeting(x, y,forgetSemiSolid)
		{
			forgetSemiSolid = noone;
		}
		
		
//final moving paltofrm colissions and movement
	//X - movemplat xspd and colision
	//get the moveplat xspd
	moveplatXspd = 0;
	if instance_exists(myFloorPlat) { moveplatXspd = myFloorPlat.xspd; }; 
	
	//move with moveplatxspd
	if !earlyMovePlatXspd
	{
		if place_meeting( x + moveplatXspd, y, oWall )
		{
			//scoot up to the wall pricesly
			var _subPixel = 0.5;
			var _pixelCheck = _subPixel * sign(moveplatXspd);
			while !place_meeting( x + _pixelCheck, y, oWall)
			{
				x += _pixelCheck;
			}
			//set movepaltxspd to finish collision
			moveplatXspd = 0;
		}
		//move
		x += moveplatXspd;
	}
	
	
	
	
	
	
	
	
	
	// Y - snap myself to myFloorPlat if its moving vertically
	if instance_exists(myFloorPlat) 
	&& (myFloorPlat.yspd != 0
	|| myFloorPlat.object_index == oMovePlat
	|| object_is_ancestor( myFloorPlat.object_index, oMovePlat)
	|| myFloorPlat.object_index == oSemiSolidMovePlat
	|| object_is_ancestor( myFloorPlat.object_index, oSemiSolidMovePlat) )
	{
		//snap to the top of the floor paltofrm ( un-floor our y variable so its not choppy)
		if !place_meeting( x, myFloorPlat.bbox_top, oWall )
		&& myFloorPlat.bbox_top >= bbox_bottom-moveplatMaxYspd
		{
			y = myFloorPlat.bbox_top;
		}
		
			//made redundant by code below
								/*/going up into a solid wall while on a semi-solid platform
								if myFloorPlat.yspd < 0 && place_meeting( x, y + myFloorPlat.yspd, oWall)
								{
									//get pushed down trought he semi-solid floor paltofrm
									if myFloorPlat.object_index == oSemiSolidMovePlat || object_is_ancestor( myFloorPlat.object_index, oSemiSolidWall)
									{
										//get pushed down trough the semi-solid
										var _subPixel = 0.25;
										while place_meeting( x, y + myFloorPlat.yspd, oWall) { y += _subPixel; };
										//if we get pushed into a semi-solid wall while going downward, push ourselves back out
										while place_meeting( x, y, oWall) { y -= _subPixel; };
										y = round(y);
									}
			
									//cancel the myfloorplat variable
									setOnGround(false);
								}
								/*/
		}
				
	
	
	
	
	
	
	
	//get pushed down trough a semisolid by a moving solid platform
	if instance_exists(myFloorPlat)
	&& (myFloorPlat.object_index == oSemiSolidWall || object_is_ancestor(myFloorPlat.object_index, oSemiSolidWall) )
	&& place_meeting( x, y,oWall)
	{
		//if im already stuck in a wall at this point, try and move me down to get below a semisolid
		//if im still stuck afterwards, that means im properl crushed
		
		//also, dont check too far we, we dont want to warp below walls
		var _maxPushDist = 10; //basically the fastest a move palt should be able to move downwards
		var _pushedDist = 0;
		var _startY = y;
		while place_meeting( x, y, oWall) && _pushedDist <= _maxPushDist
		{
			y++;
			_pushedDist++;
		}
		//forget my floorplat
		setOnGround(false);
		
		//if im still in a wall at this point, i have been crushed regardless, take me back to my start y to avoid the fuck
		if _pushedDist > _maxPushDist {y = _startY; };
	}
	
	
	
	
	
	
//crushed death code
if place_meeting( x, y, oWall)
{
	crushDeathTimer++;

} else {
	crushDeathTimer = 0;
}






//send the player back to the savespot
if  (!playerDead && (crushDeathTimer > crushDeathTime || place_meeting( x, y, oDeathpit)))
{
	//player is dead
	playerDead = true;
	
	// do the sprite shenenagians with setting it to frame 0  and making it silde 1 sprite per second
	sprite_index = sPlayerDeath;
	image_index = 0;
	image_speed = 1;
	
	//trigger the alarm to go off
	alarm[0] = room_speed;
} 


	
	
	
	
	
	
	
	

	
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



