image_index = 0;

 if cutsceneStarted == true
 {
	image_index = 1;
 }

if bossFightStarted == true
{
	var target = Oplayer;
	var doer = Oboss;
	var spdY = 3;
	var spdX = 4;
	
	maxAttacks = 0;
	
	
	if (place_meeting(x + theWay, y, oWall))
	{
		if theWay == -1
		{
			theWay = 1;
		}
		else if theWay == 1
		{
			theWay = -1;
		}
	}

	x += theWay;
	
	
	
	
if maxAttacks != 3
{
	AttackGoUpTimer++;
	
	if AttackGoUpTimer == 120
	{
		maxAttacks += 1;
		if maxAttacks != 3
		{
			AttackGoUpTimer = 0;
		}
	}
}



if maxAttacks >= 1
{
//var randomAttack = random(5);
	//if randomAttack == 1
	//{
		//do the burger dash
		x = 0;
		if x == 0
		{
			target.x -= spdX;
			target.y -= spdX;
		}
		
		
		
		maxAttacks +=1;
	}



}

if attacks == 5
{
	//do punishable burger stomp
	
	
	attacks = 0;
}

