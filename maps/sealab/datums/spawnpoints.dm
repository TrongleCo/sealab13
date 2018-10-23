/datum/spawnpoint/dormitory
	display_name = "Dormitory"
	msg = "just woke up in the dormitory"
	always_visible = TRUE

/datum/spawnpoint/dormitory/New()
	..()
	turfs = GLOB.latejoin
