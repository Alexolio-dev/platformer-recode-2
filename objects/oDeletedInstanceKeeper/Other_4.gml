with (oTriggerCutscene)
	{
	for (var _i = 0; _i < array_length(global.destroyedInstances); _i++){
			var _print = global.destroyedInstances[_i];
		
			if  y == _print.y && x == _print.x
			{
				instance_destroy();
			}
	}
}


