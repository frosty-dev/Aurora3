
/datum/ghostspawner/human/pra_cosmonaut
	short_name = "pra_cosmonaut"
	name = "Kosmostrelki"
	desc = "Protect the People's Republic of Adhomai's possessions on space."
	tags = list("External")

	enabled = FALSE
	spawnpoints = list("pra_cosmonaut")
	req_perms = null
	max_count = 3
	uses_species_whitelist = FALSE

	outfit = /datum/outfit/admin/pra_cosmonaut
	possible_species = list(SPECIES_TAJARA, SPECIES_TAJARA_MSAI, SPECIES_TAJARA_ZHAN)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY

	assigned_role = "Kosmostrelki"
	special_role = "Kosmostrelki"
	respawn_flag = null
	extra_languages = list(LANGUAGE_SIIK_MAAS)
	uses_species_whitelist = FALSE
	away_site = TRUE

/datum/ghostspawner/human/pra_cosmonaut/commissar
	short_name = "pra_commissar"
	name = "Kosmostrelki Party Commissar"
	desc = "Protect the People's Republic of Adhomai's possessions on space, and ensure that the Kosmostrelki follow the principles of Hadiism."

	max_count = 1

	assigned_role = "Party Commissar"
	special_role = "Party Commissar"

	outfit = /datum/outfit/admin/pra_cosmonaut/commissar
	possible_species = list(SPECIES_TAJARA, SPECIES_TAJARA_MSAI)
	req_species_whitelist = SPECIES_TAJARA

/datum/outfit/admin/pra_cosmonaut
	name = "Kosmostrelki"

	uniform = /obj/item/clothing/under/tajaran/cosmonaut
	shoes = /obj/item/clothing/shoes/jackboots/toeless
	belt = /obj/item/storage/belt/military
	back = /obj/item/gun/projectile/automatic/rifle/adhomian
	id = /obj/item/card/id/syndicate
	accessory = /obj/item/clothing/accessory/badge/hadii_card
	belt_contents = list(
						/obj/item/ammo_magazine/boltaction = 3,
						/obj/item/grenade/smokebomb = 2,
						/obj/item/plastique = 1,
						/obj/item/gun/projectile/pistol/adhomai = 1
						)
	r_hand = /obj/item/storage/field_ration

/datum/outfit/admin/pra_cosmonaut/commissar
	name = "Party Commissar"

	uniform = /obj/item/clothing/under/tajaran/cosmonaut/commissar
	head = /obj/item/clothing/head/tajaran/cosmonaut_commissar
	accessory = /obj/item/clothing/accessory/hadii_pin
	belt = /obj/item/gun/projectile/deagle/adhomai
	belt_contents = null
	back = /obj/item/storage/backpack/satchel
	backpack_contents = list(
						/obj/item/ammo_magazine/a50 = 2,
						/obj/item/material/knife/trench = 1,
						/obj/item/storage/box/hadii_manifesto = 1,
						/obj/item/storage/box/hadii_card = 1
						)
	l_hand = /obj/item/device/megaphone
	r_hand = null



/datum/outfit/admin/pra_cosmonaut/ert
	name = "Kosmostrelki"
	r_hand = null
	l_ear = /obj/item/device/radio/headset/distress
	head = /obj/item/clothing/head/helmet/space/void/pra
	suit = /obj/item/clothing/suit/space/void/pra
	suit_store = /obj/item/tank/oxygen/red
	belt_contents = list(
						/obj/item/ammo_magazine/boltaction = 5,
						/obj/item/grenade/smokebomb = 2,
						/obj/item/plastique = 1,
						/obj/item/gun/projectile/pistol/adhomai = 1
						)

/datum/outfit/admin/pra_cosmonaut/ert/get_id_access()
	return get_distress_access()

/datum/outfit/admin/pra_cosmonaut/ert/commissar
	l_ear = /obj/item/device/radio/headset/distress
	head = /obj/item/clothing/head/helmet/space/void/pra
	suit = /obj/item/clothing/suit/space/void/pra

	backpack_contents = list(
						/obj/item/ammo_magazine/a50 = 2,
						/obj/item/material/knife/trench = 1,
						/obj/item/book/manual/pra_manifesto = 1,
						/obj/item/storage/box/hadii_card = 1,
						/obj/item/clothing/head/tajaran/cosmonaut_commissar = 1,
						/obj/item/clothing/accessory/holster/hip/brown = 1
						)
	suit_store = /obj/item/tank/oxygen/red

/datum/outfit/admin/pra_cosmonaut/ert/commander
	name = "Kosmostrelki Commander"
	r_hand = null
	l_ear = /obj/item/device/radio/headset/distress
	head = /obj/item/clothing/head/helmet/space/void/pra
	suit = /obj/item/clothing/suit/space/void/pra

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
						/obj/item/clothing/accessory/holster/hip/brown = 1,
						/obj/item/device/binoculars = 1,
						/obj/item/ammo_magazine/submachinedrum = 1)

	r_hand = /obj/item/gun/projectile/automatic/tommygun

/datum/outfit/admin/pra_cosmonaut/ert/tesla
	name = "Tesla Trooper"
	r_hand = /obj/item/gun/energy/rifle/icelance
	l_hand = /obj/item/rig/tesla
	l_ear = /obj/item/device/radio/headset/distress
	head = null
	suit = null
	suit_store = null
	back = null
	belt_contents = list(
						/obj/item/ammo_magazine/mc9mm = 4,
						/obj/item/grenade/frag = 2,
						/obj/item/plastique = 1,
						/obj/item/gun/projectile/pistol/adhomai = 1,
						/obj/item/material/knife/trench = 1
						)

/datum/outfit/admin/pra_cosmonaut/ert/tesla/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	var/obj/item/organ/A = new /obj/item/organ/internal/augment/tesla/advanced(H)
	var/obj/item/organ/external/affected = H.get_organ(A.parent_organ)
	A.replaced(H, affected)
	H.update_body()

/datum/outfit/admin/pra_cosmonaut/ert/medic
	name = "Kosmostrelki Combat Medic"
	r_hand = null
	l_hand = null

	glasses = /obj/item/clothing/glasses/hud/health

	belt = /obj/item/storage/belt/medical

	back = /obj/item/storage/backpack/satchel

	backpack_contents = list(
		/obj/item/gun/projectile/automatic/mini_uzi = 1,
		/obj/item/ammo_magazine/c45uzi = 2,
		/obj/item/storage/firstaid/combat = 1,
		/obj/item/storage/firstaid/adv = 1
	)

	belt_contents = list(
		/obj/item/reagent_containers/hypospray = 1,
		/obj/item/stack/medical/advanced/bruise_pack = 1,
		/obj/item/stack/medical/advanced/ointment = 1,
		/obj/item/reagent_containers/glass/bottle/thetamycin = 1
	)
