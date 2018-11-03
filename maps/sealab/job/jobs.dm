/datum/map/sealab
	// haha xeno scum
	species_to_job_blacklist = list(
		/datum/species/adherent = list(ALL_ROLES),
		/datum/species/nabber = list(ALL_ROLES),
		/datum/species/vox = list(ALL_ROLES),
		/datum/species/unathi  = list(ALL_ROLES),
		/datum/species/skrell  = list(ALL_ROLES),
		/datum/species/diona   = list(ALL_ROLES),
		/datum/species/machine = list(ALL_ROLES)
	)

	allowed_jobs = list(ALL_ROLES)


/* ------ EXECUTIVES ------ */

/datum/job/executive
	department = "Command"
	department_flag = COM

/datum/job/executive/administrator
	title = "Administrator"
	supervisors = "the corporate board and investors"

	total_positions = 1
	spawn_positions = 1

	minimal_player_age = 7
	economic_power = 15
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/executive/administrator

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_ADEPT,
	                    SKILL_PILOT       = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)
	required_education = EDUCATION_TIER_BACHELOR

/datum/job/executive/administrator/get_description_blurb()
	return "You are the Administrator. You are the top dog. You are an experienced executive and ultimately responsible for all that happens in the facility. Your job is to make sure [GLOB.using_map.full_name] operates smoothly and completes its research goals. Delegate to the executives under you to effectively manage the facility, and listen to and trust their expertise."

/datum/job/executive/hop
	title = "Head of Personnel"
	supervisors = "the Administrator"

	total_positions = 1
	spawn_positions = 1

	minimal_player_age = 7
	economic_power = 10
	ideal_character_age = 45
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/executive/hop

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)

	skill_points = 30

	access = list(access_security, access_brig, access_armory, access_forensics_lockers, access_heads,
			            access_medical, access_morgue, access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_change_ids, access_ai_upload, access_teleporter, access_eva, access_bridge,
			            access_all_personal_lockers, access_chapel_office, access_tech_storage, access_atmospherics, access_bar, access_janitor, access_crematorium, access_robotics,
			            access_kitchen, access_cargo, access_construction, access_chemistry, access_cargo_bot, access_hydroponics, access_library, access_virology,
			            access_cmo, access_qm, access_network, access_surgery, access_mailsorting, access_heads_vault, access_ce,
			            access_hop, access_hos, access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_sec_doors, access_psychiatrist,
			            access_medical_equip, access_solgov_crew, access_robotics_engineering, access_emergency_armory, access_gun, access_expedition_shuttle, access_guppy,
			            access_seneng, access_senmed, access_senadv, access_hangar, access_guppy_helm, access_expedition_shuttle_helm, access_aquila, access_aquila_helm, access_explorer, access_pathfinder)
	minimal_access = list(access_security, access_brig, access_armory, access_forensics_lockers, access_heads,
			            access_medical, access_morgue, access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_change_ids, access_ai_upload, access_teleporter, access_eva, access_bridge,
			            access_all_personal_lockers, access_chapel_office, access_tech_storage, access_atmospherics, access_bar, access_janitor, access_crematorium,
			            access_kitchen, access_cargo, access_construction, access_chemistry, access_cargo_bot, access_hydroponics, access_library, access_virology,
			            access_cmo, access_qm, access_network, access_surgery, access_mailsorting, access_heads_vault, access_ce,
			            access_hop, access_hos, access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_sec_doors, access_psychiatrist,
			            access_medical_equip, access_solgov_crew, access_robotics_engineering, access_emergency_armory, access_gun, access_expedition_shuttle, access_guppy,
			            access_seneng, access_senmed, access_senadv, access_hangar, access_guppy_helm, access_aquila, access_aquila_helm, access_explorer, access_pathfinder,
			            access_expedition_shuttle_helm)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)
	required_education = EDUCATION_TIER_BACHELOR

/datum/job/executive/hop/get_description_blurb()
	return "You are the Head of Personnel. You are the right-hand man of the Administrator. In his absence, you are expected to take his place. Your primary duty is directly managing department heads and all service workers."


/* ------ RESEARCH ------ */
/datum/job/research
	department = "Science"
	department_flag = SCI

