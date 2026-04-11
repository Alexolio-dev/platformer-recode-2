 function ControlsSetup()
{
	bufferTime = 3;
	jumpKeyBufferd = 0;
	jumpKeyBufferTimer = 0;
}



function getControls()
{
	//directional inputs
	rightKey = keyboard_check(ord("D")) + keyboard_check( vk_right );
		rightKey = clamp( rightKey, 0 , 1 );
	leftKey = keyboard_check(ord("A")) + keyboard_check( vk_left );
		leftKey = clamp ( leftKey, 0, 1);
	downKey = keyboard_check(ord("S")) + keyboard_check( vk_down );
		downKey = clamp( downKey, 0, 1);
	
	//action inputs
	jumpKeyPressed = keyboard_check_pressed( vk_space );
		jumpKeyPressed = clamp( jumpKeyPressed, 0, 1);
	jumpkey = keyboard_check( vk_space );
		jumpkey = clamp( jumpkey, 0, 1 );

		
		runKey = keyboard_check( vk_shift );
		runKey = clamp( runKey , 0, 1);
		
		
	//jumpKey buffering
	if jumpKeyPressed
	{
		jumpKeyBufferTimer = bufferTime;
	}
	if jumpKeyBufferTimer > 0
	{
		jumpKeyBufferd = 1;
		jumpKeyBufferTimer--;
	} else{
		jumpKeyBufferd = 0;
	}
}




//Saving
//https://www.youtube.com/watch?v=i6aEyrRIzTY
function save_game()
{
	
	//4:36
	
	
	
	
	
	
	
	var _struct = 
	{
		hunger: global.hunger,
		x: obj_cheese.x,
		y: obj_cheese.y,
		image_index: obj_cheese.image_index
		
		
		
		
		
	};
	
	var _string = json_stringify( _struct);
	
	
	
	
	
	
	
	var _file = file_text_open_write( "save.txt" );
	
	//file_text_write_real( _file, global.hunger);
	file_text_write_string( _file, _string);
	
	file_text_close( _file);
}

function load_game()
{
	if( file_exists( "save.txt"))
	{
		var _file = file_text_open_read("save.txt");
		
		//global.hunger = file_text_read_real( _file);
		var _json = file_text_read_string( _file);
		
		var _struct = json_parse( _json);
		global.hunger = _struct.hunger;
		obj_cheese.x = _struct.x;
		obj_cheese.y = _struct.y;
		obj_cheese.image_index = _struct.image_index;
		
		
		
		
		
		file_text_close( _file);
	}
	
	
	
}


