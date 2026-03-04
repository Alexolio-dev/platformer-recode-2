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