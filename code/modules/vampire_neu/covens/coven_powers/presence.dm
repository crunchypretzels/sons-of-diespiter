/datum/coven/presence
	name = "Presence"
	desc = "Invade the mortal mynd, your words are far mightier than any sword. Subjugate them."
	icon_state = "presence"
	power_type = /datum/coven_power/presence

/datum/coven_power/presence
	name = "Presence power name"
	desc = "Presence power description"

//AWE
/datum/coven_power/presence/awe
	name = "Awe"
	desc = "Make those around you admire and want to be closer to you."
	gif = "Awe.gif"

	level = 1
	research_cost = 0
	check_flags = COVEN_CHECK_CAPABLE | COVEN_CHECK_SPEAK
	target_type = TARGET_HUMAN
	vitae_cost = 100
	range = 4
	multi_activate = TRUE
	cooldown_length = 60 SECONDS

/datum/coven_power/presence/awe/pre_activation_checks(mob/living/target)
	var/mypower = owner.STAINT
	var/mob/living/carbon/human/H = target
	var/theirpower = H.STAINT - 5
	if((theirpower >= mypower))
		to_chat(owner, span_warning("[target]'s mind is too powerful to sway!"))
		return FALSE

	return TRUE

/datum/coven_power/presence/awe/activate(mob/living/carbon/human/target)
	. = ..()
	target.remove_overlay(MUTATIONS_LAYER)
	var/mutable_appearance/presence_overlay = mutable_appearance('icons/effects/clan.dmi', "presence", -MUTATIONS_LAYER)
	presence_overlay.pixel_z = 1
	target.overlays_standing[MUTATIONS_LAYER] = presence_overlay
	target.apply_overlay(MUTATIONS_LAYER)
	to_chat(target, "<span class='userlove'><b>It wouldn't hurt to listen...</b></span>")
	playsound(target,'sound/villain/wonder.ogg', 40)
	target.create_walk_to(3 SECONDS, owner)

	if(!owner.cmode)
		to_chat(target, "<span class='userlove'><b>Follow me~</b></span>")
		owner.say("Follow me~")
	else
		to_chat(target, "<span class='userlove'><b>COME HERE</b></span>")
		owner.say("COME HERE!!")


/datum/coven_power/presence/awe/deactivate(mob/living/carbon/human/target)
	. = ..()
	target.remove_overlay(MUTATIONS_LAYER)

//DREAD GAZE
/datum/coven_power/presence/dread_gaze
	name = "Dread Gaze"
	desc = "Incite fear in others through only your words and gaze."

	level = 2
	research_cost = 1
	check_flags = COVEN_CHECK_CAPABLE | COVEN_CHECK_SPEAK
	target_type = TARGET_HUMAN
	range = 4
	vitae_cost = 100

	multi_activate = TRUE
	cooldown_length = 60 SECONDS

/datum/coven_power/presence/dread_gaze/activate(mob/living/carbon/human/target)
	. = ..()
	target.remove_overlay(MUTATIONS_LAYER)
	var/mutable_appearance/presence_overlay = mutable_appearance('icons/effects/clan.dmi', "presence", -MUTATIONS_LAYER)
	presence_overlay.pixel_z = 1
	target.overlays_standing[MUTATIONS_LAYER] = presence_overlay
	target.apply_overlay(MUTATIONS_LAYER)

	to_chat(target, "<span class='userlove'><b>FEAR ME</b></span>")
	owner.say("FEAR ME!!")
	var/datum/cb = CALLBACK(target, TYPE_PROC_REF(/mob/living/carbon/human, step_away_caster), owner)
	for(var/i in 1 to 30)
		addtimer(cb, (i - 1) * target.total_multiplicative_slowdown())
	target.emote("scream")
	target.do_jitter_animation(3 SECONDS)
	to_chat(target, "<span class='userlove'><b>OH GOD, PLEASE SAVE ME!.</b></span>")
	playsound(target,'sound/villain/wonder.ogg', 40)

/datum/coven_power/presence/dread_gaze/deactivate(mob/living/carbon/human/target)
	. = ..()
	target.remove_overlay(MUTATIONS_LAYER)

