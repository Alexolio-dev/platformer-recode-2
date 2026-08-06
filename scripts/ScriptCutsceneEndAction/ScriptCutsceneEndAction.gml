//does a bunch of stuff at the end of the action

	scene++;
	if (scene > array_length(sceneInfo) - 1)
	{
		instance_destroy();
		exit;
	}
	
event_perform(ev_other, ev_user0);