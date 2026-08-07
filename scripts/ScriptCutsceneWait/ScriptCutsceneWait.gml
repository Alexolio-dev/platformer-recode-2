//@description cutscene
/*/@arg seconds

timer++;

if(timer >= argument0 * game_get_speed(gamespeed_fps))
{
	timer = 0;
	ScriptCutsceneEndAction();
}