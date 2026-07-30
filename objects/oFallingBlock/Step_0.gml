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

if WiggleTimer == -1000
{
	x = StartX;
	y = StartY;
	WiggleTimer = 60;
	Wiggle = false;
}

