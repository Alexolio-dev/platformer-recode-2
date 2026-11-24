if room == WorldMap
{
	global.destroyedInstances = [];
}

with(Oplayer)  if place_meeting( x, y,oLevelEnd)
{
	global.destroyedInstances = [];
}
