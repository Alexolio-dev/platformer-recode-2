//change the xscale

var arg, i = 0; repeat(argument_count){
	arg[i] = argument[i];
	i++;
}

if (argument_count > 1){
	with (arg[0]){
	
		image_xscale = arg[1];
	}
} else {
	with (arg[0]){
	
		image_xscale = -image_xscale;
	} 
}
ScriptCutsceneEndAction();