if (!instance_exists(oCutscene))
{
    var cutscene = instance_create_layer(0, 0, "Instances", oCutscene);
	cutscene.sceneIndex = triggerScene;
	Oplayer.xspd = 0;
	Oplayer.yspd = 0;
	
    instance_destroy();
}