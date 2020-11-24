/datum/event/sol_team
	no_fake = 1
	startWhen = 60
	announceWhen = -1
	endWhen = 180
	var/threat_type
	var/savior_type
	var/engaged = TRUE
	var/destroyed = TRUE
	var/list/spawner_names = list("sol_marine", "sol_marine_ws", "sol_marine_ld")
	var/spawned = FALSE

/datum/event/sol_team/setup()
	threat_type = pick(
		"Alliance frigate",
		"Alliance destroyer",
		"Alliance gunboat",
		"unidentified combat vessel")
	icarus_announcement.Announce(
		"N.S.S. Aurora, an [threat_type] has broken off from the fight and is on an intercept course with this sector. \
		We are maneuvering to intercept. Recommend mustering damage control parties and moving non-essential crew to safe parts of the station.", "Solarian Incursion Alert"
	)
	engaged = prob(66) ? TRUE : FALSE // probability that the frigate gets close enough that the Icarus must engage
	if (engaged)
		destroyed = prob(66) ? TRUE : FALSE // probability that the vessel is destroyed
	else
		announceWhen = 15

/datum/event/sol_team/announce()
	if(engaged)
		icarus_announcement.Announce(
			"The [threat_type] slipped through the picket line and is on a direct intercept course with the station. \
			Icarus drones are presently engaged with the threat, but the CIC is tracking inbound Solarian boarding parties. \
			The Icarus cannot offer support until the vessel is neutralized. Recommend moving to high alert and preparing for intruders.", "Solarian Incursion Update")
		if(security_level < SEC_LEVEL_RED)
			set_security_level(SEC_LEVEL_RED)
	else
		savior_type = prob(75) ? pick("NT", "TCFL") : pick("Coalition", "Elyran", "PRA", "Zo'rane", "Hegemony")
		icarus_announcement.Announce(
			"The [threat_type] was caught and successfully neutralized by supporting [savior_type] vessels. Judging by the incoming tactical data, they'll be in need of repair and resupply. \
			Forwarding their requests for assistance on to you.", "Solarian Incursion Update")
		fire_pitstop_event()
		kill()

/datum/event/sol_team/start()
	if(!engaged)
		return
	for(var/spawner in spawner_names)
		var/datum/ghostspawner/human/sol_marine/G = SSghostroles.get_spawner(spawner)
		if(istype(G))
			G.attached_event = src
			G.enable()

/datum/event/sol_team/gs_spawned()
	if(!spawned)
		spawned = TRUE
		announce()

/datum/event/sol_team/end()
	if(!engaged)
		return
	if(destroyed)
		icarus_announcement.Announce(
			"N.S.S. Aurora, the Icarus is fully committed with the enemy. CIC is tracking some debris and inbound ordinance heading toward the station. \
			Recommend your crew stay away from exterior access points and unshielded areas until the threat has passed. \
			If necessary, Icarus response teams are on standby to assist on-station security in maintaining control of the station. NDV Icarus, out.", "Solarian Incursion Update"
		)
		fire_bombardment_event(66)
		if(prob(66))
			fire_escape_pods("crewman/sol")
	else
		icarus_announcement.Announce(
			"N.S.S. Aurora, the Icarus is being forced off the field by the enemy contact. CIC is tracking several inbound projectiles toward the station, and we're in no position to intercept. \
			Recommend you brace for impact and activate damage control parties immediately. The Icarus will be unable to provide support for some time. Godspeed, Aurora.", "Solarian Incursion Update"
		)
		fire_bombardment_event(0)
		if(prob(66))
			fire_escape_pods("crewman/nt")

/datum/event/sol_team/proc/fire_bombardment_event(var/prob_minor, var/time_until = 1 MINUTE)
	if(!prob_minor)
		prob_minor = 0
	if(prob(prob_minor))
		// True: minor bombardment
		var/datum/event_container/MOD = SSevents.event_containers[EVENT_LEVEL_MODERATE]
		MOD.select_event_by_type(/datum/event/meteor_wave/bombardment/minor)
		MOD.next_event_time = world.time + time_until
	else
		// False: major bombardment
		var/datum/event_container/MAJ = SSevents.event_containers[EVENT_LEVEL_MAJOR]
		MAJ.select_event_by_type(/datum/event/meteor_wave/bombardment)
		MAJ.next_event_time = world.time + time_until

