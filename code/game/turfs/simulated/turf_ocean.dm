/turf/simulated/ocean
	name = "ocean floor"
	desc = "Rough rocky seabed"
	icon = 'icons/turf/ocean.dmi'
	icon_state = "rocky"
	density = FALSE
	opacity = FALSE
	flooded = TRUE

/turf/simulated/ocean/is_plating()
	return 1

/turf/simulated/ocean/New()
	. = ..()
	update_icon()

/turf/simulated/ocean/sand
	icon_state = "sand0"
	desc = "Silty seabed"
	color = COLOR_SAND

/turf/simulated/ocean/sand/update_icon(update_neighbors)
	. = ..(update_neighbors)
	icon_state = "sand[rand(0, 7)]"

/turf/simulated/ocean/abyss
	name = "abyssal silt"
	desc = "Unfathomably silty, its practically quicksand"
	icon_state = "mud_light"

/turf/simulated/ocean/open
	name = "open ocean"
	desc = ""
	icon_state = "still"
