/obj/machinery/fusion_fuel_compressor
	name = "fuel compressor"
	icon = 'icons/obj/machines/power/fusion.dmi'
	icon_state = "fuel_compressor1"
	density = 1
	anchored = 1
	layer = 4

/obj/machinery/fusion_fuel_compressor/MouseDrop_T(var/atom/movable/target, var/mob/user)
	if(user.incapacitated() || !user.Adjacent(src))
		return
	return do_special_fuel_compression(target, user)

/obj/machinery/fusion_fuel_compressor/proc/do_special_fuel_compression(var/obj/item/weapon/thing, var/mob/user)
	if(istype(thing, /obj/machinery/power/supermatter/shard))
		var/obj/item/weapon/fuel_assembly/F = new(get_turf(src), "supermatter")
		visible_message("<span class='notice'>\The [src] compresses the [thing] into a new fuel assembly.</span>")
		qdel(thing)
		user.put_in_hands(F)
		return 1
	return 0

/obj/machinery/fusion_fuel_compressor/attackby(var/obj/item/weapon/thing, var/mob/user)
	if(istype(thing, /obj/item/stack/material))
		var/obj/item/stack/material/M = thing
		var/material/mat = M.get_material()
		if(!mat.is_fusion_fuel)
			to_chat(user, "<span class='warning'>It would be pointless to make a fuel rod out of [mat.use_name].</span>")

			return
		if(M.get_amount() < 25)
			to_chat(user, "<span class='warning'>You need at least 25 [mat.sheet_plural_name] to make a fuel rod.</span>")

			return
		var/obj/item/weapon/fuel_assembly/F = new(get_turf(src), mat.name)
		visible_message("<span class='notice'>\The [src] compresses the [mat.use_name] into a new fuel assembly.</span>")
		M.use(25)
		user.put_in_hands(F)

	else if(do_special_fuel_compression(thing, user))
		return

	return ..()