/datum/ghostspawner/human/sol_marine
	short_name = "sol_marine"
	name = "Sol Marine"
	desc = "Take part in the conflict, board the station."
	tags = list("External")

	enabled = FALSE
	spawnpoints = list("sol_marine")
	req_perms = null
	max_count = 3
	uses_species_whitelist = FALSE

	outfit = /datum/outfit/admin/event/sol_marine
	possible_species = list(SPECIES_HUMAN)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY

	assigned_role = "Sol Marine"
	special_role = "Sol Marine"
	respawn_flag = null
	extra_languages = list(LANGUAGE_SOL_COMMON)

