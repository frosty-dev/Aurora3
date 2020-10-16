/obj/structure/phoron_deposit
	name = "supermassive phoron deposit"
	desc = "The single largest phoron deposit you have ever seen. It shimmers with an unnerving, glistening shine."
	icon = 'icons/obj/clandestine-phoron.dmi'
	icon_state = "megaphoron"
	anchored = 1
	density = 1
	pixel_x = -25
	light_color = "#FC2BC5"
	light_power = 5
	light_range = 5
	layer = 4
	var/sample_taken = FALSE

/obj/structure/phoron_deposit/ex_act(severity)
	return

/obj/structure/phoron_deposit/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/device/core_sampler))
		if(sample_taken)
			return
		var/obj/item/phoron_sample/H = new(user.loc)
		user.put_in_hands(H)
		sample_taken = TRUE

/obj/item/phoron_sample
	name = "supermassive phoron sample"
	desc = "A very heavy, condensed sample of phoron. Holding onto this is probably a good idea."
	icon = 'icons/obj/kow-items.dmi'
	icon_state = "phoron_sample"
	light_color = "#FC2BC5"
	light_power = 1
	light_range = 2
	drop_sound = 'sound/items/drop/glass.ogg'

/obj/item/phoron_sample/pickup(mob/living/user)
	..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if( H.gloves || ( H.wear_suit && (H.wear_suit.body_parts_covered & HANDS) ) )
			return
		var/active_hand = H.hand
		to_chat(user, "<span class='warning'>\The [src] burns your hand when you touch it!</span>")
		if(active_hand)
			user.apply_damage(2, BURN,BP_L_HAND)
		else
			user.apply_damage(2, BURN,BP_R_HAND)

/obj/structure/the_bomb
	name = "vehicle-less multiple re-entry thermonuclear-phoron warhead cluster"
	desc = "The bomb. This seems to be partly constructed, its major components missing. Maybe you should find those. What's the worst that could happen?"
	icon = 'icons/obj/clandestine-bomb.dmi'
	icon_state = "mirv"
	anchored = 0
	density = 1
	pixel_x = -16
	layer = 4
	var/has_phoron = 0
	var/has_uranium = 0
	var/has_valve = 0
	var/has_manipulator = 0

/obj/structure/the_bomb/examine(mob/user)

	..()

	if(has_phoron < 200)
		to_chat(user, "It is loaded with [has_phoron] phoron sheets. It needs 200.")

	if(has_uranium < 100)
		to_chat(user, "It is loaded with [has_uranium] uranium sheets. It needs 100.")

	if(has_valve < 5)
		to_chat(user, "It has [has_uranium] transfer valves. It needs 5.")

	if(has_manipulator < 5)
		to_chat(user, "It has [has_manipulator] exosuit manipulators. It needs 5.")


/obj/structure/the_bomb/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/device/transfer_valve))
		to_chat(user, "You add one [W] to the \the [src].")
		has_valve += 1
		qdel(W)

	if(istype(W, /obj/item/mech_component/manipulators))
		to_chat(user, "You add one [W] to the \the [src].")
		has_manipulator += 1
		qdel(W)

	if(istype(W, /obj/item/stack/material))
		var/obj/item/stack/material/O = W
		if(O.material.name == MATERIAL_URANIUM)
			has_uranium += O.amount
			to_chat(user, "You add [O.amount] uranium sheets to the \the [src].")
			qdel(O)

		if(O.material.name == MATERIAL_PHORON)
			has_phoron += O.amount
			to_chat(user, "You add [O.amount] uranium sheets to the \the [src].")
			qdel(O)

