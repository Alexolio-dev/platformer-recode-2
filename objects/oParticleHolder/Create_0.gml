//system for the particles
global.particleSystem = part_system_create();
part_system_layer(global.particleSystem, "Instances");





//particle type shit
global.particleSandstorm = part_type_create();

//particles shape (sandstorm particles)
part_type_shape(global.particleSandstorm, pt_shape_pixel);

//size
part_type_size(global.particleSandstorm, 1,1,0,2);

//colour
part_type_colour1(global.particleSandstorm, c_yellow);

//alpha
part_type_alpha1(global.particleSandstorm, 1);

//speed
part_type_speed(global.particleSandstorm, 0.50, 2, -0.10, 0);

//the direction
part_type_direction(global.particleSandstorm, 0, 359, 0, 20);

//change rotation
part_type_orientation(global.particleSandstorm, 0, 0, 0, 0, true);

//blend mode
part_type_blend(global.particleSandstorm, 1);

//lifespan in steps
part_type_life(global.particleSandstorm, 30,60);



show_debug_message("Particle holder created");
show_debug_message("Particle system: " + string(global.particleSystem));
show_debug_message("Particle type: " + string(global.particleSandstorm));