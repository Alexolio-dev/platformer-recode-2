//make sure we at default look fly
image_index = 0;
// doesnt matter cutscene for another time
 if cutsceneStarted == true
 {
	image_index = 1;
 }
 
 //debu messages for extra info
show_debug_message(bossState);
show_debug_message(activateFighting);
show_debug_message(maxAttacks);
show_debug_message(chosen);
show_debug_message(randomNumber);
 
 
if HP == 0
	{
		bossState = state.dead;
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
if bossState == state.main
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






//if we have 5 attacks, ignore al previous instructions and do a special attack.
if attacks == 5
{
	//do punishable burger stomp
	//move_towards_point()
	
	attacks = 0;
	bossState = state.specialAttack;
}








//if we have  move than 1 attack, start attacking
if maxAttacks >= 1 && activateFighting == true
{
	activateFighting = false;
	bossState = state.specialAttack;
}




 

 
 
 //if there is a bossstate we shoudl switch between them
 
 switch (bossState)
 {
	case state.main:
	
		//boss patrols
		timer++;
		
		//wait a sec before the boss can attack again
		if timer >= 60
		{
			activateFighting = true;
		}
		
		
		
		//variable for how fast the boss goes in the main attack face
			x += theWay;
		
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
		
		//chosen = false;
		break;
		
		
		
		
		
		
		
		
		
	case state.attack:
	//if we have more than 1 attacks choose rng for the rest of the effect
	
	
	
	
	
	
	
	 
	if maxAttacks >= 1
	{
	 
	 if rngChosen == false
	 {
	 	randomNumber = random(5);
		
		rngChosen = true;
	}
		
		//set a little timer for when we can look at these variuables??
		timer++;
		if timer >= 30 
		{
	//var randomAttack = random(5);
		//if randomAttack == 1
		if chosen == false
		{
			timer = 0;
			chosen = true;
			locationX = Oplayer.x - 32;
			locationY = Oplayer.y - 32;
		}
		
		
		
		
		
		
		//
		
		// 
		//dash attack
		if randomNumber < 2.5
		{
			// give a little bit of time bofre the dash
			timer++;
			if timer >= 30
			{
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
			//if we are at the right x palce, set that to true
			rightXPlace = true;
			}


			//exactly the same as the last one but for y
			if (abs(gotopointY) > spdY)
			{
				y += sign(gotopointY) * spdY

			}
			else
			{
			y = locationY;	
			//if we are at the rgiht y palce, set that to true
			rightYPlace = true;
			//bossState = state.returning;
			}
		}
	}
	
	
	
	
	
	
	
	//
			//do multiple slams
			if randomNumber > 2.5
			{
				//set location like last example
				var gotopointX = locationX - x;
				var gotopointY = locationY - y;
				
				//do exactly the same
				if (abs(gotopointX) > spdX)
			{
				x += sign(gotopointX) * spdX

			}
			else
			{
				x = locationX;
				rightXPlace = true;
				downSlam = true;
			}
					
					
			if downSlam == true
			{
			if (abs(gotopointY) > spdY)
			{
				y += sign(gotopointY) * spdY

			}
			else
			{
			y = locationY;	
			rightYPlace = true;
			//downslam = false;
			//bossState = state.returning;
			}
		}
	}
			//
			
			
			
			
			//do multiple dashes
			//if randomNumber > 2.5
			//do i ahve to say it again?
			{
				var gotopointX = locationX - x;
				var gotopointY = locationY - y;
				
			
			//if the dash is active do the same as last time
			if dashActive == true
			{	
			if (abs(gotopointX) > spdX)
			{
				x += sign(gotopointX) * spdX

			}
			else
			{
				x = locationX;
				rightXPlace = true;
				dashActive = false;
				//do dash again
				attackAgain += 1;
			}
			}
					
			
			if (abs(gotopointY) > spdY)
			{
				y += sign(gotopointY) * spdY

			}
			else
			{
			y = locationY;	
			rightYPlace = true;
			dashActive = true;
			//bossState = state.returning;
			}
			
			
			
		
	}
			
		//	if attackAgain < 5
		//	{
		//		bossState == state.attack;
		//	}
			//
			
			//if we are at the right x and y place, reset all variables, go to the return state, and dock an attack
			if rightXPlace == true && rightYPlace == true
			{
				rightYPlace = false;
				rightXPlace = false;
				bossState = state.returning;
				chosen = false;
				timer = 0;
				maxAttacks -= 1;
				rngChosen = false;
				attacks += 1;
				downSlam = false;
				dashActive = false;
			}
			
		} 
	}
	 
		break;
		
		
		
		
		
		
	 
	 //if the burger want to return to its main phase
	case state.returning:
	timer++;
		if timer >= 60
		{
			//go to original place
			var GoBackToStartBossY = homeY - y;
			
			//return to the start spot. and if you are there go back to the main phase
			if (abs(GoBackToStartBossY) > 2)
			{
				y += sign(GoBackToStartBossY) * 2

			}
			else
			{
			y = homeY;
			//activateFighting = true;
			timer = 0;
			maxAttacks -= 1;
			bossState = state.main;
			} 
		}	
		
		break;
		
		
		
		
		
		
		
		
		
		
	  //if we are doing a special attack
	  case state.specialAttack:
	  {
		  
		  if specialPhase == phase.goToMiddle
		  {
		  //go to the middle of the arena slowly
		  var midX = 886;
		  var midY = 1457;
		  
		  
		  //go to middle of stage, make an energy ball//and some particles and then slam down creating a wave attack, after which youc an attack the boss
		  var dX = midX - x;
		  var dY = midY - y;
		  
		  if (abs(dX) > 1) 
		  {
		  x += sign(dX) * 1; 
		  }else{
		  x = midX;
		  }
		  
		  if (abs(dY) > 1) 
		  {
		  x += sign(dY) * 1; 
		  }else{
		  y = midY;
		  }
		  
		if x == midX && y == midY
		{
			specialPhase = phase.slam;
			specialTimer = 0;
		}
	}
		  
		  //give some time for the player to jump on the boss and make him able to be hurt by it
		  //damage, and return to the main state :)
		  
		 if specialPhase == phase.slam
		 {
			 specialTimer++;
			 if specialTimer >= 60
			 {
			 if !place_meeting(x,y + 7, oWall)
			 {
				 y += 7;
			 } else
			 {
				 y = 0;
				 specialTimer = 0;
				 specialPhase = phase.recover;
			 }
		}	  
	}
		  
		  
		  if specialTimer == phase.recover
		  {
			  
			  if place_meeting(x,y,Oplayer)
			  {
				  HP -= 1;
				  //sprite_index = oHurtBurger;
			  }
			  
			  
			specialTimer++;  
			  if specialTimer == 180
			  {
				  specialTimer = 0;
				  specialPhase = phase.goToMiddle;
				  bossState = state.returning;
			  }
		  }  
	  }
	  break;
	  
	  
	  
	  
	  case state.dead:
	  {
		 bossFightStarted = false;
		 // sprite_index = deadBurger;
	  }
	  
	  break;
	  
	}
 
}