/datum/job/research/head
	title = "Research Director"
	supervisors = "the Head of Personnel and the Administrator"

	total_positions = 1
	spawn_positions = 1

	economic_power = 20
	minimal_player_age = 7
	ideal_character_age = 60
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/executive/rd

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_ADEPT,
	                    SKILL_BOTANY      = SKILL_BASIC,
	                    SKILL_ANATOMY     = SKILL_BASIC,
	                    SKILL_DEVICES     = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_ADEPT)

	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

	access = list(access_tox, access_tox_storage, access_emergency_storage, access_teleporter, access_bridge, access_rd,
						access_research, access_mining, access_mining_office, access_mining_station, access_xenobiology,
						access_RC_announce, access_keycard_auth, access_xenoarch, access_corporate, access_sec_guard, access_heads,
						access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_petrov_helm, access_guppy_helm)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/aidiag,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)
	required_education = EDUCATION_TIER_DOCTORATE

/datum/job/research/rd/get_description_blurb()
	return "You are the Research Administrator. You are responsible for the research department, organizing expeditions and research projects. Advise the rest of the crew on science matters."

/datum/job/research/senior
	title = "Senior Researcher"

	total_positions = 6
	spawn_positions = 6

	supervisors = "the Research Director"
	selection_color = "#633d63"
	economic_power = 12
	minimal_player_age = 3
	ideal_character_age = 50
	alt_titles = list(
		"Research Supervisor"
	)
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/research/senior_scientist

	access = list(access_tox, access_tox_storage, access_research, access_mining, access_mining_office,
						access_mining_station, access_xenobiology, access_xenoarch, access_corporate,
						access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_petrov_helm, access_guppy_helm)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_BASIC,
	                    SKILL_BOTANY      = SKILL_BASIC,
	                    SKILL_ANATOMY     = SKILL_BASIC,
	                    SKILL_DEVICES     = SKILL_ADEPT,
	                    SKILL_SCIENCE     = SKILL_ADEPT)

	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 20
	required_education = EDUCATION_TIER_DOCTORATE

/datum/job/research/scientist
	title = "Researcher"

	total_positions = 6
	spawn_positions = 6

	supervisors = "the Research Director"
	economic_power = 10
	ideal_character_age = 45
	minimal_player_age = 0
	alt_titles = list(
		"Xenoarcheologist",
		"Xenobiologist",
		"Xenobotanist",
		"Materials Scientist",
		"Scientist"
	)
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/research/scientist

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_DEVICES     = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_ADEPT)

	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)

	access = list(access_tox, access_tox_storage, access_research, access_petrov, access_petrov_helm,
						access_mining_office, access_mining_station, access_xenobiology, access_guppy_helm,
						access_xenoarch, access_corporate, access_expedition_shuttle, access_guppy, access_hangar)
	minimal_access = list()
	skill_points = 20
	required_education = EDUCATION_TIER_MASTERS

/datum/job/research/intern
	title = "Research Assistant"

	total_positions = 10
	spawn_positions = 10

	supervisors = "the Research Director and science personnel"
	selection_color = "#633d63"
	economic_power = 3
	ideal_character_age = 30
	alt_titles = list(
		"Laboratory Technician",
		"Field Assistant"
	)

	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/research/intern

	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)

	access = list(access_research, access_mining_office, access_corporate, access_petrov, access_expedition_shuttle, access_guppy, access_hangar)
	required_education = EDUCATION_TIER_DROPOUT


/* ------ ENGINEERING ------ */

/datum/job/engineering
	department = "Engineering"
	department_flag = ENG

