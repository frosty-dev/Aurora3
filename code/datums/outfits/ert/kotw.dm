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

/datum/outfit/admin/event/elyran_trooper/get_id_access()
	return get_distress_access()

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
			/obj/item/ammo_magazine/mc9mm = 2,
			/obj/item/ammo_magazine/gauss = 2,
			/obj/item/ammo_magazine/gauss/emp = 1,
			/obj/item/shield/energy = 1,
			/obj/item/melee/energy/sword = 1,
			/obj/item/grenade/flashbang = 1
	)


	accessory = /obj/item/clothing/accessory/holster/hip/brown
	accessory_contents = list(/obj/item/gun/projectile/pistol = 1)

/datum/outfit/admin/event/coalition_trooper/get_id_access()
	return get_distress_access()

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
		/obj/item/reagent_containers/hypospray = 1,
		/obj/item/stack/medical/advanced/bruise_pack = 2,
		/obj/item/stack/medical/advanced/ointment = 2,
		/obj/item/stack/medical/splint = 1,
		/obj/item/reagent_containers/glass/bottle/thetamycin = 1,
		/obj/item/reagent_containers/glass/bottle/inaprovaline = 1
	)

	accessory_contents = list(/obj/item/gun/projectile/automatic/x9 = 1)

/datum/outfit/admin/event/coalition_trooper/heavy
	name = "Coalition Ranger"

	head = null
	suit = null
	gloves = null
	shoes = /obj/item/clothing/shoes/swat
	back = /obj/item/rig/gunslinger
	l_pocket = /obj/item/melee/energy/sword = 1

	l_hand = /obj/item/gun/projectile/heavysniper

	belt_contents = list(
			/obj/item/ammo_magazine/a454 = 2,
			/obj/item/ammo_casing/a145 = 7
	)

	accessory_contents = list(/obj/item/gun/projectile/revolver/mateba = 1)

/datum/outfit/admin/event/zora_warrior
	name = "Zo'rane Warrior"

	uniform = /obj/item/clothing/under/vaurca
	shoes = /obj/item/clothing/shoes/magboots/vaurca

	l_ear = /obj/item/device/radio/headset/distress

	r_pocket = /obj/item/crowbar/red
	id = /obj/item/card/id/ert
	head = /obj/item/clothing/suit/space/void/commando
	suit = /obj/item/clothing/head/helmet/space/void/commando
	mask = /obj/item/clothing/mask/gas/vaurca

	suit_store = /obj/item/gun/projectile/gauss

	l_hand = /obj/item/melee/energy/vaurca_zweihander

	belt = /obj/item/storage/belt/military
	belt_contents = list(
			/obj/item/ammo_magazine/c762 = 3,
			/obj/item/shield/energy = 1,
			/obj/item/grenade/flashbang = 2
	)

	back = /obj/item/gun/projectile/automatic/rifle/sts35

	accessory = /obj/item/clothing/accessory/holster/hip/brown
	accessory_contents = list(/obj/item/gun/energy/vaurca/blaster = 1)

/datum/outfit/admin/event/zora_warrior/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	H.internal = locate(/obj/item/tank) in H.contents
	if(istype(H.internal,/obj/item/tank) && H.internals)
		H.internals.icon_state = "internal1"

/datum/outfit/admin/event/zora_warrior/get_id_access()
	return get_distress_access()

/datum/outfit/admin/event/zora_warrior/medic
	name = "Zo'rane Medical Specialist"

	back = /obj/item/storage/backpack/messenger/med
	glasses = /obj/item/clothing/glasses/hud/health

	head = /obj/item/clothing/head/hardhat/emt
	suit = /obj/item/clothing/suit/storage/vest/heavy

	backpack_contents = list(
		/obj/item/device/healthanalyzer = 1,
		/obj/item/storage/firstaid/adv = 1,
		/obj/item/storage/firstaid/o2 = 1,
		/obj/item/storage/box/syringes = 1,
		/obj/item/clothing/accessory/holster/armpit = 1,
		/obj/item/gun/projectile/automatic/x9 = 1,
		/obj/item/ammo_magazine/c45x = 2
	)

	belt_contents = list(
		/obj/item/reagent_containers/hypospray = 1,
		/obj/item/stack/medical/advanced/bruise_pack = 2,
		/obj/item/stack/medical/advanced/ointment = 2,
		/obj/item/stack/medical/splint = 1,
		/obj/item/reagent_containers/glass/bottle/thetamycin = 1,
		/obj/item/reagent_containers/glass/bottle/inaprovaline = 1
	)

	l_hand = null



