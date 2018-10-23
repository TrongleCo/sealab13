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

/area/lambda/adm_quarters
	name = "Administrator's Quarters"
	icon_state = "red"

/area/lambda/hop_quarters
	name = "Head of Personnel's Quarters"
	icon_state = "green"

/area/lambda/central_comms
	name = "Central Communications"
	icon_state = "blue"

/area/lambda/conference_room
	name = "Lambda Conference Room"
	icon_state = "orange"

/area/lambda/armory
	name = "Armory"
	icon_state = "black"

/area/lambda/detective
	name = "Detective's Office"
	icon_state = "brown"

/area/lambda/hos
	name = "Head of Security's Office"
	icon_state = "red"

/area/lambda/holding
	name = "Holding Area"
	icon_state = "yellow"

/area/lambda/hallway
	name = "Lambda Hallway"
	icon_state = "cyan"

/area/lambda/maint
	name = "Lambda Maintenance"
	icon_state = "white"

/area/lambda/airlock
	name = "Lambda Airlock"
	icon_state = "green"

/area/epsilon/atmos
	name = "Atmospherics"
	icon_state = "orange"

/area/epsilon/engine
	name = "Engine Room"
	icon_state = "yellow"

/area/epsilon/control_room
	name = "Control Room"
	icon_state = "red"

/area/epsilon/manufacturing
	name = "Manufacturing"
	icon_state = "purple"

/area/epsilon/cargo_storage
	name = "Cargo Storage"
	icon_state = "pink"

/area/epsilon/ce_office
	name = "Chief Engineer's Office"
	icon_state = "blue"

/area/epsilon/qm_office
	name = "Quartermaster's Office"
	icon_state = "brown"

/area/epsilon/tool_storage
	name = "Tool and Equipment Storage"
	icon_state = "green"

/area/epsilon/subbay_1
	name = "Submarine Bay 01"
	icon_state = "blue"

/area/epsilon/subbay_2
	name = "Submarine Bay 02"
	icon_state = "red"

/area/epsilon/hallway
	name = "Epsilon Hallway"
	icon_state = "cyan"

/area/epsilon/conference
	name = "Epsilon Conference Room"
	icon_state = "black"

/area/epsilon/airlock
	name = "Epsilon Airlock"
	icon_state = "green"
