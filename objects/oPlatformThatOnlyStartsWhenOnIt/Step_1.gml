//move in a circle
dir += rotSpd;

//calculate movement based on type
xspd = 0;
yspd = 0;


    yspd = lengthdir_y(radius, dir) - lengthdir_y(radius, dir - rotSpd);



//move
x += xspd;
y += yspd;


//https://www.youtube.com/watch?v=c-AafWkwtao