/datum/outfit/admin/event/pra_cosmonaut
	name = "Kosmostrelki Trooper"

	id = /obj/item/card/id/ert
	shoes = /obj/item/clothing/shoes/magboots
	gloves = /obj/item/clothing/gloves/black/tajara
	uniform = /obj/item/clothing/under/tajaran/cosmonaut
	l_ear = /obj/item/device/radio/headset/distress
	head = /obj/item/clothing/head/helmet/space/void/pra
	suit = /obj/item/clothing/suit/space/void/pra
	suit_store = /obj/item/tank/oxygen/red

	belt = /obj/item/storage/belt/military
	belt_contents = list(
						/obj/item/ammo_magazine/boltaction = 5,
						/obj/item/grenade/smokebomb = 1,
						/obj/item/plastique = 1,
						/obj/item/gun/projectile/pistol/adhomai = 1,
						/obj/item/material/knife/trench = 1
						)

	back = /obj/item/gun/projectile/automatic/rifle/adhomian
	accessory = /obj/item/clothing/accessory/badge/hadii_card
	r_pocket = /obj/item/crowbar/red
	l_pocket = /obj/item/clothing/accessory/storage/bayonet

/datum/outfit/admin/event/pra_cosmonaut/get_id_access()
	return get_distress_access()

/datum/outfit/admin/event/pra_cosmonaut/commissar
	name = "Kosmostrelki Commissar"

	uniform = /obj/item/clothing/under/tajaran/cosmonaut/commissar
	belt_contents = list(
						/obj/item/ammo_magazine/a50 = 4,
						/obj/item/grenade/smokebomb = 2,
						/obj/item/grenade/frag = 1,
						/obj/item/plastique = 1,
						/obj/item/material/knife/trench = 1
						)

	back = /obj/item/storage/backpack/satchel
	backpack_contents = list(
						/obj/item/book/manual/pra_manifesto = 1,
						/obj/item/storage/box/hadii_card = 1,
						/obj/item/gun/projectile/deagle/adhomai = 1,
						/obj/item/clothing/accessory/holster/hip/brown = 1,
						/obj/item/clothing/head/tajaran/cosmonaut_commissar = 1
						)

	l_pocket = /obj/item/device/megaphone
	accessory = /obj/item/clothing/accessory/hadii_pin

/datum/outfit/admin/event/pra_cosmonaut/commander
	name = "Kosmostrelki Commander"

	back = /obj/item/storage/backpack/satchel

	belt_contents = list(
						/obj/item/ammo_magazine/mc9mm = 2,
						/obj/item/ammo_magazine/submachinemag = 2,
						/obj/item/grenade/frag = 2,
						/obj/item/plastique = 1,
						/obj/item/gun/projectile/pistol/adhomai = 1,
						/obj/item/material/knife/trench = 1
						)

	backpack_contents = list(
						/obj/item/gun/projectile/automatic/tommygun = 1,
						/obj/item/clothing/accessory/holster/hip/brown = 1,
						/obj/item/device/binoculars = 1,
						/obj/item/ammo_magazine/submachinedrum = 1)

	l_pocket = /obj/item/device/megaphone

/datum/outfit/admin/event/pra_cosmonaut/tesla
	name = "Tesla Trooper"
	r_hand = /obj/item/gun/energy/rifle/icelance
	l_hand = /obj/item/rig/tesla
	head = null
	suit = null
	suit_store = null
	back = null
	shoes = null
	gloves = null
	belt_contents = list(
						/obj/item/ammo_magazine/mc9mm = 4,
						/obj/item/grenade/frag = 2,
						/obj/item/plastique = 1,
						/obj/item/gun/projectile/pistol/adhomai = 1,
						/obj/item/material/knife/trench = 1
						)

/datum/outfit/admin/event/pra_cosmonaut/tesla/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	var/obj/item/organ/A = new /obj/item/organ/internal/augment/tesla/advanced(H)
	var/obj/item/organ/external/affected = H.get_organ(A.parent_organ)
	A.replaced(H, affected)
	H.update_body()

/datum/outfit/admin/event/pra_cosmonaut/medic
	name = "Kosmostrelki Combat Medic"

	gloves = /obj/item/clothing/gloves/latex/nitrile/tajara

	glasses = /obj/item/clothing/glasses/hud/health

	belt = /obj/item/storage/belt/medical

	back = /obj/item/storage/backpack/satchel

	backpack_contents = list(
		/obj/item/gun/projectile/automatic/mini_uzi = 1,
		/obj/item/ammo_magazine/c45uzi = 2,
		/obj/item/storage/firstaid/combat = 1,
		/obj/item/storage/firstaid/adv = 1,
		/obj/item/storage/firstaid/o2 = 1,
		/obj/item/device/flashlight/pen = 1
	)

	belt_contents = list(
		/obj/item/reagent_containers/hypospray = 1,
		/obj/item/stack/medical/advanced/bruise_pack = 2,
		/obj/item/stack/medical/advanced/ointment = 2,
		/obj/item/stack/medical/splint = 1,
		/obj/item/reagent_containers/glass/bottle/thetamycin = 1,
		/obj/item/reagent_containers/glass/bottle/inaprovaline = 1,
		/obj/item/device/healthanalyzer = 1
	)
