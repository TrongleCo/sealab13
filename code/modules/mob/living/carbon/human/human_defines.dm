/mob/living/carbon/human

	//Hair colour and style
	var/r_hair = 0
	var/g_hair = 0
	var/b_hair = 0
	var/h_style = "Bald"

	//Facial hair colour and style
	var/r_facial = 0
	var/g_facial = 0
	var/b_facial = 0
	var/f_style = "Shaved"

	//Eye colour
	var/r_eyes = 0
	var/g_eyes = 0
	var/b_eyes = 0

	var/s_tone = 0	//Skin tone

	var/age = 30		//Player's age (pure fluff)
	var/b_type = "A+"	//Player's bloodtype (Not currently used, just character fluff)

	var/underwear = 1	//Which underwear the player wants
	var/backbag = 2		//Which backpack type the player has chosen. Nothing, Satchel or Backpack.

	//Equipment slots
	var/obj/item/wear_suit = null
	var/obj/item/w_uniform = null
	var/obj/item/shoes = null
	var/obj/item/belt = null
	var/obj/item/gloves = null
	var/obj/item/glasses = null
	var/obj/item/head = null
	var/obj/item/ears = null
	var/obj/item/weapon/card/id/wear_id = null
	var/obj/item/r_store = null
	var/obj/item/l_store = null
	var/obj/item/s_store = null


	var/icon/stand_icon = null
	var/icon/lying_icon = null

	var/mutantrace = null //The type of mutant race the player is if applicable (i.e. potato-man)

	var/list/organs = list()

	var/miming = null //Toggle for the mime's abilities.