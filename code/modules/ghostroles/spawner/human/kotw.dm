/* Sol Attack Team */
/datum/ghostspawner/human/sol_marine
	name = "Sol Marine"
	short_name = "sol_marine"
	desc = "Rank and file of the Solarian Armed Forces, with one mission: seize the Aurora by any means necessary."
	welcome_message = "You’re a Solarian Marine! You are part of the Solarian 35th Battlefleet, a rogue asset of the Sol Alliance which has recently decided to attack Tau Ceti and the Republic of Biesel which resides in it. The battle is ongoing, and you’re deep in hostile territory at the NSS Aurora. Whatever your goal might be, follow the leader and stick together to serve as an opposing force to the crew!"
	tags = list("External")
	mob_name_prefix = "PFC "

	enabled = FALSE
	spawnpoints = list("sol_marine")
	req_perms = null
	max_count = 2 // TODO: bump this to three with enough sec?
	uses_species_whitelist = FALSE

	outfit = /datum/outfit/admin/event/sol_marine
	possible_species = list(SPECIES_HUMAN)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY

	assigned_role = "Sol Marine"
	special_role = "Sol Marine"
	respawn_flag = null
	extra_languages = list(LANGUAGE_SOL_COMMON)

/datum/ghostspawner/human/sol_marine/heavy
	name = "Sol Marine Breacher"
	short_name = "sol_marine_ws"
	desc = "A combat hardsuit specialist assigned to the boarding team targeting the NSS Aurora."
	mob_name_prefix = "CPL "

	outfit = /datum/outfit/admin/event/sol_marine/heavy
	max_count = 1

/datum/ghostspawner/human/sol_marine/heavy/New()
	welcome_message += "<br/>[SPAN_BOLD("As a breacher and hardsuit specialist")], you are expected to act as bulwark and spearhead for your team, utilizing your durable hardsuit and wide array of heavy weapons options."


/datum/ghostspawner/human/sol_marine/leader
	name = "Sol Marine Sergeant"
	short_name = "sol_marine_ld"
	desc = "A highly trained and disciplined fireteam leader within the Solarian Armed Forces."
	mob_name_prefix = "SGT "

	outfit = /datum/outfit/admin/event/sol_marine/leader //TODO: LEADER OUTFIT
	max_count = 1

/datum/ghostspawner/human/sol_marine/leader/New()
	welcome_message += "<br/>[SPAN_BOLD("As a sergeant")], you are expected to lead your fireteam through the completion of your mission. Tactical plans are left to your discretion, \
	but it is highly advised that you eliminate all hostile corporate security personnel, and disable outbound communications before reinforcements arrive."

/* Refugees */
/datum/ghostspawner/human/refugee
	name = "Solarian Refugee"
	short_name = "sol_refugee"
	desc = "A refugee fleeing Solarian space, seeking refuge in Republic territory."
	welcome_message = "You’re a Solarian refugee! The chaos surrounding the Republic of Biesel’s borders has affected your home and livelihood, and for whatever reason you’ve taken it upon yourself to enter Tau Ceti fleeing the upset star-nation. You’re arriving at the NSS Aurora alongside an indeterminate count of other refugees seeking safe haven. Do whatever it takes to survive amidst a land of people who don’t trust you!"
	tags = list("External")

	enabled = FALSE
	spawnpoints = list("Pitstop")
	req_perms = null
	max_count = 10
	uses_species_whitelist = FALSE

	outfit = /datum/outfit/admin/event/sol_refugee
	possible_species = list(SPECIES_HUMAN)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY

	assigned_role = "Refugee"
	special_role = "Refugee"
	respawn_flag = null
	extra_languages = list(LANGUAGE_SOL_COMMON)

/datum/ghostspawner/human/refugee/infiltrator
	name = "Solarian Infiltrator"
	short_name = "sol_infiltrator"
	desc = "A member of Alliance Strategic Intelligence, acting in deep cover posing as a fleeing Solarian refugee."
	welcome_message = "You are an Alliance intelligence officer loyal to Grand Admiral Ozdemir, posing as a Solarian refugee. Your principal objective is the collection \
	of any information that can assist the Grand Admiral's invasion plans and deliver a decisive blow to NanoTrasen. The utmost care must be taken to \
	prevent your discovery aboard the station."
	max_count = 2
	// outfit = /datum/outfit/admin/event/sol_refugee/infiltrator

/* Wounded / Escape Pods */

/datum/ghostspawner/human/rescuepodsurv/crewpod
	short_name = "crewpod"
	max_count = 0

/datum/ghostspawner/human/rescuepodsurv/crewpod/sol
	short_name = "solescape"
	name = "Solarian Crew Survivor"
	desc = "Formerly a crew member of a Solarian attack ship, now the lucky occupant of an escape pod heading towards the Aurora."

	possible_species = list(SPECIES_HUMAN)
	outfit = /datum/outfit/admin/pod/sol_navy
	max_count = 2

	// TODO: Ship name + role generation?

/datum/ghostspawner/human/rescuepodsurv/crewpod/sol/New()
	welcome_message = "[SPAN_BOLD("You're a stranded Solarian crew member!")] <br>\
	Your ship was heavily damaged by Biesellite vessels, and due to luck or cowardice you managed to board an escape pod before things got worse. \
	Unfortunately for you, you've landed on a NanoTrasen installation - laying low or finding allies to get off this rock are your best hopes at a life outside of prison."
/datum/ghostspawner/human/rescuepodsurv/crewpod/nt
	short_name = "ntescape"
	name = "NanoTrasen Crew Survivor"
	desc = "One of the few surviving members of a now-destroyed NanoTrasen vessel, hurtling toward the Aurora in an escape pod."

	outfit = /datum/outfit/admin/pod/nt_navy
	max_count = 2

/datum/ghostspawner/human/rescuepodsurv/crewpod/nt/New()
	welcome_message = "[SPAN_BOLD("You're a stranded NanoTrasen crew member!")] <br>\
	Your ship was heavily damaged by Solarian vessels, and in a fit of cowardice or necessity, you boarded an escape pod and launched yourself \
	toward the NSS Aurora before things got worse. You're among allies here, so long as they don't realize you ran from a fight that's now put them in grave danger."
