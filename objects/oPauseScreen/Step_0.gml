if (keyboard_check_pressed(vk_escape)){
	isPaused = !isPaused;
	pos = 0;
	if(isPaused){
		oPauseManager.pauseTag("pausable");
	}else{
		oPauseManager.unPauseTag("pausable");
	}
}

if (isPaused)
{
	
	//movekeys
	var moveUp = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
	var moveDown = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
	var selected = keyboard_check_pressed(vk_space);
	
	//naviagte the list
	pos += moveDown -moveUp
	if pos >= array_length(buttonList) {pos = 0};
	if pos <0 {pos = 2}
	
	
//using every option
if keyboard_check_pressed(vk_space){

switch(pos){
	
	case 0:
	isPaused = false;
	oPauseManager.unPauseTag("pausable");
	break;
	
	
	
	case 1:
	isPaused = false;
	oPauseManager.unPauseTag("pausable");
	alarm[0] = 1;
	break;
	
	
	
	case 2:
	game_end();
	break;
}
}
}








	/*/movekeys
	var moveUp = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
	var moveDown = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
	var selected = keyboard_check_pressed(vk_space);
	
	//naviagte the list
	pos += moveDown -moveUp
	if pos >= array_length(buttonList) {pos = 0};
	if pos <0 {pos = 2}
	
	
//using every option
if keyboard_check_pressed(vk_space){

//if menuState == main
//{
	//if menustate is main, go to the usuals
switch(pos){
				case 0:
				isPaused = false;
				oPauseManager.unPauseTag("pausable");
				break;
	
	
	
				case 1:
				isPaused = false;
				oPauseManager.unPauseTag("pausable");
				alarm[0] = 1;
				break;
	
	
	
				case 2:
				game_end();
				//menuState = confirm;
				//pos = 0;
				break;
			}
		}
	//else if menuState == YesNo
	{
		//move thorugh are you sure
		switch(pos){
			case 0:
			menuState = main;
			pos = 2;
			break;
			
			case 1:
			game_end();
			break;
		//	
			
			}
		//}
	//}
//}