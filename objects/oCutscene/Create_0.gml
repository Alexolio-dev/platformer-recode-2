//setting up everything so that the cutscene can get ready to start and run nicely

//to add!!!!
//rubble cutscene!
//boss screech cutscene
//lava bubbling cutscene
//question/exclamation mark above player




//general stuff
scene = [];

finished = false;
doneWithCutscene = false;

actionIndex = 0;
sceneIndex = 0;
actionStarted = false;

//wait timer
waitTimer = 0;

//create the boss for the cutscene
//cutsceneBoss = instance_create_layer(540, 400, "Instances", Oboss);

//the first test scene
scene[0] = [
    ["move", Oplayer, Oplayer.x + 200, Oplayer.y, 2],
    ["wait", 1.5],
    ["move", Oplayer, Oplayer.x + 400, Oplayer.y, 3],
    ["end"]
]


scene[1] = [
    ["move", Oplayer, Oplayer.x + 300, Oplayer.y, 2],
    ["wait", 1.5],
    ["move", Oplayer, Oplayer.x + 295, Oplayer.y, 1],
	["wait", 0.5],
	["move", Oplayer, Oplayer.x + 305, Oplayer.y, 1],
	["wait", 0.5],
	["move", Oplayer, Oplayer.x + 295, Oplayer.y, 1],
	["wait", 0.5],
	["move", Oplayer, Oplayer.x + 305, Oplayer.y, 1],
	["move", Oplayer, Oplayer.x + 400, Oplayer.y, 0.5],
	["wait", 1],
	["move", Oplayer, Oplayer.x + 395, Oplayer.y, 1],
	["wait", 0.5],
	["move", Oplayer, Oplayer.x + 405, Oplayer.y, 1],
	["wait", 1.5],
	["move", Oplayer, Oplayer.x - 50, Oplayer.y, 3],
    ["end"]
]


scene[2] = [
    ["wait", 2],
    ["move", Oplayer, Oplayer.x + 800, Oplayer.y, 1],
    ["end"]
]

scene[3] = [
	["ascend",Oboss, 540 , 4000 ,  3400, 20],
	["end"]
]

scene[4] = [
	["questionmark", Oplayer, 1.5],
	//["move", Oplayer, Oplayer.x - 50, Oplayer.y, 3],
	["end"]
]

scene[5] = [
	["falling rubble", 5],
	["end"]
]


