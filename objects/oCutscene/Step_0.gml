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
			Oplayer.cutsceneControlled = true;
			};

		break
		
	
	case "ascend":
	
		var target = currentAction[1];
		var targetX = currentAction[2];
		var targetY = currentAction[3];
		var targetYEndPosition = currentAction[4];
		var spdY = currentAction[5];
		
		
		
		var _distX = targetY - targetYEndPosition;
	 	Oplayer.cutsceneControlled = true;
		
	
	
	
	
		 if abs(target.y - targetYEndPosition) <= spdY
		    {
		        target.y = targetYEndPosition;
		        target.yspd = 0;
				
		        target.cutsceneControlled = false;

		        finished = true;
		    }
		
		
		
		case "end":
		
		doneWithCutscene = true;
		
		break;
}



