for(var _i = 0; _i < array_length(pauseQueue); _i++){
	var _to_pause = pauseQueue[_i];
	with(_to_pause.object){
		array_push(other.pausedElements, {id, timer: _to_pause.length});
	}
}

pauseQueue = [];





for (var _i = 0; _i < array_length(unPauseQueue); _i++){
	with(unPauseQueue[_i]){
		var _index = array_find_index(other.pausedElements, function(_paused){
		return _paused.id == id;
	 });
		if(_index != -1){
			array_delete(other.pausedElements, _index, 1);
		}
	}
}

unPauseQueue = [];




for(var _i = 0; _i < array_length(pausedElements); _i++){
	var _element = pausedElements[_i];
	_element.timer--;
	if( _element.timer == 0){
		unPauseObject(_element.id);
		continue;
	}
	instance_deactivate_object(_element.id);
}

