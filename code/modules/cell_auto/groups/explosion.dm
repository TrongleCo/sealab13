/datum/ca_group/explosion
	cell_type = /atom/movable/cell/explosion

	group_age_max = 0

	var/devastation_range
	var/heavy_impact_range
	var/light_impact_range
	var/max_range
	var/max_cell_age

	var/start
	var/end
	var/turf/start_loc

	var/powernet_rebuild_deferred
	var/air_processing_deferred

	var/list/affected_turfs = list()

/datum/ca_group/explosion/shouldProcess()
	if(group_age <= max_range)
		return 1
	return 0

/datum/ca_group/explosion/New(var/loc as turf, var/devastation, var/heavy_impact, var/light_impact)
	..()

	start_loc = loc

	devastation_range = devastation
	heavy_impact_range = heavy_impact
	light_impact_range = light_impact

	max_range = max(devastation_range, heavy_impact_range, light_impact_range)
	max_cell_age = sqrt((max_range)*10)/2

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
	..()
	..() // hacky AF, makes explosions process twice per tick so they move fast

	if(!getSeverity() && !shouldProcess())
		for(var/atom/movable/cell/cell in cells)
			cell.process(FALSE) // process the last of the cells without spreading

		if(!end)
			end = world.timeofday
			var/took = (end-start)/10
			if(Debug2)
				//You need to press the DebugGame verb to see these now....they were getting annoying and we've collected a fair bit of data. Just -test- changes  to explosion code using this please so we can compare
				world << "## DEBUG: Explosion([start_loc.x],[start_loc.y],[start_loc.z])(d[devastation_range],h[heavy_impact_range],l[light_impact_range]): Took [took] seconds."

/datum/ca_group/explosion/proc/getSeverity()
	if(group_age <= devastation_range)
		return 1.0
	else if(group_age <= heavy_impact_range)
		return 2.0
	else if(group_age <= light_impact_range)
		return 3.0
	else
		return 0
