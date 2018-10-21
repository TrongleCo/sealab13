//Job Outfits

/*
SEALAB OUTFITS
Keeping them simple for now, just spawning with basic EC uniforms, and pretty much no gear. Gear instead goes in lockers. Keep this in mind if editing.
*/

/decl/hierarchy/outfit/job/sealab
	name = OUTFIT_JOB_NAME("Sealab Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/sealab
	uniform = /obj/item/clothing/under/color/blue
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/sealab/faculty
	name = OUTFIT_JOB_NAME("Sealab Faculty Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/sealab/faculty
	uniform = /obj/item/clothing/under/color/blue
	shoes = /obj/item/clothing/shoes/dutyboots


/* ------ EXECUTIVES ------ */

/decl/hierarchy/outfit/job/sealab/faculty/executive
	name = OUTFIT_JOB_NAME("Executive")
	hierarchy_type = /decl/hierarchy/outfit/job/sealab/faculty/executive
	l_ear = /obj/item/device/radio/headset/headset_com

/decl/hierarchy/outfit/job/sealab/faculty/executive/administrator
	name = OUTFIT_JOB_NAME("Administrator")
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/suit_jacket/navy
	shoes = /obj/item/clothing/shoes/laceup
	l_ear = /obj/item/device/radio/headset/heads/administrator
	id_type = /obj/item/weapon/card/id/sealab/executive/administrator
	pda_type = /obj/item/modular_computer/pda/captain

/decl/hierarchy/outfit/job/sealab/faculty/executive/administrator/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack] = /obj/item/weapon/storage/backpack/captain
	backpack_overrides[/decl/backpack_outfit/satchel] = /obj/item/weapon/storage/backpack/satchel_cap
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/weapon/storage/backpack/messenger/com

/decl/hierarchy/outfit/job/sealab/faculty/executive/hop
	name = OUTFIT_JOB_NAME("Head of Personnel")
	uniform = /obj/item/clothing/under/rank/head_of_personnel
	l_ear = /obj/item/device/radio/headset/heads/hop
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/weapon/card/id/sealab/executive/hop
	pda_type = /obj/item/modular_computer/pda/heads/hop


/* ------ RESEARCH ------ */

/decl/hierarchy/outfit/job/sealab/faculty/executive/rd
	name = OUTFIT_JOB_NAME("Research Director")
	l_ear = /obj/item/device/radio/headset/heads/rd
	uniform = /obj/item/clothing/under/rank/research_director
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/weapon/card/id/sealab/executive/rd
	pda_type = /obj/item/modular_computer/pda/heads/rd

/decl/hierarchy/outfit/job/sealab/faculty/research
	hierarchy_type = /decl/hierarchy/outfit/job/sealab/faculty/research
	shoes = /obj/item/clothing/shoes/white
	l_ear = /obj/item/device/radio/headset/headset_sci

/decl/hierarchy/outfit/job/sealab/faculty/research/New()
	..()
	BACKPACK_OVERRIDE_RESEARCH

/decl/hierarchy/outfit/job/sealab/faculty/research/senior_scientist
	name = OUTFIT_JOB_NAME("Senior Researcher")
	uniform = /obj/item/clothing/under/rank/scientist/executive
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
	pda_type = /obj/item/modular_computer/pda/heads/rd
	id_type = /obj/item/weapon/card/id/sealab/faculty/research/senior

/decl/hierarchy/outfit/job/sealab/faculty/research/scientist
	name = OUTFIT_JOB_NAME("Researcher")
	uniform = /obj/item/clothing/under/rank/scientist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
	pda_type = /obj/item/modular_computer/pda/science
	id_type = /obj/item/weapon/card/id/sealab/faculty/research/scientist

/decl/hierarchy/outfit/job/sealab/faculty/research/intern
	name = OUTFIT_JOB_NAME("Research Intern")
	uniform = /obj/item/clothing/under/rank/scientist
	pda_type = /obj/item/modular_computer/pda/science
	id_type = /obj/item/weapon/card/id/sealab/faculty/research/intern


/* ------ ENGINEERING ------ */

/decl/hierarchy/outfit/job/sealab/faculty/executive/chief_engineer
	name = OUTFIT_JOB_NAME("Chief Engineer")
	head = /obj/item/clothing/head/hardhat/white
	uniform = /obj/item/clothing/under/rank/chief_engineer
	shoes = /obj/item/clothing/shoes/workboots
	l_ear = /obj/item/device/radio/headset/heads/ce
	id_type = /obj/item/weapon/card/id/sealab/executive/engineering
	pda_type = /obj/item/modular_computer/pda/heads/ce
	pda_slot = slot_l_store
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sealab/faculty/command/chief_engineer/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/sealab/faculty/engineering
	hierarchy_type = /decl/hierarchy/outfit/job/sealab/faculty/engineering
	head = /obj/item/clothing/head/hardhat
	uniform = /obj/item/clothing/under/rank/engineer
	shoes = /obj/item/clothing/shoes/workboots
	l_ear = /obj/item/device/radio/headset/headset_eng
	pda_slot = slot_l_store
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sealab/faculty/engineering/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/sealab/faculty/engineering/senior
	name = OUTFIT_JOB_NAME("Senior Engineer")
	belt = /obj/item/weapon/storage/belt/utility/full
	gloves = /obj/item/clothing/gloves/thick
	id_type = /obj/item/weapon/card/id/sealab/faculty/engineering/senior
	pda_type = /obj/item/modular_computer/pda/heads/ce

/decl/hierarchy/outfit/job/sealab/faculty/engineering/engineer
	name = OUTFIT_JOB_NAME("Engineer")
	belt = /obj/item/weapon/storage/belt/utility/full
	id_type = /obj/item/weapon/card/id/sealab/faculty/engineering/engineer
	pda_type = /obj/item/modular_computer/pda/engineering

/decl/hierarchy/outfit/job/sealab/faculty/engineering/intern
	name = OUTFIT_JOB_NAME("Engineering Intern")
	id_type = /obj/item/weapon/card/id/sealab/faculty/engineering/intern
	pda_type = /obj/item/modular_computer/pda/engineering


/* ------ SECURITY ------ */

/decl/hierarchy/outfit/job/sealab/faculty/executive/hos
	name = OUTFIT_JOB_NAME("Head of Security")
	l_ear = /obj/item/device/radio/headset/heads/hos
	uniform = /obj/item/clothing/under/rank/head_of_security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sealab/executive/hos
	pda_type = /obj/item/modular_computer/pda/heads/hos

/decl/hierarchy/outfit/job/sealab/faculty/executive/hos/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/sealab/faculty/security
	hierarchy_type = /decl/hierarchy/outfit/job/sealab/faculty/security
	shoes = /obj/item/clothing/shoes/jackboots
	l_ear = /obj/item/device/radio/headset/headset_sec
	r_pocket = /obj/item/weapon/handcuffs
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/sealab/faculty/security/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/sealab/faculty/security/guard
	name = OUTFIT_JOB_NAME("Security Guard")
	uniform = /obj/item/clothing/under/rank/security
	id_type = /obj/item/weapon/card/id/sealab/faculty/security/guard
	pda_type = /obj/item/modular_computer/pda/security

/decl/hierarchy/outfit/job/sealab/faculty/security/brig_guard
	name = OUTFIT_JOB_NAME("Brig Guard")
	uniform = /obj/item/clothing/under/rank/security
	id_type = /obj/item/weapon/card/id/sealab/faculty/security/guard
	pda_type = /obj/item/modular_computer/pda/security

/decl/hierarchy/outfit/job/sealab/faculty/security/detective
	name = OUTFIT_JOB_NAME("Detective")
	head = /obj/item/clothing/head/det
	uniform = /obj/item/clothing/under/det
	suit = /obj/item/clothing/suit/storage/det_trench
	shoes = /obj/item/clothing/shoes/laceup
	l_pocket = /obj/item/weapon/flame/lighter/zippo
	r_hand = /obj/item/weapon/storage/briefcase/crimekit
	id_type = /obj/item/weapon/card/id/sealab/faculty/security/detective
	pda_type = /obj/item/modular_computer/pda/forensics

/decl/hierarchy/outfit/job/sealab/faculty/security/detective/forensic_tech
	name = OUTFIT_JOB_NAME("Forensic Technician")
	head = null
	l_pocket = null
	suit = /obj/item/clothing/suit/storage/forensics/blue

/decl/hierarchy/outfit/job/sealab/faculty/security/intern
	name = OUTFIT_JOB_NAME("Security Cadet")
	uniform = /obj/item/clothing/under/rank/guard
	id_type = /obj/item/weapon/card/id/sealab/faculty/security/intern
	pda_type = /obj/item/modular_computer/pda/security


/* ------ MEDICAL ------ */

/decl/hierarchy/outfit/job/sealab/faculty/executive/cmo
	name = OUTFIT_JOB_NAME("Chief Medical Officer")
	l_ear  =/obj/item/device/radio/headset/heads/cmo
	uniform = /obj/item/clothing/under/rank/chief_medical_officer
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/cmo
	shoes = /obj/item/clothing/shoes/brown
	l_hand = /obj/item/weapon/storage/firstaid/adv
	r_pocket = /obj/item/device/flashlight/pen
	id_type = /obj/item/weapon/card/id/sealab/executive/cmo
	pda_type = /obj/item/modular_computer/pda/heads/cmo
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/sealab/faculty/executive/cmo/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/sealab/faculty/medical
	hierarchy_type = /decl/hierarchy/outfit/job/sealab/faculty/medical
	uniform = /obj/item/clothing/under/rank/medical
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	shoes = /obj/item/clothing/shoes/white
	l_ear = /obj/item/device/radio/headset/headset_med
	pda_type = /obj/item/modular_computer/pda/medical
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/sealab/faculty/medical/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/sealab/faculty/medical/senior
	name = OUTFIT_JOB_NAME("Senior Doctor")
	l_hand = /obj/item/weapon/storage/firstaid/adv
	r_pocket = /obj/item/device/flashlight/pen
	id_type = /obj/item/weapon/card/id/sealab/faculty/medical/senior

/decl/hierarchy/outfit/job/sealab/faculty/medical/senior/virologist
	name = OUTFIT_JOB_NAME("Virologist")
	uniform = /obj/item/clothing/under/rank/virologist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/virologist
	mask = /obj/item/clothing/mask/surgical

/decl/hierarchy/outfit/job/sealab/faculty/medical/senior/virologist/New()
	..()
	BACKPACK_OVERRIDE_VIROLOGY

/decl/hierarchy/outfit/job/sealab/faculty/medical/doctor
	name = OUTFIT_JOB_NAME("Doctor")
	l_hand = /obj/item/weapon/storage/firstaid/adv
	r_pocket = /obj/item/device/flashlight/pen
	id_type = /obj/item/weapon/card/id/sealab/faculty/medical/doctor

/decl/hierarchy/outfit/job/sealab/faculty/medical/doctor/surgeon
	name = OUTFIT_JOB_NAME("Surgeon")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/blue
	suit = null
	head = /obj/item/clothing/head/surgery/blue

/decl/hierarchy/outfit/job/sealab/faculty/medical/doctor/mortus
	name = OUTFIT_JOB_NAME("Mortician")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/black

/decl/hierarchy/outfit/job/sealab/faculty/medical/doctor/chemist
	name = OUTFIT_JOB_NAME("Chemist")
	uniform = /obj/item/clothing/under/rank/chemist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/chemist
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/chemistry

/decl/hierarchy/outfit/job/sealab/faculty/medical/doctor/chemist/New()
	..()
	BACKPACK_OVERRIDE_CHEMISTRY

/decl/hierarchy/outfit/job/sealab/faculty/medical/doctor/psychologist
	name = OUTFIT_JOB_NAME("Psychologist")
	uniform = /obj/item/clothing/under/rank/psych/turtleneck
	shoes = /obj/item/clothing/shoes/white

/decl/hierarchy/outfit/job/sealab/faculty/medical/doctor/psychiatrist
	name = OUTFIT_JOB_NAME("Psychiatrist")
	uniform = /obj/item/clothing/under/rank/psych
	shoes = /obj/item/clothing/shoes/white

/decl/hierarchy/outfit/job/sealab/faculty/medical/doctor/field_medic
	name = OUTFIT_JOB_NAME("Field Medic")
	suit = /obj/item/clothing/suit/storage/toggle/fr_jacket
	shoes = /obj/item/clothing/shoes/workboots
	l_hand = /obj/item/weapon/storage/firstaid/adv
	belt = /obj/item/weapon/storage/belt/medical/emt
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sealab/faculty/medical/intern
	name = OUTFIT_JOB_NAME("Medical Resident")
	id_type = /obj/item/weapon/card/id/sealab/faculty/medical/intern
	uniform = /obj/item/clothing/under/color/white

/decl/hierarchy/outfit/job/sealab/faculty/medical/intern/orderly
	name = OUTFIT_JOB_NAME("Orderly")
	uniform = /obj/item/clothing/under/rank/orderly

/decl/hierarchy/outfit/job/sealab/faculty/medical/intern/paramedic
	name = OUTFIT_JOB_NAME("Paramedic")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/black
	suit = /obj/item/clothing/suit/storage/toggle/fr_jacket
	shoes = /obj/item/clothing/shoes/workboots
	l_hand = /obj/item/weapon/storage/firstaid/adv
	belt = /obj/item/weapon/storage/belt/medical/emt
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sealab/faculty/medical/intern/counselor
	name = OUTFIT_JOB_NAME("Counselor")
	uniform = /obj/item/clothing/under/rank/psych/turtleneck
	shoes = /obj/item/clothing/shoes/brown


/* ------ SUPPLY ------ */

/decl/hierarchy/outfit/job/sealab/faculty/supply
	shoes = /obj/item/clothing/shoes/workboots
	glasses = /obj/item/clothing/glasses/sunglasses
	l_hand = /obj/item/weapon/clipboard
	l_ear = /obj/item/device/radio/headset/headset_cargo
	hierarchy_type = /decl/hierarchy/outfit/job/sealab/faculty/supply

/decl/hierarchy/outfit/job/sealab/faculty/supply/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/sealab/faculty/supply/quartermaster
	name = OUTFIT_JOB_NAME("Quartermaster")
	uniform = /obj/item/clothing/under/rank/cargo
	id_type = /obj/item/weapon/card/id/sealab/faculty/supply/quartermaster
	pda_type = /obj/item/modular_computer/pda/cargo

/decl/hierarchy/outfit/job/sealab/faculty/supply/cargo_tech
	name = OUTFIT_JOB_NAME("Cargo Technician")
	uniform = /obj/item/clothing/under/rank/cargotech
	id_type = /obj/item/weapon/card/id/sealab/faculty/supply/cargo_tech
	pda_type = /obj/item/modular_computer/pda/cargo

/decl/hierarchy/outfit/job/sealab/faculty/supply/miner
	name = OUTFIT_JOB_NAME("Miner")
	uniform = /obj/item/clothing/under/rank/miner
	id_type = /obj/item/weapon/card/id/sealab/faculty/supply/cargo_tech
	pda_type = /obj/item/modular_computer/pda/science
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
	l_ear = /obj/item/device/radio/headset/headset_mining

/* ------ SERVICES ------ */

/decl/hierarchy/outfit/job/sealab/faculty/service
	l_ear = /obj/item/device/radio/headset/headset_service
	hierarchy_type = /decl/hierarchy/outfit/job/sealab/faculty/service

/decl/hierarchy/outfit/job/sealab/faculty/service/janitor
	name = OUTFIT_JOB_NAME("Janitor")
	uniform = /obj/item/clothing/under/rank/janitor
	shoes = /obj/item/clothing/shoes/black
	id_type = /obj/item/weapon/card/id/sealab/faculty/service/janitor
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/sealab/faculty/service/cook
	name = OUTFIT_JOB_NAME("Cook")
	uniform = /obj/item/clothing/under/rank/chef
	suit = /obj/item/clothing/suit/chef
	head = /obj/item/clothing/head/chefhat
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/weapon/card/id/sealab/faculty/service/chef
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/sealab/faculty/service/farmer
	name = OUTFIT_JOB_NAME("Farmer")
	uniform = /obj/item/clothing/under/rank/hydroponics
	suit = /obj/item/clothing/suit/apron
	gloves = /obj/item/clothing/gloves/thick/botany
	r_pocket = /obj/item/device/analyzer/plant_analyzer

/decl/hierarchy/outfit/job/sealab/faculty/service/bartender
	name = OUTFIT_JOB_NAME("Bartender")
	uniform = /obj/item/clothing/under/rank/bartender
	shoes = /obj/item/clothing/shoes/laceup
	id_type = /obj/item/weapon/card/id/sealab/faculty/service/bartender
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/sealab/faculty/service/intern
	name = OUTFIT_JOB_NAME("Intern")
	uniform = /obj/item/clothing/under/sealab/intern
	shoes = /obj/item/clothing/shoes/black
	id_type = /obj/item/weapon/card/id/sealab/faculty/intern
	pda_type = /obj/item/modular_computer/pda
