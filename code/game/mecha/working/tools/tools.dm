/datum/mecha_tool
	var/name = "mecha tool"
	var/tool_cooldown = 0
	var/tool_ready = 1
	var/energy_drain = 0
	var/obj/mecha/working/chassis = null


/datum/mecha_tool/New(mecha)
	if(!istype(mecha, /obj/mecha/working))
		return
	src.chassis = mecha
	return

/datum/mecha_tool/proc/action(atom/target)
	if(!target)
		return 0
	if(!chassis)
		return 0
	if(energy_drain && chassis.cell.charge < energy_drain)
		return 0
	if(!tool_ready)
		return 0
	return 1


/*
	//Merde, cette proc est tres bugged
/datum/mecha_tool/uni_interface
	name = "Universal Interface"
	tool_cooldown = 10
	tool_ready = 1
	energy_drain = 5

	action(atom/target)
		if(!..()) return
		if(istype(target, /obj))
			var/obj/O = target
			if(O.allowed(chassis.occupant))
				target.attack_hand(chassis.occupant)
		return

*/

/datum/mecha_tool/hydraulic_clamp
	name = "Hydraulic Clamp"
	tool_cooldown = 15
	tool_ready = 1
	energy_drain = 10
	var/force = 15

	action(atom/target)
		if(!..()) return
		if(istype(target,/obj))
			var/obj/O = target
			if(!O.anchored)
				if(chassis.cargo.len < chassis.cargo_capacity)
					chassis.occupant << "You lift [target] and start to load it into cargo compartment."
					chassis.visible_message("[chassis] lifts [target] and start to load it into cargo compartment.")
					tool_ready = 0
					chassis.cell.use(energy_drain)
					O.anchored = 1
					var/T = chassis.loc
					spawn(tool_cooldown)
						if(T == chassis.loc && src == chassis.selected_tool)
							O.loc = chassis
							chassis.cargo += O
							O.anchored = 0
							chassis.occupant << "\blue [target] succesfully loaded."
						else
							chassis.occupant << "\red You must hold still while handling objects."
						tool_ready = 1

				else
					chassis.occupant << "\red Not enough room in cargo compartment."
			else
				chassis.occupant << "\red [target] is firmly secured."

		else if(istype(target,/mob))
			var/mob/M = target
			if(chassis.occupant.a_intent == "hurt")
				M.bruteloss += force
				M.oxyloss += round(force/2)
				M.updatehealth()
				chassis.occupant << "\red You squeese [target] with [src.name]. Something cracks."
				chassis.visible_message("\red [chassis] squeeses [target].")
			else
				step_away(M,chassis)
				chassis.occupant << "You push [target] out of the way."
				chassis.visible_message("[chassis] pushes [target] out of the way.")
			tool_ready = 0
			chassis.cell.use(energy_drain)
			spawn(tool_cooldown)
				tool_ready = 1
		return

/datum/mecha_tool/drill
	name = "Drill"
	tool_cooldown = 40
	tool_ready = 1
	energy_drain = 20
	var/force = 15

	action(atom/target)
		if(!..()) return
		tool_ready = 0
		chassis.cell.use(energy_drain)
		chassis.visible_message("\red [chassis] starts to drill [target]", "You hear the drill.")
		chassis.occupant << "\red You start to drill [target]"
		var/T = chassis.loc
		spawn(tool_cooldown)
			if(T == chassis.loc && src == chassis.selected_tool)
				target.ex_act(2)
			tool_ready = 1



/*
/datum/mecha_tool/gimmick
	name = "Gimmick"
	tool_cooldown = 10
	tool_ready = 1
	energy_drain = 10
	var/real_tool_type
	var/real_tool_obj

	action(atom/target)
		if(!..()) return
		target.attackby(real_tool_obj,chassis.occupant)
		tool_ready = 0
		chassis.cell.use(energy_drain)
		spawn(tool_cooldown)
			tool_ready = 1
		return

	New()
		..()
		real_tool_obj = new real_tool_type(chassis)
		return

/datum/mecha_tool/gimmick/screwdriver
	name = "Screwdriver"
	tool_cooldown = 10
	tool_ready = 1
	energy_drain = 10
	real_tool_type =  /obj/item/weapon/screwdriver


/datum/mecha_tool/gimmick/wrench
	name = "Wrench"
	tool_cooldown = 10
	tool_ready = 1
	energy_drain = 10
	real_tool_type = /obj/item/weapon/wrench

/datum/mecha_tool/gimmick/wirecutters
	name = "Wirecutters"
	tool_cooldown = 10
	tool_ready = 1
	energy_drain = 10
	real_tool_type = /obj/item/weapon/wirecutters

/datum/mecha_tool/gimmick/multitool
	name = "Multitool"
	tool_cooldown = 10
	tool_ready = 1
	energy_drain = 10
	real_tool_type = /obj/item/device/multitool

/datum/mecha_tool/gimmick/crowbar
	name = "Crowbar"
	tool_cooldown = 10
	tool_ready = 1
	energy_drain = 10
	real_tool_type = /obj/item/weapon/crowbar

/datum/mecha_tool/gimmick/weldingtool
	name = "Weldingtool"
	tool_cooldown = 10
	tool_ready = 1
	energy_drain = 15
	real_tool_type = /obj/item/weapon/weldingtool

	action(atom/target)
		var/obj/item/weapon/weldingtool/W = real_tool_obj
		W.welding = 1
		W.reagents.add_reagent("fuel", W.reagents.maximum_volume - W.get_fuel())
		..()
		return
*/



