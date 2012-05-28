/obj/item/clothing/head/helmet/space/rig
	name = "engineer hardsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low-pressure environment. Has radiation shielding."
	icon_state = "rig0-engineering"
	item_state = "rig0_engineering"
	armor = list(melee = 40, bullet = 5, laser = 20,energy = 5, bomb = 35, bio = 100, rad = 60)
	allowed = list(/obj/item/device/flashlight)
	var/brightness_on = 4 //luminosity when on
	var/on = 0
	color = "engineering" //Determines used sprites: rig[on]-[color] and rig[on]-[color]2 (lying down sprite)

/obj/item/clothing/head/helmet/space/rig/mining
	name = "mining hardsuit helmet"
	icon_state = "rig0-mining"
	item_state = "rig0-mining"
	color = "mining"


/obj/item/clothing/head/helmet/space/rig/elite
	name = "advanced hardsuit helmet"
	icon_state = "rig0-white"
	item_state = "rig0-white"
	color = "white"

/obj/item/clothing/suit/space/rig
	name = "engineer hardsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has radiation shielding."
	icon_state = "rig-engineering"
	item_state = "rig_suit"
	protective_temperature = 5000 //For not dieing near a fire, but still not being great in a full inferno
	slowdown = 2
	armor = list(melee = 40, bullet = 5, laser = 20,energy = 5, bomb = 35, bio = 100, rad = 60)
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/weapon/satchel,/obj/item/device/t_scanner,/obj/item/weapon/pickaxe, /obj/item/weapon/rcd)

/obj/item/clothing/suit/space/rig/mining
	icon_state = "rig-mining"
	name = "mining hardsuit"

/obj/item/clothing/suit/space/rig/elite
	icon_state = "rig-white"
	name = "advanced hardsuit"
	protective_temperature = 10000
