/datum/ca_group/explosion
	cell_type = /atom/movable/cell/explosion

	group_age_max = 1

	var/devastation_range
	var/heavy_impact_range
	var/light_impact_range

	var/max_cell_age
	var/max_act_chance = 8 // the chance we'll immediately ex_act when the explosion starts
	var/min_act_chance = 2 // the chance we'll immediately ex_act when the explosion ends
	var/max_spread_chance = 100 // Introducing a little randomness to explosion expansion
	var/min_spread_chance = 80

	var/process_per_tick = 2 // how many times to process the cells per tick

	var/start
	var/end
	var/turf/start_loc

	var/powernet_rebuild_deferred
	var/air_processing_deferred

	var/list/affected_turfs = list()

/datum/ca_group/explosion/shouldProcess()
	if(group_age <= group_age_max)
		return 1
	return 0

/datum/ca_group/explosion/New(var/loc as turf, var/devastation, var/heavy_impact, var/light_impact)
	..()

	start_loc = loc

	devastation_range = devastation
	heavy_impact_range = heavy_impact
	light_impact_range = light_impact

	group_age_max = max(devastation_range, heavy_impact_range, light_impact_range)
	if(group_age_max <= 0)
		group_age_max = 1 // make this nonzero so we wont divide by zero in process()

	max_cell_age = sqrt((group_age_max)*20)

	explosion_handler.groups += src

	start = world.timeofday

	// we do this so if air processing was already killed, it will stay killed after the explosion is done
	air_processing_deferred = air_processing_killed
	if(!air_processing_deferred)
		air_processing_killed = 1

/datum/ca_group/explosion/Destroy()
	explosion_handler.groups -= src
	affected_turfs.Cut()

	if(!air_processing_deferred)
		air_processing_killed = 0

	..()

/datum/ca_group/explosion/process()
	// hacky AF, makes explosions process twice per tick so they spread fast
	for(var/i = 0; i < process_per_tick; i++)
		processCells()

	// if the explosion is done processing
	if(!getSeverity() && !shouldProcess())
		processCells(FALSE)
		logExplosion()

	if(!cells.len)
		logExplosion()
		qdel(src)
		return

	group_age++

/datum/ca_group/explosion/proc/logExplosion()
	end = world.timeofday
	var/took = (end-start)/10
	if(Debug2)
		//You need to press the DebugGame verb to see these now....they were getting annoying and we've collected a fair bit of data. Just -test- changes  to explosion code using this please so we can compare
		world << "## DEBUG: Explosion([start_loc.x],[start_loc.y],[start_loc.z])(d[devastation_range],h[heavy_impact_range],l[light_impact_range]): Took [took] seconds."

/datum/ca_group/explosion/proc/processCells(var/should_spread = TRUE)
	// chance to spread
	var/spread_chance = max_spread_chance+((max_spread_chance-min_spread_chance)/(-group_age_max))*group_age

	// chance to ex_act immediately
	var/act_chance = max_act_chance+((max_act_chance-min_act_chance)/(-group_age_max))*group_age

	for(var/atom/movable/cell/explosion/cell in cells)
		cell.process(act_chance, spread_chance, should_spread)

	group_age++

/datum/ca_group/explosion/proc/getSeverity()
	if(group_age <= devastation_range)
		return 1.0
	else if(group_age <= heavy_impact_range)
		return 2.0
	else if(group_age <= light_impact_range)
		return 3.0
	else
		return 0