/datum/event/sol_team/proc/fire_escape_pods(var/rescue_type, var/time_until = 3 MINUTES)
	if(!rescue_type)
		return
	var/R = text2path("/datum/event/rescue_pod/[rescue_type]")
	if(ispath(R))
		var/datum/event_container/MOD = SSevents.event_containers[EVENT_LEVEL_MODERATE]
		MOD.select_event_by_type(R)
		MOD.next_event_time = world.time + time_until

/datum/event/sol_team/proc/fire_pitstop_event(var/time_until = 5 MINUTES)
	var/datum/event_container/MAJ = SSevents.event_containers[EVENT_LEVEL_MAJOR]
	MAJ.next_event_time = world.time + time_until
	if(savior_type == "NT" || savior_type == "TCFL")
		MAJ.select_event_by_type(/datum/event/freighter/nt)
	else if(savior_type == "Elyran")
		MAJ.select_event_by_type(/datum/event/freighter/elyran)
	else if(savior_type == "Coalition")
		MAJ.select_event_by_type(/datum/event/freighter/coalition)
	else if(savior_type == "PRA")
		MAJ.select_event_by_type(/datum/event/freighter/pra)
	else if(savior_type == "Zo'rane")
		MAJ.select_event_by_type(/datum/event/freighter/zora)
	else
		MAJ.select_event_by_type(/datum/event/freighter/hegemony)

/datum/event/meteor_wave/bombardment
	bombardment = TRUE
	ic_name = "bombardment"
	no_fake = TRUE
	startWhen = 30
	// same stats as meteor_wave/shower
	wave_delay  = 10
	min_waves 	= 3
	max_waves 	= 5
	min_meteors = 3
	max_meteors = 4
	duration    = 240 //Total duration in seconds that the storm will last after it starts

	waves		= 4//this is randomised
	next_wave 	= 30
	var/initial_level
	var/dir_text

/datum/event/meteor_wave/bombardment/setup()
	set_dir = pick(1, 3, 4) // don't spawn south because that'll spawn inside the shield and vibe-check the station

/datum/event/meteor_wave/bombardment/minor
	startWhen   = 86
	bombardment = FALSE
	downed_ship = TRUE

/datum/event/meteor_wave/bombardment/announce()
	command_announcement.Announce("Station sensors detect several high-speed projectiles closing rapidly. Estimate one minute to impact. \
	All crew are advised to seek immediate shelter in well-reinforced sections of the station, away from areas of the station in proximity to the surface.", "Inbound Ordinance Alert")
	if(security_level < SEC_LEVEL_RED)
		initial_level = security_level
		set_security_level(SEC_LEVEL_RED)

/datum/event/meteor_wave/bombardment/start()
	command_announcement.Announce("Inbound ordinance has reached the station perimeter. All hands, brace for impact.", "Inbound Ordinance Alert")

/datum/event/meteor_wave/bombardment/minor/announce()
	command_announcement.Announce("A cloud of debris has been detected on collision course with the station. Sensors estimate three minutes until impact. \
	Ensure station shields are active and stay away from exterior areas until the Aurora has cleared the cloud.", "Debris Alert")

/datum/event/meteor_wave/bombardment/minor/start()
	command_announcement.Announce("The debris cloud has reached the station. All hands, brace for impact.", "Debris Alert")

/datum/event/meteor_wave/bombardment/end()
	addtimer(CALLBACK(src, .proc/announce_end), 60 SECONDS)

/datum/event/meteor_wave/bombardment/proc/announce_end()
	command_announcement.Announce("No further incoming projectiles registered on sensors. Crew may now return to their stations and attend to damage control procedures.", "Inbound Ordinance Alert")
	set_security_level(initial_level)

/datum/event/meteor_wave/bombardment/minor/announce_end()
	command_announcement.Announce("The station is now clear of the debris cloud. Crew may now return to their stations and attend to damage control procedures.", "Debris Alert")