/datum/job/engineering/head
	title = "Chief Engineer"

	total_positions = 1
	spawn_positions = 1

	supervisors = "the Head of Personnel and the Administrator"
	economic_power = 9
	ideal_character_age = 40
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/executive/chief_engineer

	min_skill = list(   SKILL_BUREAUCRACY  = SKILL_BASIC,
	                    SKILL_COMPUTER     = SKILL_ADEPT,
	                    SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_ADEPT,
	                    SKILL_ATMOS        = SKILL_ADEPT,
	                    SKILL_ENGINES      = SKILL_EXPERT)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)
	skill_points = 30

	access = list(access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_ai_upload, access_teleporter, access_eva, access_bridge, access_heads,
			            access_tech_storage, access_robotics, access_atmospherics, access_janitor, access_construction,
			            access_network, access_ce, access_RC_announce, access_keycard_auth, access_tcomsat,
			            access_solgov_crew, access_robotics_engineering, access_seneng, access_hangar, access_robotics)
	minimal_access = list(access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_ai_upload, access_teleporter, access_eva, access_bridge, access_heads,
			            access_tech_storage, access_atmospherics, access_janitor, access_construction,
			            access_network, access_ce, access_RC_announce, access_keycard_auth, access_tcomsat,
			            access_solgov_crew, access_robotics_engineering, access_seneng, access_hangar, access_robotics)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/ntnetmonitor,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports)
	required_education = EDUCATION_TIER_MASTERS

/datum/job/engineering/head/get_description_blurb()
	return "You are the Chief Engineer. You are responsible for the Engineering Department. Manage your engineers, ensure the power stays on, and design new additions for the facility. Advise the rest of the crew on engineering matters."

/datum/job/engineering/senior
	title = "Senior Engineer"

	total_positions = 6
	spawn_positions = 6

	supervisors = "the Chief Engineer"
	selection_color = "#5b4d20"
	economic_power = 6
	minimal_player_age = 3
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/engineering/senior

	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_ADEPT,
	                    SKILL_ATMOS        = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_ADEPT)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_DEVICES      = SKILL_MAX)
	skill_points = 24

	access = list(access_robotics, access_robotics_engineering, access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_teleporter, access_eva, access_tech_storage, access_atmospherics, access_janitor, access_construction,
			            access_tcomsat, access_solgov_crew, access_seneng, access_hangar)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)
	required_education = EDUCATION_TIER_TRADE

/datum/job/engineering/engineer
	title = "Engineer"

	total_positions = 6
	spawn_positions = 6

	supervisors = "the Chief Engineer"
	economic_power = 5
	minimal_player_age = 0
	ideal_character_age = 30
	alt_titles = list(
		"Maintenance Technician",
		"Engine Technician",
		"Electrician",
		"Atmospheric Technician"
	)
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/engineering/engineer

	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_BASIC,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_BASIC,
	                    SKILL_ATMOS        = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_BASIC)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_DEVICES      = SKILL_MAX)
	skill_points = 20

	access = list(access_robotics, access_robotics_engineering, access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_teleporter, access_eva, access_tech_storage, access_atmospherics, access_janitor, access_construction,
			            access_solgov_crew, access_hangar)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)
	required_education = EDUCATION_TIER_TRADE

/datum/job/engineering/intern
	title = "Engineering Intern"

	total_positions = 10
	spawn_positions = 10

	supervisors = "the Chief Engineer and engineering personnel"
	selection_color = "#5b4d20"
	ideal_character_age = 20
	alt_titles = list(
		"Engineering Apprentice"
	)

	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/engineering/intern

	skill_points = 4
	no_skill_buffs = TRUE

	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_HAULING      = SKILL_ADEPT,
	                    SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_ADEPT,
	                    SKILL_ATMOS        = SKILL_ADEPT,
	                    SKILL_ENGINES      = SKILL_ADEPT)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_DEVICES      = SKILL_MAX)

	access = list(access_robotics, access_robotics_engineering, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_eva, access_tech_storage, access_janitor, access_construction,
			            access_solgov_crew, access_hangar)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)
	required_education = EDUCATION_TIER_BASIC


/* ------ SECURITY ------ */

/datum/job/security
	department = "Security"
	department_flag = SEC

/datum/job/security/head
	title = "Head of Security"

	total_positions = 1
	spawn_positions = 1

	supervisors = "the Head of Personnel and the Administrator"
	economic_power = 8
	minimal_player_age = 7
	ideal_character_age = 35
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/executive/hos

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_ADEPT,
	                    SKILL_FORENSICS   = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)
	skill_points = 28

	access = list(access_security, access_brig, access_armory, access_forensics_lockers,
			            access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_teleporter, access_eva, access_bridge, access_heads,
			            access_hos, access_RC_announce, access_keycard_auth, access_sec_doors,
			            access_solgov_crew, access_gun, access_emergency_armory, access_hangar)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)
	required_education = EDUCATION_TIER_BACHELOR

