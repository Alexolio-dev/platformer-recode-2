image_index = 1;

cutsceneStarted = false;

attacks = 0;
maxAttacks = 0;
AttackGoUpTimer = 0;

chosen = false;
locationX = 0;
locationY = 0;
activateFighting = true;


bossFightStarted = false;

wallNotHit = false;

theWay = 1;
face = sign(theWay);
timer = 0;

rngChosen = false;
randomNumber = 0;

rightXPlace = false;
rightYPlace = false;




enum state
{
	main,
	attack,
	returning,
	specialAttack,
}


bossState = state.main
homeX = x
homeY = y
//dashTargetX = 
//dashTargetY
dashSpeed = 4;
timer = 0;
otherTimer = 0;



downSlam = false;
dashActive = false;
attackAgain = 0;
attackAgainVariable = false;