/obj/item/device/electronic_assembly
	name = "electronic assembly"
	desc = "It's a case, for building electronics with."
	w_class = ITEM_SIZE_SMALL
	icon = 'icons/obj/electronic_assemblies.dmi'
	icon_state = "setup_small"
	var/max_components = 10
	var/max_complexity = 40
	var/opened = 0
	var/obj/item/electronic_assembly_shell/applied_shell

/obj/item/device/electronic_assembly/medium
	name = "electronic mechanism"
	icon_state = "setup_medium"
	w_class = ITEM_SIZE_NORMAL
	max_components = 20
	max_complexity = 80

/obj/item/device/electronic_assembly/large
	name = "electronic machine"
	icon_state = "setup_large"
	w_class = ITEM_SIZE_LARGE
	max_components = 30
	max_complexity = 120

/obj/item/device/electronic_assembly/drone
	name = "electronic drone"
	icon_state = "setup_drone"
	w_class = ITEM_SIZE_NORMAL
	max_components = 25
	max_complexity = 100

/obj/item/device/electronic_assembly/Destroy()
	qdel(applied_shell)
	applied_shell = null
	. = ..()

/obj/item/device/electronic_assembly/proc/get_part_complexity()
	. = 0
	for(var/obj/item/integrated_circuit/part in contents)
		. += part.complexity

/obj/item/device/electronic_assembly/proc/get_part_size()
	. = 0
	for(var/obj/item/integrated_circuit/part in contents)
		. += part.size

/obj/item/device/electronic_assembly/interact(mob/user)
	if(!CanInteract(user, physical_state))
		return

	var/total_part_size = get_part_size()
	var/total_complexity = get_part_complexity()
	var/HTML = list()

	HTML += "<html><head><title>[src.name]</title></head><body>"
	HTML += "<br><a href='?src=\ref[src]'>\[Refresh\]</a>  |  "
	HTML += "<a href='?src=\ref[src];rename=1'>\[Rename\]</a><br>"
	HTML += "[total_part_size]/[max_components] ([round((total_part_size / max_components) * 100, 0.1)]%) space taken up in the assembly.<br>"
	HTML += "[total_complexity]/[max_complexity] ([round((total_complexity / max_complexity) * 100, 0.1)]%) maximum complexity."
	HTML += "<br><br>"
	HTML += "Components;<br>"
	for(var/obj/item/integrated_circuit/circuit in contents)
		HTML += "<a href=?src=\ref[circuit];examine=1>[circuit.name]</a> | "
		HTML += "<a href=?src=\ref[circuit];rename=1>\[Rename\]</a> | "
		HTML += "<a href=?src=\ref[circuit];remove=1>\[Remove\]</a>"
		HTML += "<br>"

	HTML += "</body></html>"
	user << browse(jointext(HTML,null), "window=assembly-\ref[src];size=600x350;border=1;can_resize=1;can_close=1;can_minimize=1")

/obj/item/device/electronic_assembly/Topic(href, href_list[])
	if(..())
		return 1

	if(href_list["rename"])
		rename(usr)

	interact(usr) // To refresh the UI.

/obj/item/device/electronic_assembly/verb/rename()
	set name = "Rename Circuit"
	set category = "Object"
	set desc = "Rename your circuit, useful to stay organized."

	var/mob/M = usr
	if(!CanInteract(M, physical_state))
		return

	var/input = sanitizeSafe(input("What do you want to name this?", "Rename", src.name) as null|text, MAX_NAME_LEN)
	if(src && input && CanInteract(M, physical_state))
		to_chat(M, "<span class='notice'>The machine now has a label reading '[input]'.</span>")
		name = input

/obj/item/device/electronic_assembly/update_icon()
	if(applied_shell)
		desc = applied_shell.applied_desc
		icon = applied_shell.icon
		icon_state = applied_shell.icon_state
	else
		desc = initial(desc)
		icon = initial(icon)
		if(opened)
			icon_state = initial(icon_state) + "-open"
		else
			icon_state = initial(icon_state)

