//Job Outfits

/*
TORCH OUTFITS
Keeping them simple for now, just spawning with basic EC uniforms, and pretty much no gear. Gear instead goes in lockers. Keep this in mind if editing.
*/

/decl/hierarchy/outfit/job/sealab
	name = OUTFIT_JOB_NAME("Sealab Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/sealab
	uniform = /obj/item/clothing/under/color/grey
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/sealab/faculty
	name = OUTFIT_JOB_NAME("Sealab Faculty Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/sealab/faculty
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary
	shoes = /obj/item/clothing/shoes/dutyboots


/* ------ EXECUTIVES ------ */

/decl/hierarchy/outfit/job/sealab/faculty/executive
	name = OUTFIT_JOB_NAME("Executive")
	hierarchy_type = /decl/hierarchy/outfit/job/sealab/faculty/executive
	l_ear = /obj/item/device/radio/headset/headset_com

/decl/hierarchy/outfit/job/sealab/faculty/executive/administrator
	name = OUTFIT_JOB_NAME("Administrator")
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/command
	l_ear = /obj/item/device/radio/headset/heads/torchcaptain
	shoes = /obj/item/clothing/shoes/dutyboots
	head = /obj/item/clothing/head/soft/solgov/expedition/co
	id_type = /obj/item/weapon/card/id/sealab/gold
	pda_type = /obj/item/modular_computer/pda/captain

/decl/hierarchy/outfit/job/sealab/faculty/executive/administrator/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack] = /obj/item/weapon/storage/backpack/captain
	backpack_overrides[/decl/backpack_outfit/satchel] = /obj/item/weapon/storage/backpack/satchel_cap
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/weapon/storage/backpack/messenger/com

/decl/hierarchy/outfit/job/sealab/faculty/executive/hop
	name = OUTFIT_JOB_NAME("Head of Personnel")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/command
	l_ear = /obj/item/device/radio/headset/heads/torchxo
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sealab/silver
	pda_type = /obj/item/modular_computer/pda/heads/hop


/* ------ RESEARCH ------ */

/decl/hierarchy/outfit/job/sealab/faculty/executive/rd
	name = OUTFIT_JOB_NAME("Research Director")
	l_ear = /obj/item/device/radio/headset/heads/torchntdirector
	uniform = /obj/item/clothing/under/rank/research_director
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/weapon/card/id/sealab/silver/rd
	pda_type = /obj/item/modular_computer/pda/heads/rd

/decl/hierarchy/outfit/job/sealab/faculty/research
	hierarchy_type = /decl/hierarchy/outfit/job/sealab/faculty/research
	l_ear = /obj/item/device/radio/headset/torchnanotrasen

/decl/hierarchy/outfit/job/sealab/faculty/research/New()
	..()
	BACKPACK_OVERRIDE_RESEARCH

/decl/hierarchy/outfit/job/sealab/faculty/research/senior_scientist
	name = OUTFIT_JOB_NAME("Senior Researcher")
	uniform = /obj/item/clothing/under/rank/scientist/executive
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/heads/rd
	id_type = /obj/item/weapon/card/id/sealab/faculty/research/senior

/decl/hierarchy/outfit/job/sealab/faculty/research/scientist
	name = OUTFIT_JOB_NAME("Scientist")
	uniform = /obj/item/clothing/under/rank/scientist
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/science
	id_type = /obj/item/weapon/card/id/sealab/faculty/research/scientist

/decl/hierarchy/outfit/job/sealab/faculty/research/intern
	name = OUTFIT_JOB_NAME("Science Intern")
	uniform = /obj/item/clothing/under/rank/scientist
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/science
	id_type = /obj/item/weapon/card/id/sealab/faculty/research/intern


/* ------ ENGINEERING ------ */

/decl/hierarchy/outfit/job/sealab/faculty/executive/chief_engineer
	name = OUTFIT_JOB_NAME("Chief Engineer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/engineering
	shoes = /obj/item/clothing/shoes/dutyboots
	l_ear = /obj/item/device/radio/headset/heads/ce
	id_type = /obj/item/weapon/card/id/sealab/silver/engineering
	pda_type = /obj/item/modular_computer/pda/heads/ce
	pda_slot = slot_l_store
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sealab/faculty/command/chief_engineer/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/sealab/faculty/engineering
	hierarchy_type = /decl/hierarchy/outfit/job/sealab/faculty/engineering
	l_ear = /obj/item/device/radio/headset/headset_eng
	pda_slot = slot_l_store
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sealab/faculty/engineering/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/sealab/faculty/engineering/senior
	name = OUTFIT_JOB_NAME("Senior Engineer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/engineering
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sealab/faculty/engineering/senior
	pda_type = /obj/item/modular_computer/pda/heads/ce

/decl/hierarchy/outfit/job/sealab/faculty/engineering/engineer
	name = OUTFIT_JOB_NAME("Engineer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/engineering
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sealab/faculty/engineering/engineer
	pda_type = /obj/item/modular_computer/pda/engineering

/decl/hierarchy/outfit/job/sealab/faculty/engineering/intern
	name = OUTFIT_JOB_NAME("Engineering Intern")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/engineering
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sealab/faculty/engineering/intern
	pda_type = /obj/item/modular_computer/pda/engineering


/* ------ SECURITY ------ */

/decl/hierarchy/outfit/job/sealab/faculty/executive/hos
	name = OUTFIT_JOB_NAME("Head of Security")
	l_ear = /obj/item/device/radio/headset/heads/cos
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sealab/silver/hos
	pda_type = /obj/item/modular_computer/pda/heads/hos

/decl/hierarchy/outfit/job/sealab/faculty/executive/hos/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/sealab/faculty/security
	hierarchy_type = /decl/hierarchy/outfit/job/sealab/faculty/security
	l_ear = /obj/item/device/radio/headset/headset_sec
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/sealab/faculty/security/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/sealab/faculty/security/guard
	name = OUTFIT_JOB_NAME("Security Guard")
	uniform = /obj/item/clothing/under/rank/guard
	shoes = /obj/item/clothing/shoes/jackboots
	id_type = /obj/item/weapon/card/id/sealab/faculty/security/guard
	pda_type = /obj/item/modular_computer/pda/security

/decl/hierarchy/outfit/job/sealab/faculty/security/brig_officer
	name = OUTFIT_JOB_NAME("Brig Officer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sealab/faculty/security/guard
	pda_type = /obj/item/modular_computer/pda/security

/decl/hierarchy/outfit/job/sealab/faculty/security/detective
	name = OUTFIT_JOB_NAME("Detective")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sealab/faculty/security/detective
	pda_type = /obj/item/modular_computer/pda/forensics

/decl/hierarchy/outfit/job/sealab/faculty/security/forensic_tech
	name = OUTFIT_JOB_NAME("Forensic Technician")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sealab/faculty/security/detective
	pda_type = /obj/item/modular_computer/pda/forensics

/decl/hierarchy/outfit/job/sealab/faculty/security/intern
	name = OUTFIT_JOB_NAME("Security Cadet")
	uniform = /obj/item/clothing/under/rank/guard
	shoes = /obj/item/clothing/shoes/jackboots
	id_type = /obj/item/weapon/card/id/sealab/faculty/security/intern
	pda_type = /obj/item/modular_computer/pda/security


/* ------ MEDICAL ------ */

/decl/hierarchy/outfit/job/sealab/faculty/executive/cmo
	name = OUTFIT_JOB_NAME("Chief Medical Officer - Torch")
	l_ear  =/obj/item/device/radio/headset/heads/cmo
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sealab/silver/cmo
	pda_type = /obj/item/modular_computer/pda/heads/cmo
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/sealab/faculty/command/cmo/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/sealab/faculty/medical
	hierarchy_type = /decl/hierarchy/outfit/job/sealab/faculty/medical
	l_ear = /obj/item/device/radio/headset/headset_med
	pda_type = /obj/item/modular_computer/pda/medical
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/sealab/faculty/medical/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/sealab/faculty/medical/senior
	name = OUTFIT_JOB_NAME("Senior Doctor")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sealab/faculty/medical/senior

/decl/hierarchy/outfit/job/sealab/faculty/medical/senior/virologist
	name = OUTFIT_JOB_NAME("Virologist")
	uniform = /obj/item/clothing/under/rank/virologist

/decl/hierarchy/outfit/job/sealab/faculty/medical/senior/virologist/New()
	..()
	BACKPACK_OVERRIDE_VIROLOGY

/decl/hierarchy/outfit/job/sealab/faculty/medical/doctor
	name = OUTFIT_JOB_NAME("Doctor")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sealab/faculty/medical/doctor
	l_ear = /obj/item/device/radio/headset/headset_corpsman

/decl/hierarchy/outfit/job/sealab/faculty/medical/doctor/xenosurgeon
	name = OUTFIT_JOB_NAME("Xenosurgeon")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/purple

/decl/hierarchy/outfit/job/sealab/faculty/medical/doctor/mortus
	name = OUTFIT_JOB_NAME("Mortician")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/black

/decl/hierarchy/outfit/job/sealab/faculty/medical/doctor/chemist
	name = OUTFIT_JOB_NAME("Chemist")
	uniform = /obj/item/clothing/under/rank/chemist
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

/decl/hierarchy/outfit/job/sealab/faculty/medical/intern
	name = OUTFIT_JOB_NAME("Medical Resident")
	id_type = /obj/item/weapon/card/id/sealab/faculty/medical/intern
	uniform = /obj/item/clothing/under/color/white

/decl/hierarchy/outfit/job/sealab/faculty/medical/intern/orderly
	name = OUTFIT_JOB_NAME("Orderly")
	uniform = /obj/item/clothing/under/rank/orderly

/decl/hierarchy/outfit/job/sealab/faculty/medical/intern/paramedic
	name = OUTFIT_JOB_NAME("Paramedic")
	uniform = /obj/item/clothing/under/rank/medical/paramedic
	suit = /obj/item/clothing/suit/storage/toggle/fr_jacket
	shoes = /obj/item/clothing/shoes/jackboots
	l_hand = /obj/item/weapon/storage/firstaid/adv
	belt = /obj/item/weapon/storage/belt/medical/emt
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sealab/faculty/medical/intern/counselor
	name = OUTFIT_JOB_NAME("Counselor")
	uniform = /obj/item/clothing/under/rank/psych/turtleneck
	shoes = /obj/item/clothing/shoes/white


/* ------ SUPPLY ------ */

/decl/hierarchy/outfit/job/sealab/faculty/supply
	l_ear = /obj/item/device/radio/headset/headset_cargo
	hierarchy_type = /decl/hierarchy/outfit/job/sealab/faculty/supply

/decl/hierarchy/outfit/job/sealab/faculty/supply/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/sealab/faculty/supply/quartermaster
	name = OUTFIT_JOB_NAME("Quartermaster")
	l_ear = /obj/item/device/radio/headset/headset_deckofficer
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/supply
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sealab/faculty/supply/quartermaster
	pda_type = /obj/item/modular_computer/pda/cargo

/decl/hierarchy/outfit/job/sealab/faculty/supply/cargo_tech
	name = OUTFIT_JOB_NAME("Cargo Technician")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/supply
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sealab/faculty/supply/cargo_tech
	pda_type = /obj/item/modular_computer/pda/cargo

/decl/hierarchy/outfit/job/sealab/faculty/supply/prospector
	name = OUTFIT_JOB_NAME("Miner")
	uniform = /obj/item/clothing/under/rank/ntwork
	shoes = /obj/item/clothing/shoes/workboots
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
	shoes = /obj/item/clothing/shoes/black
	id_type = /obj/item/weapon/card/id/sealab/faculty/service/chef
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/sealab/faculty/service/bartender
	name = OUTFIT_JOB_NAME("Bartender")
	uniform = /obj/item/clothing/under/rank/bartender
	shoes = /obj/item/clothing/shoes/laceup
	id_type = /obj/item/weapon/card/id/sealab/faculty/service/bartender
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/sealab/faculty/service/intern
	name = OUTFIT_JOB_NAME("Intern")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/sealab/faculty/intern
	pda_type = /obj/item/modular_computer/pda
