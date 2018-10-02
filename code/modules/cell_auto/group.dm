// cell auto group
// collection of cells
/datum/ca_group
	var/group_age = 0 // The number of ticks since the group was created
	var/group_age_max = 25 // The maximum number of ticks the group is allowed to survive
	var/cell_type = null
	var/list/atom/movable/cell/cells = list()

/datum/ca_group/New(var/loc as turf, size = 0)
	..()

	if(loc && cell_type)
		new cell_type(loc, src)

	if(size)
		group_age_max = size

/datum/ca_group/Destroy()
	for(var/cell in cells)
		qdel(cell)

	..()

/datum/ca_group/proc/process()
	if(!cells.len)
		qdel(src)

	for(var/atom/movable/cell/cell in cells)
		cell.process()

	group_age++

/datum/ca_group/proc/shouldProcess()
	if(group_age_max && group_age >= group_age_max)
		return 0

	return 1