/datum/job/security/head/get_description_blurb()
	return "You are the Head of Security. You are responsible for the Security Department. Manage your security guards to keep the facility safe from alien wildlife and would-be saboteurs. Be fully aware of corporate regulations and dispense justice where it is needed. You are subordinate to the administrator and the head of personnel."

/datum/job/security/guard
	title = "Security Guard"

	total_positions = 10
	spawn_positions = 10

	supervisors = "the Head of Security"
	selection_color = "#633d63"
	economic_power = 6
	minimal_player_age = 0
	ideal_character_age = 25
	alt_titles = list(
		"Brig Guard" = /decl/hierarchy/outfit/job/sealab/faculty/security/brig_guard
	)
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/security/guard

	min_skill = list(   SKILL_COMBAT  = SKILL_BASIC,
	                    SKILL_WEAPONS = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX)

	access = list(access_tox, access_tox_storage,access_research, access_mining, access_mining_office, access_mining_station, access_xenobiology,
						access_xenoarch, access_corporate, access_sec_guard, access_hangar, access_petrov, access_expedition_shuttle, access_guppy)
	required_education = EDUCATION_TIER_DROPOUT

/datum/job/security/detective
	title = "Detective"

	total_positions = 3
	spawn_positions = 3

	supervisors = "the Head of Security"
	economic_power = 5
	minimal_player_age = 7
	ideal_character_age = 35
	skill_points = 14
	alt_titles = list(
		"Forensics Technician" = /decl/hierarchy/outfit/job/sealab/faculty/security/detective/forensic_tech,
		"Criminal Investigator" = /decl/hierarchy/outfit/job/sealab/faculty/security/detective/forensic_tech
	)
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/security/detective

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_BASIC,
	                    SKILL_FORENSICS   = SKILL_ADEPT)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)
	skill_points = 20

	access = list(access_security, access_brig, access_forensics_lockers,
			            access_maint_tunnels, access_emergency_storage,
			            access_sec_doors, access_solgov_crew, access_morgue)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)
	required_education = EDUCATION_TIER_TRADE

/datum/job/security/intern
	title = "Security Cadet"

	total_positions = 10
	spawn_positions = 10

	supervisors = "the Head of Security and security personnel"
	selection_color = "#633d63"
	economic_power = 6
	minimal_player_age = 0
	ideal_character_age = 25
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/security/intern

	min_skill = list(   SKILL_COMBAT  = SKILL_BASIC,
	                    SKILL_WEAPONS = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX)

	access = list(access_tox, access_tox_storage,access_research, access_mining, access_mining_office, access_mining_station, access_xenobiology,
						access_xenoarch, access_corporate, access_sec_guard, access_hangar, access_petrov, access_expedition_shuttle, access_guppy)
	required_education = EDUCATION_TIER_DROPOUT


/* ------ MEDICAL ------ */

/datum/job/medical
	department = "Medical"
	department_flag = MED

/datum/job/medical/head
	title = "Chief Medical Officer"

	total_positions = 1
	spawn_positions = 1

	supervisors = "the Head of Personnel and the Administrator"
	economic_power = 10
	minimal_player_age = 7
	ideal_character_age = 48
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/executive/cmo

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_MEDICAL     = SKILL_ADEPT,
	                    SKILL_ANATOMY     = SKILL_EXPERT,
	                    SKILL_CHEMISTRY   = SKILL_BASIC,
	                    SKILL_VIROLOGY    = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX,
	                    SKILL_VIROLOGY    = SKILL_MAX)
	skill_points = 32

	access = list(access_medical, access_morgue, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_teleporter, access_eva, access_bridge, access_heads,
			            access_chapel_office, access_crematorium, access_chemistry, access_virology,
			            access_cmo, access_surgery, access_RC_announce, access_keycard_auth, access_psychiatrist,
			            access_medical_equip, access_solgov_crew, access_senmed, access_hangar)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)
	required_education = EDUCATION_TIER_MEDSCHOOL

