if global.level_unlocked[1] == true{reel = 1;}
if global.level_unlocked[2] == true{reel = 2;}
if global.level_unlocked[3] == true{reel = 3;}
if global.level_unlocked[4] == true{reel = 4;}
if global.level_unlocked[5] == true{reel = 5;}




if global.secret_thing[1] && global.secret_thing[2] && global.secret_thing[3] && global.secret_thing[4] && global.secret_thing[5]
{	reel = 6;}




if reel == 0{image_index = 0;}
if reel == 1{image_index = 1;}
if reel == 2{image_index = 2;}
if reel == 3{image_index = 3;}
if reel == 4{image_index = 4;}
if reel == 5{image_index = 5;}
if reel == 6{image_index = 6;}