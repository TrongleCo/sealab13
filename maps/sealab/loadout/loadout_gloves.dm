/datum/gear/gloves/colored
	allowed_roles = list(FORMAL_ROLES)

/datum/gear/gloves/latex
	allowed_roles = list(STERILE_ROLES)

/datum/gear/gloves/nitrile
	allowed_roles = list(STERILE_ROLES)

/datum/gear/gloves/rainbow
	allowed_roles = list(INFORMAL_ROLES)

/datum/gear/gloves/evening
	allowed_roles = list(FORMAL_ROLES)

/datum/gear/gloves/botany
	allowed_roles = list(RESEARCH_ROLES, FOOD_ROLES, /datum/job/service/intern)

/datum/gear/gloves/dress
	display_name = "gloves, dress"
	path = /obj/item/clothing/gloves/color/white

/datum/gear/gloves/duty
	display_name = "gloves, duty"
	path = /obj/item/clothing/gloves/duty
	cost = 3
	allowed_roles = list(SECURITY_ROLES)