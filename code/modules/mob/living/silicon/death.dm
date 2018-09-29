/mob/living/silicon/gib()
	if((status_flags & GODMODE)) // godmode takes no damage!
		return

	..("gibbed-r")
	gibs(loc, null, /obj/effect/gibspawner/robot)

/mob/living/silicon/dust()
	if((status_flags & GODMODE)) // godmode takes no damage!
		return

	..("dust-r", /obj/item/remains/robot)

/mob/living/silicon/death(gibbed, deathmessage, show_dead_message)
	if(in_contents_of(/obj/machinery/recharge_station))//exit the recharge station
		var/obj/machinery/recharge_station/RC = loc
		RC.go_out()
	return ..(gibbed, deathmessage, show_dead_message)