/datum/event/rescue_pod/crewman
	no_fake = TRUE

/datum/event/rescue_pod/crewman/announce()
	command_announcement.Announce("The NDV Icarus reports inbound escape pods to the [station_name()]. Investigate and attend to the situation in accordance with NanoTrasen corporate regulations.", new_title="NDV Icarus", new_sound='sound/AI/escapepod.ogg')

/datum/event/rescue_pod/crewman/setup()
	spawner = SSghostroles.get_spawner(spawner_name)
/datum/event/rescue_pod/crewman/sol
	spawner_name = "solescape"

/datum/event/rescue_pod/crewman/nt
	spawner_name = "ntescape"

/datum/event/shift_goal
	no_fake = TRUE

/datum/event/shift_goal/announce()
	command_announcement.Announce(
		"N.S.S. Aurora, your station has been selected for emergency supply retrieval relating to the ongoing Solarian incursion. \
		Post-shift, the Icarus will escort a NanoTrasen freighter to your location to retrieve your shift's output of goods and equipment. \
		Central Command has supplied a due request for as much ammunition, weaponry, combat vehicles, resources, food, water and emergency supplies as you can muster. \
		Bonuses will be fielded to those who demonstrate excellent service in the face of this, should commendation reports be filed after wartime concludes. Good luck.", "Shift Goal Alert")

/datum/event/freighter
	announceWhen = -1
	no_fake = TRUE
	var/list/spawner_names = list()
	var/freighter_type = null
	var/spawned = FALSE

/datum/event/freighter/announce()
	command_announcement.Announce(
		"N.S.S. Aurora, a freighter will be docking shortly requesting emergency supplies: namely food, water and medical supplies. \
		Expect urgent requests to come frequently as the freighter ferries supplies to its mothership. \
		We are rerouting strategic assets to your station shortly for escort of the freighter.", "[freighter_type] Freighter Arrival")

/datum/event/freighter/start()
	for(var/spawner in spawner_names)
		var/datum/ghostspawner/G = SSghostroles.get_spawner(spawner)
		if(istype(G))
			G.spawnpoints = list("Pitstop")
			G.attached_event = src
			G.welcome_message += "<br>You're a combatant in the ongoing Solarian invasion, your allegiance determined by whatever gear and identification cards you've spawned with. For whatever reason of your choosing, your team and vessel have run low on supplies, gear and ammunition. You're on course to the NSS Aurora for resupply - get food, water, and any equipment the crew can muster."
			G.enable()

/datum/event/freighter/setup()
	for(var/datum/event/E in SSevents.finished_events)
		if(istype(E, /datum/event/freighter))
			kill()
			return
	if(!freighter_type)
		if(istype(src, /datum/event/freighter/reinforcement))
			freighter_type = pick("Coalition", "Elyran", "PRA", "Zo'rane", "Izweski Hegemony")
		else
			freighter_type = prob(66) ? "NanoTrasen" : pick("Coalition", "Elyran", "PRA", "Zo'rane", "Izweski Hegemony")
	if(freighter_type == "Elyran")
		spawner_names = list("elyra_trooper", "elyra_engtrooper", "elyra_heavy")
	else if(freighter_type == "Coalition")
		spawner_names = list("coc_trooper", "coc_engtrooper", "coc_heavy")
	else if(freighter_type == "PRA")
		spawner_names = list("exp_pra_cosmonaut", "exp_pra_commissar", "exp_pra_leader", "exp_pra_tesla", "exp_pra_medic")
	else if(freighter_type == "Zo'rane")
		spawner_names = list("zora_warrior", "zora_medic")
	else if(freighter_type == "Izweski Hegemony")
		spawner_names = list("kathope", "katklax", "katspec", "katlead")
	else
		spawner_names = list("ntert", "nteng", "ntmed", "ntlead")

/datum/event/freighter/gs_spawned()
	if(!spawned)
		spawned = TRUE
		announce()

// specific event subtypes to force-spawn a certain type
/datum/event/freighter/nt
	freighter_type = "NanoTrasen"

