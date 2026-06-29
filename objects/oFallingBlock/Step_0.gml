if place_meeting(x, y-1, Oplayer)
{
	Wiggle = true;
}
	if (Wiggle)
	{
		WiggleTimer--;
		x += random_range(1,-1);
	
	if (WiggleTimer <= 0)
	{
		y += approach( 0, 10, 5)
	}
}
