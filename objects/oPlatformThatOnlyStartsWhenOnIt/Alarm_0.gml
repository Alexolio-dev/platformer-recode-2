//calculate movement based on type
xspd = 0;
yspd = 0;


if place_meeting(x,y,oWall)
{
	yspd = sign(yspd) *-1;
}


y += yspd;