/area/exterior
	icon = 'icons/turf/areas.dmi'

	requires_power = 1
	always_unpowered = 1
	dynamic_lighting = 1
	has_gravity = 1
	power_light = 0
	power_equip = 0
	power_environ = 0
	area_flags = AREA_FLAG_EXTERNAL
	base_turf = /turf/simulated/ocean

/area/exterior/update_icon()
	return

/area/exterior/atmosalert()
	return

/area/exterior/fire_alert()
	return

/area/exterior/fire_reset()
	return

/area/exterior/readyalert()
	return

/area/exterior/partyalert()
	return

/area/exterior/ocean
	name = "\improper ocean"
	icon_state = "ocean"
	ambience = list('sound/ambience/ambispace.ogg','sound/music/title2.ogg','sound/music/space.ogg','sound/music/main.ogg','sound/music/traitor.ogg')
	base_turf = /turf/simulated/ocean

/area/dormitory
	name = "Dormitory"
	icon_state = "dormitory"
