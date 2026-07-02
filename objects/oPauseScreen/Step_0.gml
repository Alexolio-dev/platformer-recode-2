if (keyboard_check_pressed(vk_escape) && room != WorldMap){
	isPaused = !isPaused;
	if(isPaused){
		oPauseManager.pauseTag("pausable");
	}else{
		oPauseManager.unPauseTag("pausable");
	}
}