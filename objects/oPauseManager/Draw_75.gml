for(var _i = 0; _i < array_length(pauseQueue); _i++){
	with(pauseQueue[_i]){
		array_push(other.pausedElements, id);
	}
}

pauseQueue = [];





for (var _i = 0; _i < array_length(unPauseQueue); _i++){
	with(unPauseQueue[_i]){
		var _index = array_get_index(other.pausedElements, id);
		if(_index != -1){
			array_delete(other.pausedElements, _index, 1);
		}
	}
}

unPauseQueue = [];




for(var _i = 0; _i < array_length(pausedElements); _i++){
	instance_deactivate_object(pausedElements[_i]);
}

