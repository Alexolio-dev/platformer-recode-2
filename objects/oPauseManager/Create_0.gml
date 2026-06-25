pausedElements = [];
pauseQueue = [];
unPauseQueue = [];

pauseObject = function(_obj_or_id){
	array_push(pauseQueue, _obj_or_id);
}


unPauseObject = function( _obj_or_id){
	array_push(unPauseQueue, _obj_or_id);
}

pauseTag = function(_tag_or_tags){
	var _assets = tag_get_asset_ids(_tag_or_tags, asset_object);
	for(var _i = 0; _i < array_length(_assets); _i++){
		pauseObject(_assets[_i]);
	}
}

unPauseTag = function(_tag_or_tags){
	var _assets = tag_get_asset_ids(_tag_or_tags, asset_object);
	for(var _i = 0; _i < array_length(_assets); _i++){
		unPauseObject(_assets[_i]);
	}
}