/*/ PHASE 1: charge up briefly, then slam down
        case 1:
            specialTimer++;
            if (specialTimer > 60)   // wind-up time, tweak this
            {
                if (!place_meeting(x, y + 7, oWall))
                {
                    y += 7;
                }
                else
                {
                    // hit the floor: spawn your shockwave here
                    specialPhase = 2;
                    specialTimer = 0;
                }
            }
        break;

        // PHASE 2: stay stunned so the player can hit the boss
        case 2:
            specialTimer++;
            if (specialTimer > 180)
            {
                specialPhase = 0;
                specialTimer = 0;
                bossState = state.returning;
            }
        break;
    }
}
break;


















 //









if bossState == state.returning
{
	
	timer++;
	if timer >= 60
	{
	//go to original place
	var GoBackToStartBossY = homeY - y;
	
	if (abs(GoBackToStartBossY) > spdX)
		{
			y += sign(GoBackToStartBossY) * spdX

		}
		else
		{
		y = homeY;
		//activateFighting = true;
		bossState = state.main;
		timer = 0;
		maxAttacks -= 1;
		} 
	}
}








//
	//if we do not attack make the state default
	else if bossState == state.main
	{
		
		
			
			if activateFighting != true
			{
				 alarm[0] = game_get_speed(gamespeed_fps) * 1;
			}
			
		
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
//
		
		
		
		
		
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
			locationX = Oplayer.x - 32;
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
	timer = 0;
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

		
	

	
	
	
	
	
		//var distX = targetX - x;
			var distY = targetY - y;
			if point_distance( x, y, targetX - 32, targetY - 32) <= 5
			{
				move_towards_point(targetX,targetY ,4);
				maxAttacks -= 1;
				timer++;
				//bossState = state.returning;
			}//

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












