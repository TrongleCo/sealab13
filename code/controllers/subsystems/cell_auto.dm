var/global/datum/cell_auto_handler/explosion_handler = new(1)

var/list/datum/cell_auto_handler/handlers = null

SUBSYSTEM_DEF(cell_auto)
	name = "Cellular Automata"
	wait = 1 // needs to be this low, internally it only processes each type as it needs it
	init_order = SS_INIT_CELLAUTO
	var/list/datum/cell_auto_handler/handlers = null

/datum/controller/subsystem/cell_auto/Initialize()
	..()

	handlers = list(explosion_handler)

/datum/controller/subsystem/cell_auto/fire()
	if(!handlers)
		return

	for(var/datum/cell_auto_handler/handler in handlers)
		if(handler.shouldProcess())
			handler.process()

/datum/controller/subsystem/cell_auto/stat_entry()
	..("H:[handlers.len]")
