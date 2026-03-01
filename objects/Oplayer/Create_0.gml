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

//controls setup
ControlsSetup();

//moving
moveDir = 0;
runType = 0;
moveSpd[0] = 2;
moveSpd[1] = 4;
xspd  =0;
yspd = 0;
face = 1;

//jumping
grav = 0.275;
termVel = 4;
onGround = true;
jumpMax = 1;
jumpCount = 0;
jumpHoldTimer = 0;

//jump calues for each succesive jump
jumpHoldFrames[0] = 18;
jumpHoldFrames[1] = 10;
jspd[0] = -3.15;
jspd[1] = -2.85;
	
	
//coyote time
//hang time
coyoteHangFrames = 2;
coyoteHangTimer = 0;
// Jump Buffer time
coyoteJumpFrames = 4;
coyoteJumpTimer = 0;

//sprites
maskSpr = sPlayerIdle;
idleSpr = sPlayerIdle;
runSpr = sPlayerRun;
walkSpr = sPlayer;
jumpSpr = sPlayerJump;

//moving platforms
myFloorPlat = noone;
moveplatXspd = 0;
moveplatMaxYspd = termVel; //How fast can the player follow a downwards moving platform