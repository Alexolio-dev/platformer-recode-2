//xspd += 3;

maxXspd -= xspd;

x += maxXspd;

if place_meeting(x,y, oWall)
{
	instance_destroy();
}