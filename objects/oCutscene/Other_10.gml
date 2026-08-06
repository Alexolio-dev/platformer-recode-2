currentScene = sceneInfo[scene];
//maybe 1d
var len = array_length_(currentScene) - 1;

currentSceneArray = -1;
currentSceneArray = array_create(len, 0);
array_copy(currentSceneArray, 0, currentScene, 1, len);