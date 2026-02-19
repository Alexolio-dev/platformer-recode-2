//controls setup
ControlsSetup();

//moving
moveDir = 0;
moveSpd = 2;
xspd  =0;
yspd = 0;

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
	