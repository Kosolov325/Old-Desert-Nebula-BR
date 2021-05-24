#define CUM_TARGET_THROAT_FUNCLAW "throat"
#define CUM_TARGET_VAGINA_FUNCLAW "vagina"
#define CUM_TARGET_ANUS_FUNCLAW "anus"

/mob/living/simple_animal/hostile/deathclaw/funclaw
	name = "Deathclaw"
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match. This one seems to have a strange look in its eyes.."
	var/pound_cooldown = 0
	var/chosen_hole

/mob/living/simple_animal/hostile/deathclaw/funclaw/AttackingTarget()
	var/mob/living/M = target
	if(!ishuman(M) || M.health > 60)
		..()
		return

	if(get_dist(src, M) > 0)
		a_intent = INTENT_GRAB
		grab_state = GRAB_NECK

		start_pulling(M, 1)
		M.grabbedby(src)
		M.drop_all_held_items()
		M.stop_pulling()

	else if(get_dist(src, M) == 0)
		if(refactory_period > 0)
			..()
			return

		if(pound_cooldown < world.time)
			chosen_hole = null
			pound_cooldown = world.time + 2000

		if(M.client && M.client.prefs)
			if(M.client.prefs.wasteland_toggles & VERB_CONSENT)
				pound(M)
				sleep(rand(1, 3))
				pound(M)
				sleep(rand(1, 3))
				pound(M)
			else
				..()


/mob/living/simple_animal/hostile/deathclaw/funclaw/proc/pound(mob/living/M)
	if(refactory_period > 0)
		return

	switch(chosen_hole)
		if(CUM_TARGET_ANUS_FUNCLAW)
			if(tearSlot(M, SLOT_WEAR_SUIT))
				return
			if(tearSlot(M, SLOT_W_UNIFORM))
				return


		if(CUM_TARGET_VAGINA_FUNCLAW)
			if(tearSlot(M, SLOT_WEAR_SUIT))
				return
			if(tearSlot(M, SLOT_W_UNIFORM))
				return


		if(CUM_TARGET_THROAT_FUNCLAW)
			if(tearSlot(M, SLOT_HEAD))
				return
			if(tearSlot(M, SLOT_WEAR_MASK))
				return


/mob/living/simple_animal/hostile/deathclaw/funclaw/proc/tearSlot(mob/living/M, slot)
	var/obj/item/W = M.get_item_by_slot(slot)
	if(W)
		M.dropItemToGround(W)
		playsound(loc, "sound/items/poster_ripped.ogg", 70, 1, -1)
		visible_message("<span class='danger'>\The [src]</b> tears off \the [M]'s clothes!</span>", \
				"<span class='userdanger'>\The [src]</b> tears off \the [M]'s clothes!</span>", null, COMBAT_MESSAGE_RANGE)
		return TRUE
	return FALSE