/obj/item/device/electronic_assembly/examine(mob/user)
	. = ..(user, 1)
	if(.)
		for(var/obj/item/integrated_circuit/output/screen/S in contents)
			if(S.stuff_to_display)
				to_chat(user, "There's a little screen labeled '[S.name]', which displays '[S.stuff_to_display]'.")
		if(opened)
			interact(user)

/obj/item/device/electronic_assembly/attackby(var/obj/item/I, var/mob/user)
	if(istype(I, /obj/item/integrated_circuit))
		if(!opened)
			to_chat(user, "<span class='warning'>\The [src] isn't opened, so you can't put anything inside.  Try using a crowbar.</span>")
			return 0
		var/obj/item/integrated_circuit/IC = I
		var/total_part_size = 0
		var/total_complexity = 0
		for(var/obj/item/integrated_circuit/part in contents)
			total_part_size += part.size
			total_complexity += part.complexity

		if( (total_part_size + IC.size) > max_components)
			to_chat(user, "<span class='warning'>You can't seem to add this [IC.name], as there's insufficient space.</span>")
			return 0
		if( (total_complexity + IC.complexity) > max_complexity)
			to_chat(user, "<span class='warning'>You can't seem to add this [IC.name], since this setup's too complicated for the case.</span>")
			return 0

		to_chat(user, "<span class='notice'>You slide \the [IC] inside \the [src].</span>")
		user.drop_item()
		IC.forceMove(src)
		playsound(get_turf(src), 'sound/items/Deconstruct.ogg', 50, 1)
		interact(user)
	else if(istype(I, /obj/item/weapon/crowbar))
		if(applied_shell)
			to_chat(user, "<span class='warning'>You cannot open the assembly while it has a shell attached.</span>")
			return 0
		playsound(get_turf(src), 'sound/items/Crowbar.ogg', 50, 1)
		opened = !opened
		to_chat(user, "<span class='notice'>You [opened ? "opened" : "closed"] \the [src].</span>")
		update_icon()
	else if(istype(I, /obj/item/electronic_assembly_shell))
		if(applied_shell)
			to_chat(user, "<span class='warning'>There is already a shell attached.</span>")
			return 0
		if(opened)
			to_chat(user, "<span class='warning'>You cannot attach a shell while the assembly is open.</span>")
			return 0
		if(!user.unEquip(I, target = src))
			return 0
		var/obj/item/electronic_assembly_shell/shell = I
		if(!shell.can_apply(src, user))
			return 0
		applied_shell = shell
		playsound(src, 'sound/weapons/flipblade.ogg', 50, 0, -2)
		update_icon()
	else if(istype(I, /obj/item/weapon/screwdriver)	&& applied_shell)
		applied_shell.dropInto(loc)
		user.put_in_any_hand_if_possible(applied_shell)
		applied_shell = null
		playsound(src, 'sound/items/Screwdriver.ogg', 50, 0, -2)
		update_icon()
	else if(istype(I, /obj/item/device/integrated_electronics/wirer) || istype(I, /obj/item/device/integrated_electronics/debugger) || istype(I, /obj/item/weapon/screwdriver))
		if(opened)
			interact(user)
		else
			to_chat(user, "<span class='warning'>\The [src] isn't opened, so you can't fiddle with the internal components.  \
			Try using a crowbar.</span>")
	else
		return ..()

/obj/item/device/electronic_assembly/attack_self(mob/user)
	if(opened)
		interact(user)

	var/list/available_inputs = list()
	for(var/obj/item/integrated_circuit/input/input in contents)
		if(input.can_be_asked_input)
			available_inputs.Add(input)

	var/obj/item/integrated_circuit/input/choice = (!opened && available_inputs.len == 1) ? available_inputs[1] : input(user, "What do you want to interact with?", "Interaction") as null|anything in available_inputs
	if(choice && CanInteract(user, physical_state))
		choice.ask_for_input(user)

/obj/item/device/electronic_assembly/emp_act(severity)
	..()
	for(var/atom/movable/AM in contents)
		AM.emp_act(severity)

/obj/item/device/electronic_assembly/ex_act(severity)
	for(var/thing in src)
		ex_act(thing)
	..()
