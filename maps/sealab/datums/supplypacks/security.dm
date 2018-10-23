/decl/hierarchy/supply_pack/security
	name = "Security"

/decl/hierarchy/supply_pack/security/secarmor
	name = "Armor"
	contains = list(/obj/item/clothing/suit/armor/vest/security = 2,
					/obj/item/clothing/head/helmet =2)
	cost = 20
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Security armor crate"
	access = access_security

/decl/hierarchy/supply_pack/security/pistol
	name = "Weapons - Ballistic sidearms"
	contains = list(/obj/item/weapon/gun/projectile/military = 4)
	cost = 40
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "\improper Ballistic sidearms crate"
	access = access_armory
	security_level = SUPPLY_SECURITY_ELEVATED

/decl/hierarchy/supply_pack/security/laser
	name = "Weapons - Laser carbines"
	contains = list(/obj/item/weapon/gun/energy/laser/secure = 4)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "\improper Laser carbines crate"
	access = access_emergency_armory
	security_level = SUPPLY_SECURITY_ELEVATED

/decl/hierarchy/supply_pack/security/laser/shady
	name = "Weapons - Laser carbines (For disposal)"
	contains = list(/obj/item/weapon/gun/energy/laser = 4)
	cost = 80
	contraband = 1
	security_level = null

/decl/hierarchy/supply_pack/security/advancedlaser
	name = "Weapons - Advanced Laser Weapons"
	contains = list(/obj/item/weapon/gun/energy/xray = 2,
					/obj/item/weapon/gun/energy/xray/pistol = 2,
					/obj/item/weapon/shield/energy = 2)
	cost = 100
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "\improper Advanced Laser Weapons crate"
	access = access_emergency_armory
	security_level = SUPPLY_SECURITY_HIGH

/decl/hierarchy/supply_pack/security/sniperlaser
	name = "Weapons - Energy marksman"
	contains = list(/obj/item/weapon/gun/energy/sniperrifle = 2)
	cost = 70
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "\improper Energy marksman crate"
	access = access_emergency_armory
	security_level = SUPPLY_SECURITY_HIGH

/decl/hierarchy/supply_pack/security/pdw
	name = "Weapons - Ballistic PDWs"
	contains = list(/obj/item/weapon/gun/projectile/automatic/wt550 = 2)
	cost = 40
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "\improper Ballistic PDW crate"
	access = access_emergency_armory
	security_level = SUPPLY_SECURITY_HIGH

/decl/hierarchy/supply_pack/security/bullpup
	name = "Weapons - Ballistic rifles"
	contains = list(/obj/item/weapon/gun/projectile/automatic/z8 = 2)
	cost = 80 //Because 5.56 is OP as fuck right now.
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "\improper Bullpup automatic rifle crate"
	access = access_emergency_armory
	security_level = SUPPLY_SECURITY_HIGH

/decl/hierarchy/supply_pack/security/pistolammo
	name = "Ammunition - .45 magazines"
	contains = list(/obj/item/ammo_magazine/c45mds = 4)
	cost = 30
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "\improper .45 ammunition crate"
	access = access_security
	security_level = SUPPLY_SECURITY_ELEVATED

/decl/hierarchy/supply_pack/security/pistolammorubber
	name = "Ammunition - .45 rubber"
	contains = list(/obj/item/ammo_magazine/c45mds/rubber = 4)
	cost = 20
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "\improper .45 rubber ammunition crate"
	access = access_security

/decl/hierarchy/supply_pack/security/pistolammopractice
	name = "Ammunition - .45 practice"
	contains = list(/obj/item/ammo_magazine/c45mds/practice = 8)
	cost = 20
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "\improper .45 practice ammunition crate"
	access = access_security

/decl/hierarchy/supply_pack/security/holster
	name = "Gear - Holster crate"
	contains = list(/obj/item/clothing/accessory/storage/holster/hip = 4)
	cost = 20
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Holster crate"
	access = access_solgov_crew

/decl/hierarchy/supply_pack/security/securityextragear
	name = "Gear - Security equipment"
	contains = list(/obj/item/weapon/storage/belt/holster/security = 2,
					/obj/item/device/radio/headset/headset_sec = 2,
					/obj/item/clothing/glasses/sunglasses/sechud/goggles = 2,
					/obj/item/taperoll/police = 2,
					/obj/item/device/hailer = 2,
					/obj/item/clothing/gloves/thick = 2,
					/obj/item/device/holowarrant = 2,
					/obj/item/device/flashlight/maglight = 2)
	cost = 60
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Security equipment crate"
	access = access_security

/decl/hierarchy/supply_pack/security/cosextragear
	name = "Gear - Head of Security equipment"
	contains = list(/obj/item/device/radio/headset/heads/hos,
					/obj/item/clothing/glasses/sunglasses/sechud/goggles,
					/obj/item/taperoll/police,
					/obj/item/weapon/storage/belt/holster/security,
					/obj/item/device/hailer,
					/obj/item/device/holowarrant,
					/obj/item/clothing/gloves/thick,
					/obj/item/device/flashlight/maglight,)
	cost = 40
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Head of Security equipment crate"
	access = access_hos

/decl/hierarchy/supply_pack/security/practicelasers
	name = "Misc - Practice Laser Carbines"
	contains = list(/obj/item/weapon/gun/energy/laser/practice = 4)
	cost = 20
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Practice laser carbine crate"
	access = access_solgov_crew

/decl/hierarchy/supply_pack/security/magnum_ammo
	name = "Ammo - .44 Magnum"
	contains = list(/obj/item/ammo_magazine/c44 = 4)
	cost = 30
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "\improper .44 magnum ammunition crate"
	access = access_heads
	security_level = SUPPLY_SECURITY_ELEVATED