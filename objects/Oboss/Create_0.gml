image_index = 1;

cutsceneStarted = false;

attacks = 0;
maxAttacks = 0;
AttackGoUpTimer = 0;

chosen = false;
locationX = 0;
locationY = 0;


bossFightStarted = false;

wallNotHit = false;

theWay = 1;
face = sign(theWay);
timer = 0;


enum state
{
	main,
	attack,
	returning,
	
}


bossState = state.main
homeX = x
homeY = y
//dashTargetX = 
//dashTargetY
dashSpeed = 4;
timer = 0;