if (keyboard_check_pressed(vk_escape)){
	isPaused = !isPaused;
	if(isPaused){
		oPauseManager.pauseTag("pausable");
	}else{
		oPauseManager.unPauseTag("pausable");
	}
}