/datum/job/medical/head/get_description_blurb()
	return "You are the Chief Medical Officer. You are responsible for the Medical Department. You ensure all members of medical are skilled, tasked, and handling their duties. Ensure your doctors are staffing your infirmary and your paramedics are ready for response. You are expected to know medical very well and remember, \"Do no harm\"."

/datum/job/medical/senior
	title = "Senior Doctor"

	total_positions = 6
	spawn_positions = 6

	supervisors = "the Chief Medical Officer"
	minimal_player_age = 2
	ideal_character_age = 45
	selection_color = "#013d3b"
	economic_power = 8
	alt_titles = list(
		"Physician",
		"Chemist" = /decl/hierarchy/outfit/job/sealab/faculty/medical/doctor/chemist,
		"Virologist" = /decl/hierarchy/outfit/job/sealab/faculty/medical/senior/virologist,
		"Surgeon" = /decl/hierarchy/outfit/job/sealab/faculty/medical/doctor/surgeon,
		"Trauma Surgeon" = /decl/hierarchy/outfit/job/sealab/faculty/medical/doctor/surgeon
	)
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/medical/senior

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_MEDICAL     = SKILL_ADEPT,
	                    SKILL_ANATOMY     = SKILL_EXPERT,
	                    SKILL_CHEMISTRY   = SKILL_BASIC,
	                    SKILL_VIROLOGY    = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX,
	                    SKILL_VIROLOGY    = SKILL_MAX)
	skill_points = 32

	access = list(access_medical, access_morgue, access_virology, access_maint_tunnels, access_emergency_storage,
			            access_crematorium, access_chemistry, access_surgery,
			            access_medical_equip, access_solgov_crew, access_senmed, access_chemistry, access_psychiatrist)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)
	required_education = EDUCATION_TIER_MEDSCHOOL

/datum/job/medical/doctor
	title = "Doctor"

	total_positions = 6
	spawn_positions = 6

	supervisors = "the Chief Medical Officer"
	economic_power = 7
	ideal_character_age = 40
	minimal_player_age = 0
	alt_titles = list(
		"Field Medic" = /decl/hierarchy/outfit/job/sealab/faculty/medical/doctor/field_medic,
		"Medical Technician",
		"Pharmacist" = /decl/hierarchy/outfit/job/sealab/faculty/medical/doctor/chemist,
		"Mortician" = /decl/hierarchy/outfit/job/sealab/faculty/medical/doctor/mortus
	)
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/medical/doctor

	min_skill = list(   SKILL_EVA     = SKILL_BASIC,
	                    SKILL_MEDICAL = SKILL_BASIC,
	                    SKILL_ANATOMY = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX,
	                    SKILL_VIROLOGY    = SKILL_MAX)

	access = list(access_medical, access_morgue, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_eva, access_surgery, access_medical_equip, access_solgov_crew, access_hangar, access_chemistry, access_psychiatrist)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)
	skill_points = 26
	required_education = EDUCATION_TIER_TRADE

/datum/job/medical/intern
	title = "Medical Resident"

	total_positions = 10
	spawn_positions = 10

	supervisors = "the Chief Medical Officer and medical personnel"
	selection_color = "#013d3b"
	ideal_character_age = 20
	alt_titles = list(
		"Nurse",
		"Medical Intern",
		"Orderly" = /decl/hierarchy/outfit/job/sealab/faculty/medical/intern/orderly,
		"Paramedic" = /decl/hierarchy/outfit/job/sealab/faculty/medical/intern/paramedic
	)

	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/medical/intern

	skill_points = 4
	no_skill_buffs = TRUE

	min_skill = list(   SKILL_EVA     = SKILL_ADEPT,
	                    SKILL_HAULING = SKILL_ADEPT,
	                    SKILL_MEDICAL = SKILL_EXPERT,
	                    SKILL_ANATOMY = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX,
	                    SKILL_VIROLOGY    = SKILL_MAX)

	access = list(access_medical, access_morgue, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_surgery, access_medical_equip, access_solgov_crew, access_psychiatrist)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)
	required_education = EDUCATION_TIER_BASIC


/* ------ CARGONIA ------ */

/datum/job/supply
	department = "Supply"
	department_flag = SUP

