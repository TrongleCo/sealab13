// The following is a list of defs to be used for the Sealab loadout.

// For members of the command department
#define EXECUTIVE_ROLES /datum/job/executive/administrator, /datum/job/executive/hop, /datum/job/research/head, /datum/job/engineering/head, /datum/job/security/head, /datum/job/medical/head

// For members of the research department and jobs that are scientific
#define RESEARCH_ROLES /datum/job/research/head, /datum/job/research/senior, /datum/job/research/scientist, /datum/job/research/intern

// For members of the engineering department
#define ENGINEERING_ROLES /datum/job/engineering/head, /datum/job/engineering/senior, /datum/job/engineering/engineer, /datum/job/engineering/intern

// For members of the security department
#define SECURITY_ROLES /datum/job/security/head, /datum/job/security/guard, /datum/job/security/detective, /datum/job/security/intern

// For members of the medical department
#define MEDICAL_ROLES /datum/job/medical/head, /datum/job/medical/senior, /datum/job/medical/doctor, /datum/job/medical/intern

// For members of the supply department
#define SUPPLY_ROLES /datum/job/supply/qm, /datum/job/supply/cargo_tech

// For members of the service department
#define SERVICE_ROLES /datum/job/service/janitor, /datum/job/service/chef, /datum/job/service/bartender, /datum/job/service/intern

// All the roles available
#define ALL_ROLES EXECUTIVE_ROLES, RESEARCH_ROLES, ENGINEERING_ROLES, SECURITY_ROLES, MEDICAL_ROLES, SUPPLY_ROLES, SERVICE_ROLES

// For roles with no uniform or formal clothing requirements
#define INFORMAL_ROLES /datum/job/service/intern, /datum/job/service/bartender

// For civilian jobs that may have a uniform, but not a strict one
#define SEMIFORMAL_ROLES INFORMAL_ROLES, RESEARCH_ROLES, /datum/job/security/detective

// For jobs that allow for decorative or ceremonial clothing
#define FORMAL_ROLES SEMIFORMAL_ROLES, /datum/job/security/guard

// For members of the medical department, roboticists, and some Research
#define STERILE_ROLES MEDICAL_ROLES, RESEARCH_ROLES

// For members of Engineering, Cargo, and Research
#define TECHNICAL_ROLES ENGINEERING_ROLES, RESEARCH_ROLES, SUPPLY_ROLES

// For jobs that make food, yum
#define FOOD_ROLES /datum/job/service/bartender, /datum/job/service/chef

// For jobs that spawn with weapons in their lockers
#define ARMED_ROLES SECURITY_ROLES, /datum/job/captain, /datum/job/executive/hop

// For jobs that spawn with armor in their lockers
#define ARMORED_ROLES SECURITY_ROLES, /datum/job/captain, /datum/job/executive/hop

// Selectable corporate faction
#define CORPORATION_FACTION /datum/faction/corporation/mmu
