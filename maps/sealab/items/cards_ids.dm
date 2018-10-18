// ID Cards (they have to be here to make the outfits work, no way around it)

/obj/item/weapon/card/id/sealab
	name = "identification card"
	desc = "An identification card issued to faculty."
	icon_state = "id"
	item_state = "card-id"
	job_access_type = /datum/job/service/intern

/obj/item/weapon/card/id/sealab/silver
	desc = "A silver identification card belonging to heads of staff."
	icon_state = "silver"
	item_state = "silver_id"
	job_access_type = /datum/job/hop

/obj/item/weapon/card/id/sealab/gold
	desc = "A golden identification card belonging to the Commanding Officer."
	icon_state = "gold"
	item_state = "gold_id"
	job_access_type = /datum/job/captain

/obj/item/weapon/card/id/sealab/captains_spare
	name = "commanding officer's spare ID"
	desc = "The skipper's spare ID."
	icon_state = "gold"
	item_state = "gold_id"
	registered_name = "Commanding Officer"
	assignment = "Commanding Officer"

/obj/item/weapon/card/id/sealab/captains_spare/New()
	access = get_all_station_access()
	..()

/* ------ RESEARCH ------ */

/obj/item/weapon/card/id/sealab/silver/rd
	job_access_type = /datum/job/research/head

/obj/item/weapon/card/id/sealab/faculty/research/senior
	job_access_type = /datum/job/research/senior

/obj/item/weapon/card/id/sealab/faculty/research/scientist
	job_access_type = /datum/job/research/scientist

/obj/item/weapon/card/id/sealab/faculty/research/intern
	job_access_type = /datum/job/research/intern


/* ------ MEDICAL ------ */

/obj/item/weapon/card/id/sealab/silver/cmo
	job_access_type = /datum/job/medical/head

/obj/item/weapon/card/id/sealab/faculty/medical/senior
	job_access_type = /datum/job/medical/senior

/obj/item/weapon/card/id/sealab/faculty/medical/doctor
	job_access_type = /datum/job/medical/doctor

/obj/item/weapon/card/id/sealab/faculty/medical/intern
	job_access_type = /datum/job/medical/intern


/* ------ SECURITY ------ */

/obj/item/weapon/card/id/sealab/silver/hos
	job_access_type = /datum/job/security/head

/obj/item/weapon/card/id/sealab/faculty/security/guard
	job_access_type = /datum/job/security/guard

/obj/item/weapon/card/id/sealab/faculty/security/detective
	job_access_type = /datum/job/security/detective

/obj/item/weapon/card/id/sealab/faculty/security/intern
	job_access_type = /datum/job/security/intern

/* ------ ENGINEERING ------ */

/obj/item/weapon/card/id/sealab/silver/engineering
	job_access_type = /datum/job/engineering/head

/obj/item/weapon/card/id/sealab/faculty/engineering/senior
	job_access_type = /datum/job/engineering/senior

/obj/item/weapon/card/id/sealab/faculty/engineering/engineer
	job_access_type = /datum/job/engineering/engineer

/obj/item/weapon/card/id/sealab/faculty/engineering/intern
	job_access_type = /datum/job/engineering/intern

/* ------ SUPPLY ------ */

/obj/item/weapon/card/id/sealab/faculty/supply/quartermaster
	job_access_type = /datum/job/supply/qm

/obj/item/weapon/card/id/sealab/faculty/supply/cargo_tech
	job_access_type = /datum/job/supply/cargo_tech


/* ------ SERVICE ------ */

/obj/item/weapon/card/id/sealab/faculty/service/bartender
	job_access_type = /datum/job/service/bartender

/obj/item/weapon/card/id/sealab/faculty/service/janitor
	job_access_type = /datum/job/service/janitor

/obj/item/weapon/card/id/sealab/faculty/service/chef
	job_access_type = /datum/job/service/chef

/obj/item/weapon/card/id/sealab/faculty/intern
	job_access_type = /datum/job/service/intern


