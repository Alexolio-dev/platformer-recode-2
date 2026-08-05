var currentScene = sceneInfo[scene];
//maybe 1d
var len = array_length_(currentScene) - 1;


script_execute_ext(_array[0],_array,1);




/*/switch (len) {
	case 0: script_execute(currentScene[0]); break;
	case 1: script_execute(currentScene[0], currentScene[1]); break;
	case 2: script_execute(currentScene[0], currentScene[1], currentScene[2]); break;
}