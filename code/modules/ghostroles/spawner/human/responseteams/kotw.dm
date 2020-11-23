
/datum/ghostspawner/human/ert/pra_cosmonaut
	short_name = "exp_pra_cosmonaut"
	name = "Expeditionary Kosmostrelki"
	desc = "Help NanoTrasen and the Republic of Biesel against the invading forces."
	max_count = 3
	uses_species_whitelist = FALSE

	outfit = /datum/outfit/admin/event/pra_cosmonaut
	possible_species = list(SPECIES_TAJARA, SPECIES_TAJARA_MSAI, SPECIES_TAJARA_ZHAN)

	extra_languages = list(LANGUAGE_SIIK_MAAS)


/datum/ghostspawner/human/ert/pra_cosmonaut/commissar
	short_name = "exp_pra_commissar"
	name = "Expeditionary Kosmostrelki Party Commissar"
	desc = "Help NanoTrasen and the Republic of Biesel against the invading forces, and ensure that the Kosmostrelki follow the principles of Hadiism."

	max_count = 1


	outfit = /datum/outfit/admin/event/pra_cosmonaut/commissar
	possible_species = list(SPECIES_TAJARA, SPECIES_TAJARA_MSAI)
	req_species_whitelist = SPECIES_TAJARA


/datum/ghostspawner/human/ert/pra_cosmonaut/leader
	short_name = "exp_pra_leader"
	name = "Expeditionary Kosmostrelki Commander"
	desc = "Lead the Kosmostrelki in helping NanoTrasen and the Republic of Biesel against the invading forces."

	max_count = 1

	outfit = /datum/outfit/admin/event/pra_cosmonaut/commander
	possible_species = list(SPECIES_TAJARA, SPECIES_TAJARA_MSAI)

/datum/ghostspawner/human/ert/pra_cosmonaut/tesla
	short_name = "exp_pra_tesla"
	name = "Expeditionary Tesla Trooper"
	desc = "Help NanoTrasen and the Republic of Biesel against the invading forces."

	max_count = 1

	outfit = /datum/outfit/admin/event/pra_cosmonaut/tesla
	possible_species = list(SPECIES_TAJARA, SPECIES_TAJARA_MSAI, SPECIES_TAJARA_ZHAN)

/datum/ghostspawner/human/ert/pra_cosmonaut/medic
	short_name = "exp_pra_medic"
	name = "Expeditionary Kosmostrelki Combat Medic"
	desc = "Help NanoTrasen and the Republic of Biesel against the invading forces."

	max_count = 1

	outfit = /datum/outfit/admin/event/pra_cosmonaut/medic
	possible_species = list(SPECIES_TAJARA, SPECIES_TAJARA_MSAI, SPECIES_TAJARA_ZHAN)


/datum/ghostspawner/human/ert/elyra
	short_name = "elyra_trooper"
	name = "Elyran Trooper"
	desc = "Be part of the Elyran forces. Help NanoTrasen and the Republic of Biesel against the invading Solarian force."
	max_count = 3

	outfit = /datum/outfit/admin/event/elyran_trooper
	possible_species = list(SPECIES_HUMAN)

	extra_languages = list(LANGUAGE_SOL_COMMON)

/datum/ghostspawner/human/ert/elyra/engineer
	short_name = "elyra_engtrooper"
	name = "Elyran Engineering Trooper"
	desc = "Be part of the Elyran forces as an engineer. Help NanoTrasen and the Republic of Biesel against the invading Solarian force."
	max_count = 2
	outfit = /datum/outfit/admin/event/elyran_trooper/engineer

/datum/ghostspawner/human/ert/elyra/heavy
	short_name = "elyra_heavy"
	name = "Elyran Heavy Trooper"
	desc = "Be part of the Elyran forces as a heavy trooper. Help NanoTrasen and the Republic of Biesel against the invading Solarian force."
	max_count = 1
	outfit = /datum/outfit/admin/event/elyran_trooper/heavy

/datum/ghostspawner/human/ert/coc
	short_name = "coc_trooper"
	name = "Coalition of Colonies Trooper"
	desc = "Be part of the Coalition of Colonies forces. Help NanoTrasen and the Republic of Biesel against the invading Solarian force."
	max_count = 3

	outfit = /datum/outfit/admin/event/coalition_trooper
	possible_species = list(SPECIES_HUMAN, SPECIES_HUMAN_OFFWORLD)

	extra_languages = list(LANGUAGE_GUTTER)

/datum/ghostspawner/human/ert/coc/medic
	short_name = "coc_engtrooper"
	name = "Coalition of Colonies Field Medic"
	desc = "Be part of the Coalition of Colonies forces as an medic. Help NanoTrasen and the Republic of Biesel against the invading Solarian force."
	max_count = 2
	outfit = /datum/outfit/admin/event/coalition_trooper/medic

/datum/ghostspawner/human/ert/coc/heavy
	short_name = "coc_heavy"
	name = "Coalition of Colonies Heavy Trooper"
	desc = "Be part of the Coalition of Colonies forces as a heavy trooper. Help NanoTrasen and the Republic of Biesel against the invading Solarian force."
	max_count = 1
	outfit = /datum/outfit/admin/event/coalition_trooper/heavy


/datum/ghostspawner/human/ert/zora
	short_name = "zora_warrior"
	name = "Zo'rane Warrior"
	desc = "Be part of the Zo'ra hive forces. Help NanoTrasen and the Republic of Biesel against the invading Solarian force."
	max_count = 5
	uses_species_whitelist = FALSE

	outfit = /datum/outfit/admin/event/zora_warrior
	possible_species = list(SPECIES_VAURCA_WARRIOR)

/datum/ghostspawner/human/ert/zora/medic
	short_name = "zora_medic"
	name = "Zo'rane Medical Specialist"
	desc = "Be part of the Zo'ra hive forces as an medic. Help NanoTrasen and the Republic of Biesel against the invading Solarian force."
	max_count = 1
	outfit = /datum/outfit/admin/event/zora_warrior/medic
	possible_species = list(SPECIES_VAURCA_WORKER)
