
/*/if fallingRubble show_debug_message("spawning, x=" + string(x+600) + " y=" + string(y));

if fallingRubble == true
{
	part_type_alpha1(global.particleSandstorm, 1);
	part_type_direction(global.particleSnow, 270, 270, 0, 0);
	part_particles_create(global.particleSystem, x, y, global.particleSnow, 80);
}

if (fallingRubble)
{
    part_particles_create(global.particleSystem, x, y, global.particlePlayerJump, 80);
    show_debug_message(part_system_exists(global.particleSystem));
}