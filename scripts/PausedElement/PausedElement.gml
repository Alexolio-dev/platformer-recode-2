function PausedElement(_id) constructor{
	
	id = _id;
	pauses = [];
	
	static noop = function(){};
	
	on_pause = variable_instance_exists(id, "on_pause") ? id.on_pause : noop;
	on_unpause = variable_instance_exists(id, "on_unpause") ? id.on_unpause : noop;
	
	
	static add = function(_length) {
		if (array_length(pauses) == 0){
			on_pause();
		}
		array_insert(pauses, 0 , _length);
		return self;
	}

	static shift = function(){
		array_shift(pauses);
		if (array_length(pauses) == 0){
			on_unpause();
		}
	}


	static update = function(){
		if(!instance_exists(id) || array_length(pauses) == 0) return true;
	
		pauses[0]--;
		if pauses[0] == 0 {
			shift();
		}
		
	return array_length(pauses) == 0;
	}
}