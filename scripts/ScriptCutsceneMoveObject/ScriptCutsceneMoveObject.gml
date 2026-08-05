//move the character with x and y n shit
//give an instance

var obj = argument0, relative = argument3, spd = argument4;

if (Xdest == -1){
	if !relative
	{
		Xdest = argument1;
		Ydest = argument2;
	}else {
		Xdest = obj.x + argument1;
		Ydest = obj.y + argument2;
	}
}

var xx = Xdest;
var yy = Ydest;


with (obj){
	sprite_index = sPlayer;
	
	if (point_distance(x,y,xx,yy) >= spd){
		var dir = point_direction(x,y,xx,yy);
		var ldirx = lengthdir_x(spd,dir);
		var ldiry = lengthdir_x(spd,dir);

		if (ldirx != 0) {image_xscale = sign(ldirx); }
		
		x += ldirx;
		y += ldiry;
	}else{
		
		sprite_index = sPlayerIdle;
		x = xx;
		y = yy;
		
		with(other)
		{
			Xdest = -1;
			Ydest = -1;
			ScriptCutsceneEndAction();
		}
	}
}