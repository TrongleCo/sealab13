/obj/item/clothing/mask/sealab
	icon = 'maps/sealab/icons/obj/clothing/mask.dmi'
	item_icons = list(slot_wear_mask_str = 'maps/sealab/icons/mob/clothing/mask.dmi')

/obj/item/clothing/mask/sealab/diving
	name = "diving mask"
	desc = "Goggles and a close-fitting mask that can be connected to an air supply."
	icon_state = "diving"
	item_state = "diving"
	flags_inv = HIDEFACE
	item_flags = ITEM_FLAG_AIRTIGHT
	body_parts_covered = FACE
	w_class = ITEM_SIZE_SMALL
	gas_transfer_coefficient = 0.10
	permeability_coefficient = 0.50
