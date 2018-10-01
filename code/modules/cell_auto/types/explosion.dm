/atom/movable/cell/explosion
	name = "explosion"
	desc = ""
	icon = 'icons/effects/fire.dmi'
	icon_state = "3"

	layer = 9.99

	age_max = 0

	light_color = "#ed9200"
	plane = EFFECTS_BELOW_LIGHTING_PLANE
	layer = FIRE_LAYER
	color = "#ffc20c"

	anchored = 1
	mouse_opacity = 0

	group_type = /datum/ca_group/explosion

	var/turf/T
	var/severity = 0
	var/ex_act_chance = 10 // the chance we'll break now istead of caching
	var/spread_chance = 85 // Introducing a little randomness to explosion expansion

/atom/movable/cell/explosion/New()
	..()

	set_light(0.5, 1, 3, l_color = light_color)
	update_icon()

/atom/movable/cell/explosion/update_icon()
	..()

	var/datum/ca_group/explosion/G = group

	if(G)
		icon_state = "[4-G.getSeverity()]"
	else
		icon_state = ""

/atom/movable/cell/explosion/process(var/should_spread = TRUE)
	age++

	T = loc

	if(!T)
		qdel(src)
		return

	// process beforehand spreading so theres a chance for an explosion to break through a wall
	var/datum/ca_group/explosion/M = group
	var/s = M.getSeverity()

	severity = s
	group.cells -= src // explosion cells stopped being processed after they've cued up an ex_act

	if(iswall(T) || prob(ex_act_chance)) // Need to break down walls as we get to them so explosions dont get stuck in single rooms
		exAct()
	else
		var/datum/ca_group/explosion/exp = group
		spawn(rand(1, exp.max_cell_age))
			exAct()

	M.affected_turfs += T

	if(should_spread && loc.Enter(src))
		for(var/direction in GLOB.cardinal)
			var/turf/S = get_step(src,direction)
			if(checkTurf(S) && prob(spread_chance))
				new /atom/movable/cell/explosion(S, group)

/atom/movable/cell/explosion/proc/exAct()
	T.ex_act(severity)

	for(var/atom/movable/AM in T.contents)
		AM.ex_act(severity)

	// allow the rest of the processing to occur
	spawn(1)
		qdel(src)

/atom/movable/cell/explosion/proc/checkTurf(var/turf/T)
	if(!T)
		return 0

	if(T.containsCell(type))
		return 0

	var/datum/ca_group/explosion/M = group
	if(M)
		if(T in M.affected_turfs)
			return 0

	return 1