/datum/job/supply/head
	title = "Quartermaster"

	total_positions = 1
	spawn_positions = 1

	supervisors = "the Head of Personnel and the Administrator"
	economic_power = 5
	minimal_player_age = 0
	ideal_character_age = 35
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/supply/quartermaster

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_FINANCE     = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)
	skill_points = 18

	access = list(access_maint_tunnels, access_bridge, access_emergency_storage, access_tech_storage,  access_cargo, access_guppy_helm,
						access_cargo_bot, access_qm, access_mailsorting, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar, access_commissary)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/supply,
							 /datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)
	required_education = EDUCATION_TIER_BASIC

/datum/job/supply/head/get_description_blurb()
	return "You are the Quartermaster. While not actually an executive member of the faculty, you are responsible for the Supply Department. Manage your cargo technicians to ensure timely deliveries of resources to every department. Any resource shortages are your responsibility."

/datum/job/supply/cargo_tech
	title = "Cargo Technician"

	total_positions = 12
	spawn_positions = 12
	supervisors = "the Quartermaster"
	ideal_character_age = 24
	alt_titles = list(
		"Mailroom Clerk",
		"Shaft Miner"=/decl/hierarchy/outfit/job/sealab/faculty/supply/miner,
		"Prospector"=/decl/hierarchy/outfit/job/sealab/faculty/supply/miner
	)

	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/supply/cargo_tech

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)

	access = list(access_maint_tunnels, access_emergency_storage, access_cargo, access_guppy_helm,
						access_cargo_bot, access_mailsorting, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar, access_commissary)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/supply,
							 /datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)
	required_education = EDUCATION_TIER_BASIC


/* ------ SERVICE ------ */

/datum/job/service
	department = "Service"
	department_flag = SRV

/datum/job/service/janitor
	title = "Janitor"

	total_positions = 2
	spawn_positions = 2

	supervisors = "the Head of Personnel"
	ideal_character_age = 20

	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/service/janitor

	min_skill = list(   SKILL_HAULING = SKILL_BASIC)

	access = list(access_maint_tunnels, access_emergency_storage, access_janitor, access_solgov_crew)
	minimal_access = list()
	required_education = EDUCATION_TIER_BASIC

/datum/job/service/chef
	title = "Cook"

	total_positions = 3
	spawn_positions = 3

	supervisors = "the Head of Personnel"
	alt_titles = list(
		"Chef",
		"Farmer"
	)
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/service/cook

	min_skill = list(   SKILL_COOKING   = SKILL_ADEPT,
	                    SKILL_BOTANY    = SKILL_BASIC,
	                    SKILL_CHEMISTRY = SKILL_BASIC)
	access = list(access_maint_tunnels, access_hydroponics, access_kitchen, access_solgov_crew, access_bar, access_commissary)
	minimal_access = list()
	required_education = EDUCATION_TIER_TRADE

/datum/job/service/bartender
	title = "Bartender"

	total_positions = 1
	spawn_positions = 1

	supervisors = "the Head of Personnel"
	ideal_character_age = 30
	selection_color = "#515151"
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/service/bartender

	access = list(access_hydroponics, access_bar, access_solgov_crew, access_kitchen, access_commissary)
	minimal_access = list()
	min_skill = list(   SKILL_COOKING   = SKILL_BASIC,
	                    SKILL_BOTANY    = SKILL_BASIC,
	                    SKILL_CHEMISTRY = SKILL_BASIC)
	required_education = EDUCATION_TIER_DROPOUT

/datum/job/service/intern
	title = "Intern"

	total_positions = 100
	spawn_positions = 100
	supervisors = "the Head of Personnel"
	selection_color = "#515151"
	ideal_character_age = 20
	alt_titles = list(
		"Assistant",
		"Off-Duty"
	)
	outfit_type = /decl/hierarchy/outfit/job/sealab/faculty/service/intern

	access = list(access_maint_tunnels, access_emergency_storage, access_solgov_crew)
	required_education = EDUCATION_TIER_BASIC

/datum/job/cyborg
	total_positions = 6
	spawn_positions = 6
	supervisors = "your laws"
	minimal_player_age = 0