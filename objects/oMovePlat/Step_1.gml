//move in a circle
dir += rotSpd;

//get our tartget positions
var _targetX = xstart + lengthdir_x( radius,dir  )
var _targetY = ystart + lengthdir_y( radius, dir)

//get our xspd and yspd
xspd = _targetX - x;
//xspd = 0;
//yspd = _targetY - y;
yspd = 0;

//move 
x += xspd;
y += yspd;