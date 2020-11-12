/datum/event/sol_team
	no_fake = 1

/datum/event/sol_team/announce()
	command_announcement.Announce("N.S.S. Aurora, your sector has been targeted by an errant Alliance frigate. We anticipate your vessel will shortly be the landing site of marines - expect boarders. The Icarus is presently taking care of the hostile vessel, though it is burning directly towards you - projections estimate coilgun fire will be heading your way soon. Raise shields immediately. Assistance will be available at any point should your on-board security team be unable to handle the situation. Good luck.", "Solarian Incursion Alert")

/datum/event/sol_team/start()
	for(var/s in SSghostroles.spawners)
		var/datum/ghostspawner/human/sol_marine/G = SSghostroles.spawners[s]
			G.enable()

/datum/event/shift_goal
	no_fake = 1

/datum/event/shift_goal/announce()
	command_announcement.Announce("N.S.S. Aurora, your station has been selected for emergency supply retrieval relating to the ongoing Solarian incursion. Post-shift, the Icarus will escort a NanoTrasen freighter to your location to retrieve your shift’s output of goods and equipment. Central Command has supplied a due request for as much ammunition, weaponry, combat vehicles, resources, food, water and emergency supplies as you can muster. Bonuses will be fielded to those who demonstrate excellent service in the face of this, should commendation reports be filed after wartime concludes. Good luck.", "Shift Goal Alert")

/datum/event/freighter
	no_fake = 1

/datum/event/freighter/announce()
	command_announcement.Announce("NanoTrasen space station Aurora, you are expected to be docked shortly by a freighter requiring emergency supplies, namely food, water and medical supplies. Expect urgent requests to come frequently as the freighter ferries supplies to its mothership. We are rerouting strategic assets to your station shortly for escort of the freighter.", "NanoTrasen Freighter Arrival")
