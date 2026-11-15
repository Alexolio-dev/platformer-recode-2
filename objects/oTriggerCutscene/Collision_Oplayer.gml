if (!instance_exists(oCutscene)) && Oplayer.playerDead == false
{
	array_push(global.destroyedInstances, {x: x,y: y})
    var cutscene = instance_create_layer(0, 0, "Instances", oCutscene);
	cutscene.sceneIndex = triggerScene;
	Oplayer.xspd = 0;
	Oplayer.yspd = 0;
	cutsceneDone = true;
    instance_destroy();
}


