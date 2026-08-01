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

//creat the player jumping particle
global.particlePlayerJump = part_type_create();

//shape enzo
part_type_size( global.particlePlayerJump,2,2, 0, 0);
part_type_shape(global.particlePlayerJump ,pt_shape_pixel);
part_type_direction(global.particlePlayerJump, 0,180, 0, 0);
part_type_speed(global.particlePlayerJump, 0.2, 0.5, 0, 0);
part_type_alpha1(global.particlePlayerJump, 0.1);
part_type_life(global.particlePlayerJump, 25, 50);
part_type_colour1(global.particlePlayerJump, c_white)

//snow partile
global.particleSnow = part_type_create();

part_type_size( global.particleSnow,1,1, 0, 0);
part_type_shape(global.particleSnow ,pt_shape_pixel);
part_type_direction(global.particleSnow, 190, 260, 0, 0);
part_type_speed(global.particleSnow, 0.2, 0.5, 0, 0);
part_type_alpha1(global.particleSnow, 1);
part_type_life(global.particleSnow, 1000, 1700);
part_type_colour1(global.particleSnow, c_white);

//platform particle
global.particlePlatform = part_type_create();

part_type_size( global.particlePlatform,1,1, 0, 0);
part_type_shape(global.particlePlatform ,pt_shape_pixel);
part_type_direction(global.particlePlatform, 0, 360, 0, 0);
part_type_speed(global.particlePlatform, 0.2, 0.5, 0, 0);
part_type_alpha1(global.particlePlatform, 0.5);
part_type_life(global.particlePlatform, 15, 20);
part_type_colour1(global.particlePlatform, c_white);

//deze episode van pause tutorial voor wanneer de particle niet system werkt laatste paar min ig
//https://www.youtube.com/watch?v=8AcyZaNWjJk
//if there are any problems with the pause mechanic the video at exactly 5:50 might pose some help



