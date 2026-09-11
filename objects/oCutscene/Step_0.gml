// if we are doen witht he cutscene destroy the cutscene object and move tot he next scene
if (doneWithCutscene == true)
{
	doneWithCutscene = false;
	instance_destroy();
    exit;
}





// if the action has finished move to the next action
if finished == true{
	actionIndex++;
	finished = false;
	actionStarted = false;
}





// a variable for the current action and other things ahppening in the scene
var currentAction = scene[sceneIndex][actionIndex];

show_debug_message(currentAction[0]);





//the switch statement so that if the player moves and stuff other things can be edited
switch (currentAction[0])
{
	//in case of needing to mvoe do this:
    case "move":
	
		//setting up all the commands for the array
        var target = currentAction[1];
		var targetX = currentAction[2];
		var targetY = currentAction[3];
		var spd = currentAction[4];

		
		//tell the player that cutscene controlls the movement
		target.cutsceneControlled = true;
		target.cutsceneTargetX = targetX;
		target.cutsceneTargetY = targetY;
		target.cutsceneMoveSpd = spd;
		target.cutsceneMoveMode = "horizontal";
		
		
		
		
		//check if we have reached target X
		  if abs(target.x - targetX) <= spd
		    {
		        target.x = targetX;
		        target.xspd = 0;
				
		        target.cutsceneControlled = false;
		        target.cutsceneMoveMode = "none";

		        finished = true;
		    }
		
	
        break
		
		
		
		
		
		
		
		
		//in case of needing to wait do this:
	case "wait":
		
		if !actionStarted{
		waitTimer = currentAction[1] * game_get_speed(gamespeed_fps);
		actionStarted = true;
		Oplayer.cutsceneControlled = true;
		}
		
		
		waitTimer--;
		
		if waitTimer <= 0
			{
			finished = true;
			Oplayer.cutsceneControlled = false;
			};

		break
		
		
		
		
		
	
	case "ascend":
	
		var target = currentAction[1];
		var targetX = currentAction[2];
		var targetY = currentAction[3];
		var targetYEndPosition = currentAction[4];
		var spdY = currentAction[5];
		
		
		if actionStarted == false
		{
			target.x = targetX;
			target.y = targetY;
			Oboss.cutsceneStarted = true;
			Oplayer.cutsceneControlled = true;
			
			actionStarted = true;
		}
		
		
		target.y -= spdY;
		
		
		if (target.y <= targetYEndPosition)
		    {
		        target.y = targetYEndPosition;
		      
				
		        Oplayer.cutsceneControlled = false;
				Oboss.cutsceneStarted = false;
		        finished = true;
				instance_destroy(target);
		    }
		break
		
		
		
		
		
		
		
		
	case "questionmark":
			
		var target = currentAction[1];
			
		
		if !actionStarted{
		instance_create_layer(target.x -50 ,target.y - 100, "Instances",oQuestionMark);
		waitTimer = currentAction[2] * game_get_speed(gamespeed_fps);
		actionStarted = true;
		Oplayer.cutsceneControlled = true;
		}
			
		waitTimer--;
		
		if waitTimer <= 0
			{
			finished = true;
			Oplayer.cutsceneControlled = false;
			instance_destroy(oQuestionMark);
			};
		
		break
		
		
		
		
		
		
		
	case "falling rubble":
		
		
		
		if !actionStarted{
		waitTimer = currentAction[1] * game_get_speed(gamespeed_fps);
		oParticleHolder.fallingRubble = true;
		actionStarted = true;
		Oplayer.cutsceneControlled = true;
		}
		
		waitTimer--;
		
		if waitTimer <= 0
		{
		finished = true;
		oParticleHolder.fallingRubble  = false;
		Oplayer.cutsceneControlled = false;
		};
		
		
		break
		
		
		
		
		
		
		
	case "bubbling lava":
		
		if !actionStarted{
		waitTimer = currentAction[1] * game_get_speed(gamespeed_fps);
		oParticleHolder.lavaBubbling = true;
		actionStarted = true;
		Oplayer.cutsceneControlled = true;
		}
		
		waitTimer--;
		
		if waitTimer <= 0
		{
		finished = true;
		oParticleHolder.lavaBubbling = false;
		Oplayer.cutsceneControlled = false;
		};
		
		
		break
		
		
		
		
		
		
		
		case "end":
		
		doneWithCutscene = true;
		
		break;
}


//instance_create_layer(targetX, targetY, "Instances",target);
