if room == LavaTip
{
	if rising == true
	{
		y -= 1;	
	if y <= maxLava
		{
		 rising = false;
		}
	}
}


//interesting idea, could work on it some more
if room == Secret_Level
{
	if rising == true
	{
		timer--;
	
		if timer >= 0
		{
				y += 1;	
			} 
			else if timer <= 0
			{
				y -= 0.5;
				otherTimer--;
		}
	
		if otherTimer == 0
		{
			timer = 240;
			otherTimer =480;
		}
	}
}