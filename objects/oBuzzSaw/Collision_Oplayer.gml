//extra code



		/*/
		if (windTimer < 20)
		{
		    // First third of the second
		    part_type_direction(global.particleSandstorm, particleDirection, particleDirection, 0, 0);
			part_particles_create(global.particleSystem, x, y+_randomY, global.particleSandstorm, 50);
			
		}
		else if (windTimer < 40)
		{
		    // Middle third
		    if (windTimer mod 2 == 0)
		    {
		        part_type_direction(global.particleSandstorm, particleDirection, particleDirection, 0, 0);
				part_particles_create(global.particleSystem, x, y+_randomY, global.particleSandstorm, 50);
		    }
		}
		else
		{
		    // Last third
		    if (windTimer mod 4 == 0)
		    {
		        part_type_direction(global.particleSandstorm, particleDirection, particleDirection, 0, 0);
				part_particles_create(global.particleSystem, x, y+_randomY, global.particleSandstorm, 50);
		    }
		}
		
		/*/