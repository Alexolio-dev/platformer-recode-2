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
        var target = currentAction[1];
		var targetX = currentAction[2];
		var targetY = currentAction[3]; 
		var spd = currentAction[4];
		var oDirection = sign(targetX - target.x);
		
		
		
		Oplayer.cutsceneMove = true;
		Oplayer.cutsceneTargetX = targetX;
		Oplayer.cutsceneTargetY = targetY;
		Oplayer.cutsceneSpeed = spd;
		
		
		if Oplayer.cutsceneMove == true
	{
	move_towards_point(Oplayer.cutsceneTargetX, Oplayer.cutsceneTargetY, Oplayer.cutsceneSpeed);
	}
	
	if Oplayer.x == Oplayer.cutsceneTargetX && Oplayer.y == Oplayer.cutsceneTargetY
	{
	Oplayer.cutsceneMove = false;
	}
		
       if target.x == targetX && target.y == targetY
	   {
		   finished = true;
	   }
        break
		
		
		
		
		
		//in case of needing to wait do this:
	case "wait":
		
		if !actionStarted{
		waitTimer = currentAction[1] * game_get_speed(gamespeed_fps);
		actionStarted = true;
		}
		
		waitTimer--;
		
		if waitTimer <= 0{finished = true; };

		break
		
		
		
		
		
		case "end":
		
		doneWithCutscene = true;
		
		break;
}



