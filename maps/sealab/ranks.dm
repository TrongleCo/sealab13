// Not used at the moment

/datum/job/submap
	branch = /datum/faction/corporation/mmu
	rank =   /datum/job_rank/corporate/intern

/datum/map/sealab
	branch_types = list(
		/datum/faction/corporation/mmu
	)

	spawn_branch_types = list(
		/datum/faction/corporation/mmu
	)

	// haha xeno scum
	species_to_branch_whitelist = list()
	species_to_rank_whitelist = list()


/*
 *  Factions
 *  ========
 */

/datum/faction/corporation/mmu
	name = "Miki-Matsu Universal"
	name_short = "MMU"
	email_domain = "mmu.net"

	rank_types = list(
		/datum/job_rank/corporate/executive,
		/datum/job_rank/corporate/employee,
		/datum/job_rank/corporate/intern
	)

	spawn_rank_types = list(
		/datum/job_rank/corporate/executive,
		/datum/job_rank/corporate/employee,
		/datum/job_rank/corporate/intern
	)

	assistant_job = "Intern"

/*
 *  Ranks
 *  ========
 */

/datum/job_rank/corporate/executive
	name = "Executive"
	name_short = null

/datum/job_rank/corporate/employee
	name = "Employee"

/datum/job_rank/corporate/intern
	name = "Intern"
