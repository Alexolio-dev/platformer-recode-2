//move in a circle
dir += rotSpd;

//calculate movement based on type
xspd = 0;
yspd = 0;

//each separate movementtype for each platform
if (moveType == "horizontal") {
    xspd = lengthdir_x(radius, dir) - lengthdir_x(radius, dir - rotSpd);
}
else if (moveType == "vertical") {
    yspd = lengthdir_y(radius, dir) - lengthdir_y(radius, dir - rotSpd);
}
else if (moveType == "circle") {
    xspd = lengthdir_x(radius, dir) - lengthdir_x(radius, dir - rotSpd);
    yspd = lengthdir_y(radius, dir) - lengthdir_y(radius, dir - rotSpd);
}

//move
x += xspd;
y += yspd;


//https://www.youtube.com/watch?v=c-AafWkwtao