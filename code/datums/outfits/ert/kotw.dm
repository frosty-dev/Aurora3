/datum/outfit/admin/event/elyran_trooper
	name = "Elyran Trooper"

	uniform = /obj/item/clothing/under/syndicate/combat
	shoes = /obj/item/clothing/shoes/magboots
	gloves = /obj/item/clothing/gloves/combat
	l_ear = /obj/item/device/radio/headset/distress
	l_pocket = /obj/item/tank/emergency_oxygen/double
	r_pocket = /obj/item/crowbar/red
	id = /obj/item/card/id/ert
	head = /obj/item/clothing/head/helmet/space/void/valkyrie
	suit = /obj/item/clothing/suit/space/void/valkyrie
	mask = /obj/item/clothing/mask/gas
	back = /obj/item/tank/jetpack/carbondioxide
	suit_store = /obj/item/gun/projectile/plasma/bolter

	belt = /obj/item/storage/belt/military
	belt_contents = list(
			/obj/item/ammo_magazine/plasma/light = 3,
			/obj/item/ammo_magazine/c45m = 2,
			/obj/item/shield/energy = 1,
			/obj/item/melee/energy/sword = 1,
			/obj/item/grenade/frag = 1,
			/obj/item/grenade/flashbang = 1
	)


	accessory = /obj/item/clothing/accessory/holster/hip/brown
	accessory_contents = list(/obj/item/gun/projectile/sec/lethal = 1)

/datum/outfit/admin/event/elyran_trooper/engineer
	name = "Elyran Engineering Trooper"

	back = /obj/item/storage/backpack/satchel_norm
	belt = /obj/item/storage/belt/utility/full
	r_pocket = /obj/item/plastique

	backpack_contents = list(
		/obj/item/tank/oxygen = 1,
		/obj/item/clothing/gloves/yellow = 1,
		/obj/item/material/knife/trench = 1
	)

/datum/outfit/admin/event/elyran_trooper/heavy
	name = "Elyran Heavy Trooper"

	head = null
	suit = null
	gloves = null
	shoes = /obj/item/clothing/shoes/swat
	mask = /obj/item/clothing/mask/gas/tactical
	back = /obj/item/rig/elyran
	l_pocket = /obj/item/plastique
	r_pocket = /obj/item/crowbar/red
	belt_contents = list(
			/obj/item/ammo_magazine/plasma = 5,
			/obj/item/shield/energy = 1,
			/obj/item/melee/energy/sword = 1,
			/obj/item/grenade/frag = 2,
			/obj/item/grenade/flashbang = 2
	)

	l_hand = /obj/item/gun/projectile/plasma

	accessory = /obj/item/clothing/accessory/storage/black_vest
	accessory_contents = list(/obj/item/device/flash = 1, /obj/item/handcuffs = 2, /obj/item/gun/projectile/pistol = 1)

/datum/outfit/admin/event/coalition_trooper
	name = "Coalition Trooper"

	uniform = /obj/item/clothing/under/syndicate/combat
	shoes = /obj/item/clothing/shoes/magboots
	gloves = /obj/item/clothing/gloves/combat
	l_ear = /obj/item/device/radio/headset/distress
	l_pocket = /obj/item/tank/emergency_oxygen/double
	r_pocket = /obj/item/crowbar/red
	id = /obj/item/card/id/ert
	head = /obj/item/clothing/head/helmet/space/void/coalition
	suit = /obj/item/clothing/suit/space/void/coalition
	mask = /obj/item/clothing/mask/gas
	back = /obj/item/tank/jetpack/carbondioxide
	suit_store = /obj/item/gun/projectile/gauss

	belt = /obj/item/storage/belt/military
	belt_contents = list(
			/obj/item/ammo_magazine/a454 = 2,
			/obj/item/ammo_magazine/gauss = 2,
			/obj/item/ammo_magazine/gauss/emp = 1,
			/obj/item/shield/energy = 1,
			/obj/item/melee/energy/sword = 1,
			/obj/item/grenade/flashbang = 1
	)


	accessory = /obj/item/clothing/accessory/holster/hip/brown
	accessory_contents = list(/obj/item/gun/projectile/revolver/mateba = 1)

/datum/outfit/admin/event/coalition_trooper/medic
	name = "Coalition Field Medic"

	back = /obj/item/storage/backpack/messenger/med
	glasses = /obj/item/clothing/glasses/hud/health

	backpack_contents = list(
		/obj/item/storage/box/survival = 1,
		/obj/item/device/healthanalyzer = 1,
		/obj/item/storage/firstaid/adv = 1,
		/obj/item/storage/firstaid/o2 = 1,
		/obj/item/storage/box/syringes = 1,
		/obj/item/clothing/accessory/holster/armpit = 1,
		/obj/item/gun/projectile/automatic/x9 = 1,
		/obj/item/ammo_magazine/c45x = 2
	)

	belt_contents = list(
		/obj/item/stack/medical/advanced/bruise_pack = 2,
		/obj/item/stack/medical/advanced/ointment = 2,
		/obj/item/stack/medical/splint = 1,
		/obj/item/reagent_containers/syringe = 1,
		/obj/item/reagent_containers/glass/bottle/inaprovaline = 1
	)

/datum/outfit/admin/event/coalition_trooper/heavy
	name = "Coalition Ranger"

	head = null
	suit = null
	gloves = null
	shoes = /obj/item/clothing/shoes/swat
	back = /obj/item/rig/gunslinger
	l_pocket = null

	l_hand = /obj/item/gun/projectile/heavysniper

	belt_contents = list(
			/obj/item/ammo_magazine/a454 = 2,
			/obj/item/ammo_casing/a145 = 8,
			/obj/item/melee/energy/sword = 1
	)