//fullscreen toggle
if keyboard_check_pressed( vk_f11 )
{
	window_set_fullscreen( !window_get_fullscreen() );
}


//exit if there is no player
if !instance_exists(Oplayer) exit;

//get camera size
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

//get camera target coordiantes
var _camX = Oplayer.x - _camWidth/2;
var _camY = Oplayer.y - _camHeight/2;

//Constrain cam to room borders
_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

//set cam coordinate variables
finalCamX += (_camX - finalCamX) * camTrailSpd;
finalCamY += (_camY - finalCamY) * camTrailSpd;

//set camera coordinates
camera_set_view_pos(view_camera[0], _camX, _camY);

//if not want cam to race across room when placing character vid 3 15-15:30 min

//Same but for map player
/*/exit if there is no player
if !instance_exists(OplayerWorldMap) exit;

//get camera size
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

//get camera target coordiantes
var _camX = OplayerWorldMap.x - _camWidth/2;
var _camY = OplayerWorldMap.y - _camHeight/2;

//Constrain cam to room borders
_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

//set cam coordinate variables
finalCamX += (_camX - finalCamX) * camTrailSpd;
finalCamY += (_camY - finalCamY) * camTrailSpd;

//set camera coordinates
camera_set_view_pos(view_camera[0], _camX, _camY);