/mob/living/carbon/human/proc/step_away_caster(mob/living/step_from)
	walk(src, 0)
	if(can_frenzy_move())
		set_glide_size(DELAY_TO_GLIDE_SIZE(total_multiplicative_slowdown()))
		step_away(src, step_from, 99)

/datum/coven_power/presence/fall
	name = "Kneel"
	desc = "Make those kneel before you."

	level = 3
	research_cost = 2
	vitae_cost = 200
	check_flags = COVEN_CHECK_CAPABLE|COVEN_CHECK_SPEAK
	target_type = TARGET_HUMAN
	range = 4

	multi_activate = TRUE
	cooldown_length = 1 MINUTES

/datum/coven_power/presence/fall/activate(mob/living/carbon/human/target)
	. = ..()
	target.remove_overlay(MUTATIONS_LAYER)
	var/mutable_appearance/presence_overlay = mutable_appearance('icons/effects/clan.dmi', "presence", -MUTATIONS_LAYER)
	presence_overlay.pixel_z = 1
	target.overlays_standing[MUTATIONS_LAYER] = presence_overlay
	target.apply_overlay(MUTATIONS_LAYER)

	target.Immobilize(3 SECONDS)
	to_chat(target, "<span class='userlove'><b>KNEEL</b></span>")
	to_chat(target, "<span class='userlove'><b>MY NEW GOD!</b></span>")
	playsound(target,'sound/villain/wonder_secret_known.ogg', 40)
	owner.say("KNEEL!!")
	target.set_resting(TRUE, TRUE)

/datum/coven_power/presence/fall/deactivate(mob/living/carbon/human/target)
	. = ..()
	target.remove_overlay(MUTATIONS_LAYER)

//SUMMON
/datum/coven_power/presence/summon
	name = "Summon"
	desc = "Keep your friends close, but your enemies closer. Teleport a target to you."

	level = 4
	research_cost = 3
	vitae_cost = 200
	check_flags = COVEN_CHECK_CAPABLE|COVEN_CHECK_SPEAK
	target_type = TARGET_HUMAN
	range = 7
	multi_activate = TRUE
	cooldown_length = 1 MINUTES

/datum/coven_power/presence/summon/activate(mob/living/carbon/human/target)
	. = ..()
	target.remove_overlay(MUTATIONS_LAYER)
	var/mutable_appearance/presence_overlay = mutable_appearance('icons/effects/clan.dmi', "presence", -MUTATIONS_LAYER)
	presence_overlay.pixel_z = 1
	target.overlays_standing[MUTATIONS_LAYER] = presence_overlay
	target.apply_overlay(MUTATIONS_LAYER)

	to_chat(target, "<span class='userlove'><b>TO ME</b></span>")
	owner.say("TO ME!!")
	target.Immobilize(1.5 SECONDS)
	new /obj/effect/temp_visual/vamp_summon (get_turf(target))
	new /obj/effect/temp_visual/vamp_summon/end (get_turf(owner))
	addtimer(CALLBACK(src, PROC_REF(finish_teleport), owner, target, get_turf(owner)), 1.5 SECONDS)

/datum/coven_power/presence/summon/proc/finish_teleport(mob/living/user, mob/living/target, turf/target_turf)
	// Teleport subordinate to user
	if(target_turf)
		new /obj/effect/temp_visual/vamp_teleport(get_turf(target))
		target.forceMove(target_turf)

		// Messages
		to_chat(user, "<span class='notice'>You summon [target.real_name] to your location.</span>")
		to_chat(target, "<span class='userdanger'>You are compelled to appear before [user.real_name]!</span>")

		// Announce to nearby clan members
		for(var/mob/living/carbon/human/observer in view(7, user))
			if(observer.clan == user.clan && observer != user && observer != target)
				to_chat(observer, "<span class='info'>[user.real_name] has summoned [target.real_name].</span>")

/datum/coven_power/presence/summon/deactivate(mob/living/carbon/human/target)
	. = ..()
	target.remove_overlay(MUTATIONS_LAYER)

/mob/living/carbon/human/proc/step_toward_caster(mob/living/step_to)
	walk(src, 0)
	if(can_frenzy_move())
		set_glide_size(DELAY_TO_GLIDE_SIZE(total_multiplicative_slowdown()))
		step_towards(src, step_to, 99)
