/datum/patron/old_god/fatalism
	name = "Psydon, the Weeper"
	domain = "Everything... once."
	desc = "They killed Him. He wept for us- wrought a WORLD for us- and they KILLED HIM. </br>This world is a broken corpse, and we the flies teeming over its widening pores. These aren't GODS. These aren't SAINTS. These are fat LOCUSTS, devouring what remains of our GOD! </br>...let us begin again. The year is 1513. There is a Grand Duchy built on traditional elven homelands, and in that Duchy..."
	worshippers = "Extremists Among Extremists, Madmen, The Annihilated"
	associated_faith = /datum/faith/old_god
	mob_traits = list(TRAIT_PSYDONIAN_GRIT)
	miracles = list(/obj/effect/proc_holder/spell/targeted/touch/orison			= CLERIC_ORI,
					/obj/effect/proc_holder/spell/self/check_boot				= CLERIC_T0,
					/obj/effect/proc_holder/spell/invoked/psydonendure			= CLERIC_T1,
					/obj/effect/proc_holder/spell/self/psydonrespite			= CLERIC_T2,
	)
	traits_tier = list(TRAIT_PSYDONITE = CLERIC_T1)
	confess_lines = list(
		"THERE WAS ONLY ONE TRUE GOD!",
		"PSYDON WEPT! PSYDON BLEEDS!",
		"REBUKE THE USURPER, SUNDER THE BLASPHEMER!",
		"EVERY BROKEN BONE, REPAID A THOUSANDFOLD!",
		"HE WON'T HEAR ME! HE CAN'T! HE'S GONE!",
		"NO GODS! NO MASTERS! NO SAINTS!",
	)
