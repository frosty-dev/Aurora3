/datum/event/sol_team
	no_fake = 1
	endWhen = 5
	var/threat_type
	var/savior_type
	var/engaged = TRUE
	var/destroyed = TRUE
	var/list/spawner_names = list("sol_marine", "sol_marine_ws", "sol_marine_ld")

/datum/event/sol_team/setup()
	startWhen = 5
	announceWhen = 2
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

/datum/event/sol_team/announce()
	if(engaged)
		icarus_announcement.Announce(
			"The [threat_type] slipped through the picket line and is on a direct intercept course with the station. \
			Icarus drones are presently engaged with the threat, but the CIC is tracking inbound Solarian boarding parties. \
			The Icarus cannot offer support until the vessel is neutralized. Recommend moving to high alert and preparing for intruders.", "Solarian Incursion Update")
		if(security_level < SEC_LEVEL_RED)
			set_security_level(SEC_LEVEL_RED)
	else
		savior_type = prob(75) ? pick("NT", "TCFL") : pick("Coalition", "Elyran")
		icarus_announcement.Announce(
			"The [threat_type] was caught and successfully neutralized by supporting [savior_type] vessels. Judging by the incoming tactical data, they'll be in need of repair and resupply. \
			Forwarding their requests for assistance on to you.", "Solarian Incursion Update")
		// Fire Pitstop here
		kill()

/datum/event/sol_team/start()
	for(var/spawner in spawner_names)
		var/datum/ghostspawner/human/sol_marine/G = SSghostroles.get_spawner(spawner)
		if(istype(G))
			G.enable()

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

/datum/event/sol_team/proc/fire_bombardment_event(var/prob_minor, var/time_until = 10 SECONDS)
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

/datum/event/sol_team/proc/fire_escape_pods(var/rescue_type, var/time_until = 10 SECONDS)
	if(!rescue_type)
		return
	var/datum/event/rescue_pod/R = text2path("/datum/event/rescue_pod/[rescue_type]")
	if(ispath(R))
		var/datum/event_container/MOD = SSevents.event_containers[EVENT_LEVEL_MODERATE]
		MOD.select_event_by_type(R)
		MOD.next_event_time = world.time + time_until
/datum/event/meteor_wave/bombardment
	bombardment = TRUE
	ic_name = "bombardment"
	no_fake = TRUE
	startWhen = 5

/datum/event/meteor_wave/bombardment/setup()
	set_dir = pick(1, 2, 3, 4)

/datum/event/meteor_wave/bombardment/minor
	// same stats as meteor_wave/shower
	startWhen   = 5 // delete this later
	wave_delay  = 6
	min_waves 	= 7
	max_waves 	= 9
	min_meteors = 0
	max_meteors = 1
	duration    = 180 //Total duration in seconds that the storm will last after it starts

	waves		= 4//this is randomised
	next_wave 	= 86
	bombardment = FALSE

/datum/event/meteor_wave/bombardment/announce()
	command_announcement.Announce("Station sensors detect several high-speed projectiles closing rapidly. Estimate one minute to impact. \
	All crew are advised to seek immediate shelter in well-reinforced sections of the station, and ensure suit lifesign sensors are properly enabled.", "Inbound Ordinance Alert")

/datum/event/meteor_wave/bombardment/start()
	command_announcement.Announce("Inbound ordinance has reached the station perimeter. All hands, brace for impact.", "Inbound Ordinance Alert")

/datum/event/meteor_wave/bombardment/minor/announce()
	command_announcement.Announce("A cloud of debris has been detected on collision course with the station. Sensors estimate three minutes until impact. \
	Ensure station shields are active and stay away from exterior areas until the Aurora has cleared the cloud.", "Debris Alert")

/datum/event/meteor_wave/bombardment/minor/start()
	command_announcement.Announce("The debris cloud has reached the station. All hands, brace for impact.", "Debris Alert")

/datum/event/meteor_wave/bombardment/end()
	addtimer(CALLBACK(src, .proc/announce_end), 10 SECONDS)

/datum/event/meteor_wave/bombardment/proc/announce_end()
	command_announcement.Announce("No further incoming projectiles registered on sensors. Crew may now return to their stations and attend to damage control procedures.", "Inbound Ordinance Alert")

/datum/event/meteor_wave/bombardment/minor/announce_end()
	command_announcement.Announce("The station is now clear of the debris cloud. Crew may now return to their stations and attend to damage control procedures.", "Debris Alert")

/datum/event/rescue_pod/crewman
	no_fake = 1

/datum/event/rescue_pod/crewman/announce()
	command_announcement.Announce("The NDV Icarus reports inbound escape pods to the [station_name()]. Investigate and attend to the situation in accordance with NanoTrasen corporate regulations.", new_title="NDV Icarus", new_sound='sound/AI/escapepod.ogg')

/datum/event/rescue_pod/crewman/setup()
	spawner = SSghostroles.get_spawner(spawner_name)
/datum/event/rescue_pod/crewman/sol
	spawner_name = "solescape"

/datum/event/rescue_pod/crewman/nt
	spawner_name = "ntescape"

/datum/event/shift_goal
	no_fake = 1

/datum/event/shift_goal/announce()
	command_announcement.Announce(
		"N.S.S. Aurora, your station has been selected for emergency supply retrieval relating to the ongoing Solarian incursion. \
		Post-shift, the Icarus will escort a NanoTrasen freighter to your location to retrieve your shift's output of goods and equipment. \
		Central Command has supplied a due request for as much ammunition, weaponry, combat vehicles, resources, food, water and emergency supplies as you can muster. \
		Bonuses will be fielded to those who demonstrate excellent service in the face of this, should commendation reports be filed after wartime concludes. Good luck.", "Shift Goal Alert")

/datum/event/freighter
	no_fake = 1

/datum/event/freighter/announce()
	command_announcement.Announce(
		"N.S.S. Aurora, you are expected to be docked shortly by a freighter requiring emergency supplies, namely food, water and medical supplies. \
		Expect urgent requests to come frequently as the freighter ferries supplies to its mothership. \
		We are rerouting strategic assets to your station shortly for escort of the freighter.", "NanoTrasen Freighter Arrival")

/datum/event/freighter/start()
	for(var/s in SSghostroles.spawners)
		var/datum/ghostspawner/human/ert/tcfl/G = SSghostroles.spawners[s]
		G.enable()