/datum/event/freighter/elyran
	freighter_type = "Elyran"

/datum/event/freighter/coalition
	freighter_type = "Coalition"

/datum/event/freighter/pra
	freighter_type = "PRA"

/datum/event/freighter/zora
	freighter_type = "Zo'rane"

/datum/event/freighter/hegemony
	freighter_type = "Izweski Hegemony"

/datum/event/freighter/reinforcement/announce()
	command_announcement.Announce(
		"N.S.S. Aurora, a shuttle bearing [freighter_type] reinforcements is inbound to you. They will provide additional security against Solarian incursion. \
		Among these reinforcements may be specialists that can assist in daily operation of the Aurora, but such security clearance is only to be designated by \
		the acting chain of command.", "[freighter_type] Reinforcements"
	)

/datum/event/freighter/reinforcement/start()
	for(var/spawner in spawner_names)
		var/datum/ghostspawner/G = SSghostroles.get_spawner(spawner)
		if(istype(G))
			G.attached_event = src
			G.welcome_message += "<br>You're a combatant in the ongoing Solarian invasion, your allegiance determined by whatever gear and identification cards you've spawned with. Strategic movements from Solarians in recent hours have led you to be temporarily stationed on board the NSS Aurora to assist its onboard staff. Be of assistance and don't overstep your boundaries - you're here to help, not to be a fool."
			G.enable()

/datum/event/freighter/refugee
	spawner_names = list("sol_refugee")
	freighter_type = "Sol"

/datum/event/freighter/refugee/setup()
	for(var/datum/event/E in SSevents.finished_events)
		if(istype(E, /datum/event/freighter))
			kill()
			return
	if(prob(33))
		spawner_names = list("sol_refugee", "sol_infiltrator")

/datum/event/freighter/refugee/announce()
	command_announcement.Announce(
		"N.S.S. Aurora, a shuttle bearing Solarian refugees is inbound to you. We're unable to divert them to another lower-security installation, due to present engagements. \
		On-station security should treat them with the utmost scrutiny, and afford them only the comforts provided within NanoTrasen corporate regulations. \
		Additional security reinforcements are standing by should a situation requiring their deployment develop.", "Solarian Refugee Arrival"
	)

/datum/event/freighter/refugee/proc/calc_pop()
	var/pop = 0
	for(var/mob/M in player_list)
		if(!M.mind || !M.client || M.client.is_afk(10 MINUTES)) // longer than 10 minutes AFK counts them as inactive
			continue

		pop++

	return max(round(pop / 5), 1)

/datum/event/freighter/refugee/start()
	for(var/spawner in spawner_names)
		var/datum/ghostspawner/G = SSghostroles.get_spawner(spawner)
		if(spawner == "sol_refugee")
			G.max_count = calc_pop()
		if(istype(G))
			G.spawnpoints = list("Pitstop")
			G.attached_event = src
			G.enable()

/datum/event/tcfl_visit
	announceWhen = -1
	no_fake = TRUE
	var/spawned = FALSE
	var/list/spawner_names = list("tcflr", "tcfls", "tcfll", "tcflpl")

/datum/event/tcfl_visit/start()
	for(var/spawner in spawner_names)
		var/datum/ghostspawner/G = SSghostroles.get_spawner(spawner)
		if(istype(G))
			G.attached_event = src
			G.welcome_message = "You're a Tau Ceti Foreign Legion soldier! Your fireteam has taken significant harm from their operations in the Solarian invasion which is ongoing. You're on a quick trip to the NSS Aurora for repair and resupply with whatever the crew can muster. Get some help!"
			G.enable()

/datum/event/tcfl_visit/gs_spawned()
	if(!spawned)
		spawned = TRUE
		announce()

/datum/event/tcfl_visit/announce()
	command_announcement.Announce(
		"N.S.S. Aurora, a Foreign Legion vessel is inbound to your station in need of urgent resupply. On-board are also several members of the TCFL who \
		are in dire need of medical aid. Medical personnel should be prepared for immediate triage.", "TCFL Arrival"
	)
