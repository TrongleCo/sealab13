/*******************
Sealab specific items
*******************/

/obj/item/modular_computer/pda/explorer
	icon_state = "pda-exp"
	icon_state_unpowered = "pda-exp"

/obj/item/modular_computer/pda/heads/hop
	stored_pen = /obj/item/weapon/pen/multi/head/hop

/obj/item/modular_computer/pda/heads/administrator
	stored_pen = /obj/item/weapon/pen/multi/head/administrator

/obj/item/weapon/storage/backpack/explorer
	name = "explorer backpack"
	desc = "A rugged backpack."
	icon_state = "exppack"

/obj/item/weapon/storage/backpack/satchel_explorer
	name = "explorer satchel"
	desc = "A rugged satchel for field work."
	icon_state = "satchel-exp"

/obj/item/weapon/storage/backpack/messenger/explorer
	name = "explorer messenger bag"
	desc = "A rugged backpack worn over one shoulder."
	icon_state = "courierbagexp"

/***********
Unique items
***********/

/obj/item/weapon/pen/multi/head/hop
	name = "head of personnel's pen"
	icon = 'maps/sealab/icons/obj/uniques.dmi'
	icon_state = "pen_xo"
	desc = "A slightly bulky pen with a silvery case. Twisting the top allows you to switch the nib for different colors."

/obj/item/weapon/pen/multi/head/administrator
	name = "administrator's pen"
	icon = 'maps/sealab/icons/obj/uniques.dmi'
	icon_state = "pen_co"
	desc = "A slightly bulky pen with a golden case. Twisting the top allows you to switch the nib for different colors."

/obj/item/weapon/pen/multi/cmd/attack_self(mob/user)
	if(++selectedColor > 3)
		selectedColor = 1
	colour = colors[selectedColor]
	to_chat(user, "<span class='notice'>Changed color to '[colour].'</span>")

/obj/item/weapon/storage/fakebook
	name = "Workplace Crisis Management"
	desc = "Also known as 'I fucked up, what do?'. A very popular book amongst corporate management."
	icon = 'icons/obj/library.dmi'
	icon_state = "booknanoregs"
	attack_verb = list("bashed", "whacked", "educated")
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_SMALL
	max_storage_space = 4
	startswith = list(
			/obj/item/weapon/gun/projectile/pistol/liaison,
			/obj/item/weapon/reagent_containers/pill/tox
	)

/******
Weapons
******/

/obj/item/weapon/gun/projectile/revolver/webley/captain
	name = "\improper Final Argument"
	icon = 'maps/sealab/icons/obj/uniques.dmi'
	icon_state = "mosley"
	desc = "A shiny al-Maliki & Mosley Autococker automatic revolver, with black accents. Marketed as the 'Revolver for the Modern Era'. Uses .44 magnum rounds. This one has 'To the Administrator of Sealab' engraved."
	fire_delay = 5.7 //Autorevolver. Also synced with the animation
	fire_anim = "mosley_fire"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2)

/obj/item/weapon/gun/energy/stunrevolver/secure/nanotrasen
	name = "corporate stun revolver"
	desc = "This A&M X6 is fitted with an NT1019 chip which allows remote authorization of weapon functionality. It has a NanoTrasen logo on the grip."
	req_one_access = list(access_brig, access_heads, access_rd, access_sec_guard)

/obj/item/weapon/gun/projectile/pistol/liaison
	magazine_type = /obj/item/ammo_magazine/mc9mm/oneway

/obj/item/ammo_magazine/mc9mm/oneway
	initial_ammo = 1

/obj/effect/paint/hull
	color = COLOR_HULL

/obj/effect/paint/expeditionary
	color = "#68099e"