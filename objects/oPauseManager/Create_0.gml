pauseQueue = [];
unPauseQueue = [];

pauseObject = function(_obj_or_id){
	array_push(pauseQueue, _obj_or_id);
}


unPauseObject = function( _obj_or_id){
	array_push(unPauseQueue, _obj_or_id);
	
	
}