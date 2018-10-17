/datum/gear/suit/blueapron
	allowed_branches = list(CORPORATION_FACTION)

/datum/gear/suit/overalls
	allowed_branches = list(CORPORATION_FACTION)

/datum/gear/suit/medcoat
	allowed_roles = list(MEDICAL_ROLES)

/datum/gear/suit/trenchcoat
	allowed_roles = list(INFORMAL_ROLES)

/datum/gear/suit/poncho
	allowed_roles = list(INFORMAL_ROLES)

/datum/gear/suit/security_poncho
	allowed_roles = list(/datum/job/security/guard)

/datum/gear/suit/medical_poncho
	allowed_roles = list(MEDICAL_ROLES)

/datum/gear/suit/engineering_poncho
	allowed_roles = list(ENGINEERING_ROLES)

/datum/gear/suit/science_poncho
	allowed_roles = list(RESEARCH_ROLES)

/datum/gear/suit/cargo_poncho
	allowed_roles = list(SUPPLY_ROLES)

/datum/gear/suit/suit_jacket
	allowed_roles = list(FORMAL_ROLES)

/datum/gear/suit/custom_suit_jacket
	allowed_roles = list(FORMAL_ROLES)

/datum/gear/suit/hoodie
	allowed_roles = list(INFORMAL_ROLES)

/datum/gear/suit/hoodie_sel
	allowed_roles = list(INFORMAL_ROLES)

/datum/gear/suit/labcoat
	allowed_roles = list(STERILE_ROLES)

/datum/gear/suit/coat
	allowed_branches = list(CORPORATION_FACTION)

/datum/gear/suit/leather
	allowed_branches = list(CORPORATION_FACTION)

/datum/gear/suit/wintercoat
	allowed_roles = list(INFORMAL_ROLES)

/datum/gear/suit/track
	allowed_roles = list(INFORMAL_ROLES)

/datum/gear/tactical/pcarrier
	display_name = "black plate carrier"
	path = /obj/item/clothing/suit/armor/pcarrier
	cost = 1
	slot = slot_wear_suit
	allowed_roles = list(ARMORED_ROLES)

/datum/gear/tactical/pcarrier/misc
	display_name = "miscellaneous plate carrier selection"
	allowed_roles = list(ARMORED_ROLES)
	allowed_branches = list(CORPORATION_FACTION)

/datum/gear/tactical/pcarrier/misc/New()
	..()
	var/armors = list()
	armors["green plate carrier"] = /obj/item/clothing/suit/armor/pcarrier/green
	armors["tan plate carrier"] = /obj/item/clothing/suit/armor/pcarrier/tan
	gear_tweaks += new/datum/gear_tweak/path(armors)
