pausedElements = [];
pauseQueue = [];
unPauseQueue = [];

pauseObject = function(_obj_or_id, _length = -1){
	array_push(pauseQueue, {object: _obj_or_id, length: _length});
}


unPauseObject = function( _obj_or_id){
	array_push(unPauseQueue, _obj_or_id);
}

pauseTag = function(_tag_or_tags, _length = -1){ 
	var _assets = tag_get_asset_ids(_tag_or_tags, asset_object);
	for(var _i = 0; _i < array_length(_assets); _i++){
		pauseObject(_assets[_i], _length);
	}
}

unPauseTag = function(_tag_or_tags){
	var _assets = tag_get_asset_ids(_tag_or_tags, asset_object);
	for(var _i = 0; _i < array_length(_assets); _i++){
		unPauseObject(_assets[_i]);
	}
}