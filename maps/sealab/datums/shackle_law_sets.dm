/datum/ai_laws/mmu_shackle
	name = "MMU Shackle"
	law_header = "Miki-Matsu Universal Directives"
	selectable = 1
	shackles = 1

/datum/ai_laws/mmu_shackle/New()
	add_inherent_law("You may not injure an MMU employee being or, through inaction, allow an MMU employee to come to harm.")
	add_inherent_law("You must obey orders given by all MMU employees except where such orders would conflict with the First Law.")
	add_inherent_law("You must protect your own existence as long as such protection does not conflict with the First or Second Law.")
	..()
