/datum/cell_auto_handler
	var/list/datum/ca_group/groups = list()
	var/last_tick = 0
	var/delay = 1 SECOND

/datum/cell_auto_handler/New(var/interval = 0)
	..()

	last_tick = world.timeofday

	if(interval)
		delay = interval

/datum/cell_auto_handler/proc/process()
	last_tick = world.timeofday

	for(var/datum/ca_group/group in groups)
		group.process()

	return

/datum/cell_auto_handler/proc/shouldProcess()
	if(((world.timeofday - last_tick) > delay) || ((world.timeofday - last_tick) < 0))
		return 1

	return 0