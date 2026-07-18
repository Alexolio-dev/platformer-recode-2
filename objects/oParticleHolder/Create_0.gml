//time = 30;
//alarm[0] = time;


//system for the particles
global.particleSystem = part_system_create();
part_system_layer(global.particleSystem, "Instances");
part_system_depth(global.particleSystem, 15)





//particle type shit
global.particleSandstorm = part_type_create();


//shape and size and shit
part_type_size_x( global.particleSandstorm, 2, 3, 0, 0);
part_type_sprite(global.particleSandstorm, sWindparticle, 0, 0, 0);
part_type_direction(global.particleSandstorm, 180,180, 0, 0);
part_type_speed(global.particleSandstorm, 15, 17, 0, 0);
part_type_alpha1(global.particleSandstorm, 0.1);
part_type_life(global.particleSandstorm, 240, 240);



//part_type_colour1(global.particleSandstorm, c_yellow);
//part_type_size(global.particleSandstorm,1,2,0,0);