/atom/movable/cell/explosion
	name = "explosion"
	desc = ""
	icon = 'icons/effects/fire.dmi'
	icon_state = "3"

	layer = 9.99

	age_max = 2

	light_color = "#ed9200"
	plane = EFFECTS_BELOW_LIGHTING_PLANE
	layer = FIRE_LAYER
	color = "#ffc20c"

	anchored = 1
	mouse_opacity = 0

	group_type = /datum/ca_group/explosion

	var/severity = 0

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

/atom/movable/cell/explosion/process(var/act_chance = 100, var/spread_chance = 100, var/should_spread = TRUE)
	age++

	var/datum/ca_group/explosion/M = group
	var/spawn_wait = rand(1, M.max_cell_age)
	severity = M.getSeverity()

	if(iswall(src.loc) || prob(act_chance))
		exAct(spawn_wait)
	else
		spawn(spawn_wait)
			exAct()

	M.affected_turfs += src.loc

	if(should_spread && loc.Enter(src))
		for(var/direction in GLOB.cardinal)
			var/turf/S = get_step(src,direction)
			if(checkTurf(S) && prob(spread_chance))
				new /atom/movable/cell/explosion(S, group)

	group.cells -= src // explosion cells stopped being processed after they've cued up an ex_act

/atom/movable/cell/explosion/proc/exAct(var/spawn_wait = 1)
	for(var/atom/movable/AM in src.loc.contents)
		AM.ex_act(severity)

	src.loc.ex_act(severity)

	// allow the rest of the processing to occur
	spawn(spawn_wait)
		qdel(src)

/atom/movable/cell/explosion/proc/checkTurf(var/turf/T)
	if(!T)
		return 0

	if(T.containsCell(type))
		return 0

	var/datum/ca_group/explosion/M = group
	if(M && T in M.affected_turfs)
		return 0

	return 1
