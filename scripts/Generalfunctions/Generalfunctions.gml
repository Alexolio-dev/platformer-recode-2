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




global.game_data =
{
	hunger: 100,
	room_data: {}
};

function save_room()
{
	
	
	var _array = [];
	
	with (obj_cheese)
	{
		
		var _struct =
		{
			
			object: object_get_name( object_index),
			x: x,
			y:y,
			image_index: image_index

		
	};
	
	array_push( _array, _struct);
	
	//can double this and change the object to do it do not forget the last one so u can change color
	
	}
	
	struct_set( global.game_data.room_data, room_get_name( room), _array);
	
}

//Saving
//https://www.youtube.com/watch?v=i6aEyrRIzTY
function save_game()
{
	
	save_room();
	
	
	
	var _string = json_stringify( global.game_data);
	
	
}








function load_game()
{
	if( file_exists( "save.txt"))
	{
		var _file = file_text_open_read("save.txt");
		
		//global.hunger = file_text_read_real( _file);
		var _json = file_text_read_string( _file);
		
		var global.game_date = json_parse( _json);
		
		
		}

		
		file_text_close( _file);
	}
	
	


function load_room()
{
	
	var _array = struct_get ( global.game_data.room_data, room_get_name( room));
	
	if(array != undefined)
	{
		
		
		instance_destroy( obj_cheese);
				instance_destroy( obj_whateverdafuckelse);
				
		for( var i= 0;i < array_length( _array); i += 1)
		{
			var _struct = _array[ i];
			
			instance_create_layer( _struct.x, _struct.y, "instances", asset_get_index( _struct.object), _struct);
		
		
		}
		
		
	}
	
}


//Saving
//https://www.youtube.com/watch?v=i6aEyrRIzTY