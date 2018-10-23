/datum/map/sealab
	name = "Sealab"
	full_name = "Sealab"
	path = "sealab"
	flags = 0

	station_levels = list(1)
	contact_levels = list(1)
	player_levels = list(1)
	admin_levels = list()
	empty_levels = list()

	accessible_z_levels = list("1"=1)
	overmap_size = 35
	overmap_event_areas = 34
	usable_email_tlds = list("omail.net", "mmu.net")

	allowed_spawns = list("Dormitory")
	default_spawn = "Dormitory"

	station_name  = "Sealab"
	station_short = "Sealab"
	dock_name     = "SLB"
	boss_name     = "Cygnus Relay"
	boss_short    = "CR"
	company_name  = "Miki-Matsu Universal"
	company_short = "MMU"
	system_name = "61 Cygni"

	map_admin_faxes = list("Corporate Central Office")

	//These should probably be moved into the evac controller...
	shuttle_docked_message = "Attention all hands: Jump preparation complete. The bluespace drive is now spooling up, secure all stations for departure. Time to jump: approximately %ETD%."
	shuttle_leaving_dock = "Attention all hands: Jump initiated, exiting bluespace in %ETA%."
	shuttle_called_message = "Attention all hands: Jump sequence initiated. Transit procedures are now in effect. Jump in %ETA%."
	shuttle_recall_message = "Attention all hands: Jump sequence aborted, return to normal operating conditions."

	evac_controller_type = /datum/evacuation_controller/starship

	default_law_type = /datum/ai_laws/solgov
	use_overmap = 1
	num_exoplanets = 0
	planet_size = list(129,129)

	away_site_budget = 3

	id_hud_icons = 'maps/sealab/icons/assignment_hud.dmi'
	welcome_sound = 'sound/effects/welcome_tone.ogg'		// Sound played on roundstart

	species_to_rank_whitelist = list()

/datum/map/sealab/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/commandreport.ogg', volume = 45))

/datum/map/sealab/map_info(victim)
	to_chat(victim, "<h2>Current map information</h2>")
	to_chat(victim, "You are stationed on the <b>[GLOB.using_map.station_name]</b>, a remote deep-sea research laboratory under an alien ocean. The facility's goal is to research the unique wildlife that lives here and the exotic environment.")
	to_chat(victim, "This facility is staffed by employees of [GLOB.using_map.company_name], all working towards the same goal.")
	to_chat(victim, "You are completely isolated here, there are no other outposts for lightyears in any direction. If you or the facility fails, no one is coming to rescue you.")

/datum/map/sealab/send_welcome()
	var/welcome_text = "<center><font size=3><b>Sealab</b></font></center><hr />"

	welcome_text += "<br>Nearest [GLOB.using_map.company_short] vessel is [rand(3, 33)] lightyears away."
	welcome_text += "<br>There are no new communications."

	post_comm_message("[GLOB.using_map.station_name] Report", welcome_text)
	minor_announcement.Announce(message = "Scheduled [GLOB.using_map.company_short] report is available at communication consoles.")

/turf/simulated/wall //landlubbers go home
	name = "bulkhead"

/turf/simulated/floor
	name = "bare deck"

/turf/simulated/floor/tiled
	name = "deck"

/decl/flooring/tiling
	name = "deck"
