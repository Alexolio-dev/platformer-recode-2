//make sure we at default look fly
image_index = 0;
// doesnt matter cutscene for another time
 if cutsceneStarted == true
 {
	image_index = 1;
 }
 
 
 
 
 
 
 
 
 
 
 
 //if fight started

if bossFightStarted == true
{
	// set up some variables
	var target = Oplayer;
	var targetX = Oplayer.x;
	var targetY = Oplayer.y;
	var doer = Oboss;
	var spdY = 5;
	var spdX = 5;
	
	
	//if there are not 3 attacks and the timer is not going up, add an attack
	if timer <= 0
	{
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
}

//if we have  move than 1 attack, start attacking
if maxAttacks >= 1
{
	bossState = state.attack;
}








	//if we do not attack make the state default
	if bossState == state.main
	{
		//if we dont mee the wall we chill one way
		if (place_meeting(x + theWay, y, oWall))
		{
			//if we bump a wall we move 
			if theWay == -1
			{
				theWay = 1;
			}
			else if theWay == 1
			{
			theWay = -1;
			}
		}
		//do the x of the burger plus this speed, might change later
		x += theWay;
		chosen = false;
		} 
		
		
		
		
		
		
		//else if we are in an attacking phase
		else if bossState == state.attack
		{

	//if we have more than 1 attacks
	if maxAttacks >= 1
	{
		timer++;
		if timer >= 30
		{
	//var randomAttack = random(5);
		//if randomAttack == 1
		if chosen == false
		{
			chosen = true;
			locationX = Oplayer.x;
			locationY = Oplayer.y - 32;
		}
			//do the burger dash
		//varible for distance
		var gotopointX = locationX - x;
		var gotopointY = locationY - y;
		
		
		//if we arent meeting the players target cords we change ( wanne change this to a single line of cord at one moment that saves, but will do that layer)
		if (abs(gotopointX) > spdX)
		{
			x += sign(gotopointX) * spdX

		}
		else
		{
		x = locationX;
		} 
	

if (abs(gotopointY) > spdY)
		{
			y += sign(gotopointY) * spdY

		}
		else
		{
		y = locationY;
			
		} 
	}


if y == locationY && x == locationX
{
	//chosen = false;
	bossState = state.returning
}
//




			
		
		
        //Face the direction we're moving.
        if x != 0
        {
            face = sign(x);
        }
	    }
	    else
	    {
	        x = 0;
	    }

		
	

	
	
	
	
	
		/*/var distX = targetX - x;
			var distY = targetY - y;
			if point_distance( x, y, targetX - 32, targetY - 32) <= 5
			{
				move_towards_point(targetX,targetY ,4);
				maxAttacks -= 1;
				timer++;
				//bossState = state.returning;
			}/*/

				//distY -= spdY;
				//distX -= spdX;
	}
}
		





//if we have 5 attacks, ignore al previous instructions and do a special attack.
if attacks == 5
{
	//do punishable burger stomp
	//move_towards_point()
	
	attacks = 0;
}





if bossState == state.returning
{
	timer = 60;
	timer--;
	//go to original place
	
	move_towards_point(homeX,homeY,4)
	{
		if point_distance( x, y, homeX,homeY ) >= 5
		{
			bossState = state.main
		}
	}	
}


