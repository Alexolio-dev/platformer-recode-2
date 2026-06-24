if (keyboard_check_pressed(vk_escape)){
	isPaused = !isPaused;
	if(isPaused){
		oPauseManager.pauseObject(Oplayer);
	}else{
		oPauseManager.unPauseObject(Oplayer);
	}
}