for(var _i = 0; _i < array_length(pauseQueue); _i++){
	var _to_pause = pauseQueue[_i];
	with(_to_pause.object){	
		var _index = array_find_index(other.pausedElements, function(_paused){
		return _paused.id == id;
	 });
		if(_index != -1){
			other.pausedElements[_index].add(_to_pause.length);
		}else{
		array_push(other.pausedElements, new PausedElement(id).add(_to_pause.length));
		}
	}
}

pauseQueue = [];





for (var _i = 0; _i < array_length(unPauseQueue); _i++){
	with(unPauseQueue[_i]){
		var _index = array_find_index(other.pausedElements, function(_paused){
		return _paused.id == id;
	 });
		if(_index != -1){
			other.pausedElements[_index].shift();
		}
	}
}

unPauseQueue = [];




for(var _i = 0; _i < array_length(pausedElements); _i++){
	var _element = pausedElements[_i];
	if( _element.update()){
		array_delete(pausedElements, _i, 1);
		_i--;
		continue;
	}
	instance_deactivate_object(_element.id);
}

