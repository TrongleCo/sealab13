//TODO: Flash range does nothing currently

proc/explosion(turf/epicenter, devastation_range, heavy_impact_range, light_impact_range, flash_range, adminlog = 1, z_transfer = 0)
	src = null	// so we don't abort once src is deleted
	spawn(0)
		epicenter = get_turf(epicenter)
		if(!epicenter)
			return

		// z-Level Stuff
		if(z_transfer && (devastation_range > 0 || heavy_impact_range > 0))
			explosionZ(epicenter, devastation_range, heavy_impact_range, light_impact_range, flash_range, z_transfer)

		// We want sounds to be different depending on distance so we will manually do it ourselves.
		// Calculate far explosion sound range. Only allow the sound effect for heavy/devastating explosions.
		var/max_range = max(devastation_range, heavy_impact_range, light_impact_range, flash_range)
		var/frequency = get_rand_frequency()
		var/far_dist = (heavy_impact_range*5) + (devastation_range*20)

		for(var/mob/M in GLOB.player_list)
			if(M.z == epicenter.z)
				var/turf/M_turf = get_turf(M)
				var/dist = get_dist(M_turf, epicenter)
				// If inside the blast radius + world.view - 2
				if(dist <= round(max_range + world.view - 2, 1))
					M.playsound_local(epicenter, get_sfx("explosion"), 100, 1, frequency, falloff = 5) // get_sfx() is so that everyone gets the same sound
				else if(dist <= far_dist)
					var/far_volume = Clamp(far_dist, 30, 50) // Volume is based on explosion size and dist
					far_volume += (dist <= far_dist * 0.5 ? 50 : 0) // add 50 volume if the mob is pretty close to the explosion
					M.playsound_local(epicenter, 'sound/effects/explosionfar.ogg', far_volume, 1, frequency, falloff = 5)

		if(adminlog)
			message_admins("Explosion with size ([devastation_range], [heavy_impact_range], [light_impact_range]) in area [epicenter.loc.name] ([epicenter.x],[epicenter.y],[epicenter.z]) (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[epicenter.x];Y=[epicenter.y];Z=[epicenter.z]'>JMP</a>)")
			log_game("Explosion with size ([devastation_range], [heavy_impact_range], [light_impact_range]) in area [epicenter.loc.name] ")

		// spawning the actual explosion
		new /datum/ca_group/explosion( epicenter, devastation_range, heavy_impact_range, light_impact_range )

		// machines which report explosions.
		for(var/i,i<=doppler_arrays.len,i++)
			var/obj/machinery/doppler_array/Array = doppler_arrays[i]
			if(Array)
				Array.sense_explosion( epicenter.x, epicenter.y, epicenter.z, devastation_range, heavy_impact_range, light_impact_range, 0 )

	return 1

///// Z-Level Stuff
proc/explosionZ(turf/epicenter, devastation_range, heavy_impact_range, light_impact_range, flash_range, z_transfer = UP|DOWN)
	if(z_transfer & DOWN)
		//start the child explosion, no admin log and no additional transfers
		explosion(GetBelow(epicenter), max(devastation_range - 2, 0), max(heavy_impact_range - 2, 0), max(light_impact_range - 2, 0), max(flash_range - 2, 0), 0, 0)
		if(devastation_range - 2 > 0 || heavy_impact_range - 2 > 0) //only transfer further if the explosion is still big enough
			explosion(GetBelow(epicenter), max(devastation_range - 2, 0), max(heavy_impact_range - 2, 0), max(light_impact_range - 2, 0), max(flash_range - 2, 0), 0, 1)

	if(z_transfer & UP)
		//start the child explosion, no admin log and no additional transfers
		explosion(GetAbove(epicenter), max(devastation_range - 2, 0), max(heavy_impact_range - 2, 0), max(light_impact_range - 2, 0), max(flash_range - 2, 0), 0, 0)
		if(devastation_range - 2 > 0 || heavy_impact_range - 2 > 0) //only transfer further if the explosion is still big enough
			explosion(GetAbove(epicenter), max(devastation_range - 2, 0), max(heavy_impact_range - 2, 0), max(light_impact_range - 2, 0), max(flash_range - 2, 0), 1, 0)
