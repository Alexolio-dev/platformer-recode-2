//custom functions for player
function setOnGround(_val = true)
{
	if _val == true
	{
		onGround = true;
		coyoteHangTimer = coyoteHangFrames;
	}else{	
		onGround = false;
		myFloorPlat = noone;
		coyoteHangTimer = 0;
	}
}

function checkForSemisolidPlatform( _x, _y)
{
	//create a return variable
	var _rtrn = noone;
	
	//we must not be moving upwards and then we check for a normal collision
	if yspd >= 0 && place_meeting(_x, _y, oSemiSolidWall)
	{
		//create a ds list to store all colliding instances of oSemiSolidWall
		var _list = ds_list_create();
		var _listSize = instance_place_list(_x, _y, oSemiSolidWall, _list, false);
		
		//loop trough te colliding instances and only return one if its top is below the player
		for( var i = 0; i < _listSize; i++)
		{
			var _listInst = _list[| i];
			if _listInst != forgetSemiSolid && floor(bbox_bottom) <= ceil( _listInst.bbox_top - _listInst.yspd )
			{
				//return the idd of a semiSolid platform
				_rtrn = _listInst;
				//exit the loop early
				i = _listSize;
			}
		}
		//destroy the ds list to free memory
		ds_list_destroy(_list);
	}
	//return our virable
	return _rtrn;
}


depth = -30;
//controls setup
ControlsSetup();

//moving
moveDir = 0;
runType = 0;
moveSpd[0] = 2;
moveSpd[1] = 3;
xspd  =0;
yspd = 0;
face = 1;

//jumping
grav = 0.2;
termVel = 8;
onGround = true;
jumpMax = 1;
jumpCount = 0;
jumpHoldTimer = 0;

//state variables
crouching = false;
crouchMoveSpd = 0.75;

//jump calues for each succesive jump
jumpHoldFrames[0] = 18;
jumpHoldFrames[1] = 10;
jspd[0] = -3.5;
jspd[1] = -2.85;
	
	
//coyote time
//hang time
coyoteHangFrames = 6;
coyoteHangTimer = 0;
// Jump Buffer time
coyoteJumpFrames = 6;
coyoteJumpTimer = 0;

//sprites
maskSpr = sPlayerIdle;
idleSpr = sPlayerIdle;
runSpr = sPlayerRun;
walkSpr = sPlayer;
jumpSpr = sPlayerJump;
crouchSpr = sPlayerCrouch;

//moving platforms
myFloorPlat = noone;
earlyMovePlatXspd = false;
downSlopeSemiSolid= noone;
forgetSemiSolid = noone;
moveplatXspd = 0;
moveplatMaxYspd = termVel; //How fast can the player follow a downwards moving platform

//crush code timer
crushDeathTimer = 0;
crushDeathTime = 7;

//death
playerDead = false;

//jumping mvong
jumpMomentumX = 0;

//wind in the desert
DesertWind = 0;
//the code that makes it so desert wind gets triggeresd when you are in the desert
//if room desert
if (room == Desert)
{
	//trigger the alarm
    alarm[1] = game_get_speed(gamespeed_fps) * 2;
}




//checkpoint code
if (global.checkpointR == room)
{
	x = global.checkpointx;
	y = global.checkpointy;
}



//alarms to keep track off
//alarm 1 = death;
//alarm 2 = wind mechanic (desert);

//signs
//???

//platform refinment

//particle system


//deze voor wanneer de particle system werkt
//https://www.youtube.com/watch?v=8AcyZaNWjJk


//fake walls for secret areas
//https://www.youtube.com/watch?v=cI_EWfYJvd4 


//tilelayers (for the drawing phase)
//https://www.youtube.com/watch?v=kyFICZcm6Vo
//https://www.youtube.com/watch?v=EVXimiZPo28
