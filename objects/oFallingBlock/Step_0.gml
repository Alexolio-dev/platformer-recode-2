if (!Wiggle && place_meeting(x, y-1, Oplayer))
{
	Wiggle = true;
}
	if (Wiggle)
	{
		WiggleTimer--;
		if WiggleTimer >= 0 { x += random_range(1,-1); }
		
	if (WiggleTimer <= 0)
	{
		y += approach( 0, 10, 5)
	}
}

if WiggleTimer < -300 && WiggleTimer > -600
{
	part_particles_create(global.particleSystem, StartX + sprite_width/2, StartY + sprite_height/2,global.particlePlatform, 1 );
}



if WiggleTimer == -600
{
	x = StartX;
	y = StartY;
	WiggleTimer = 60;
	Wiggle = false;
}


