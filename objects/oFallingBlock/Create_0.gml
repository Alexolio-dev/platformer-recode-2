// Inherit the parent event
event_inherited();

Wiggle = false;
WiggleTimer = 60;


StartX = x;
StartY = y;



on_pause = function(){
	part_system_automatic_update(global.particleSystem, false);
}

on_unpause = function(){
	part_system_automatic_update(global.particleSystem, true);
}
