/*/show_debug_message("========== END ACTION ==========");

show_debug_message("self = " + string(self));
show_debug_message("id = " + string(id));
show_debug_message("object = " + object_get_name(object_index));

show_debug_message("Has scene? " + string(variable_instance_exists(id, "scene")));

if (variable_instance_exists(id, "scene"))
{
    show_debug_message("scene = " + string(scene));
}
else
{
    show_debug_message("!!! THIS INSTANCE DOES NOT HAVE SCENE !!!");
}

scene++;

if (scene > array_length(sceneInfo) - 1)
{
    instance_destroy();
    exit;
}

event_perform(ev_other, ev_user0);





//does a bunch of stuff at the end of the action
show_debug_message("EndAction running");
show_debug_message("scene = " + string(scene));
show_debug_message("id = " + string(id));


	scene++;
	if (scene > array_length(sceneInfo) - 1)
	{
		instance_destroy();
		exit;
	}
	
event_perform(ev_other, ev_user0);