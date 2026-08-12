//setting up everything so that the cutscene can get ready to start and run nicely

//general stuff
scene = [];

finished = false;
doneWithCutscene = false;

actionIndex = 0;
sceneIndex = 0;
actionStarted = false;

//wait timer
waitTimer = 0;

//the first test scene
scene[0] = [
    ["move", Oplayer, Oplayer.x + 200, Oplayer.y, 2],
    ["wait", 1.5],
    ["move", Oplayer, Oplayer.x + 500, Oplayer.y, 3],
    ["end"]
]