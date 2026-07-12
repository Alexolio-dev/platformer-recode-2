//time = 30;
//alarm[0] = time;


//system for the particles
global.particleSystem = part_system_create();
part_system_layer(global.particleSystem, "Instances");
part_system_depth(global.particleSystem, 15)





//particle type shit
global.particleSandstorm = part_type_create();


//shape and size and shit
part_type_shape(global.particleSandstorm, pt_shape_cloud);
part_type_size(global.particleSandstorm,1,1,0,0);
part_type_direction(global.particleSandstorm, 180,180, 0, 0);
part_type_speed(global.particleSandstorm, 5, 6, 0, 0);
part_type_alpha1(global.particleSandstorm, 0.5);
part_type_life(global.particleSandstorm, 240, 240);