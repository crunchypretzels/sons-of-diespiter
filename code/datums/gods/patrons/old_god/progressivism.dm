/datum/patron/old_god/progressivism
	name = "Psydon, the Father"
	domain = "Everything."
	desc = "Who are we to question the Weeping God? Must we think so highly of ourselves as if to demand the attentions of 'gods'? </br>We are no misguided souls. Psydon left us a thousand lyfetymes of wisdom to steel our souls against the dark. Together, we will surpass any challenge, and no monster, nor blasphemer, nor gloom of nite stays our flock from the path of righteousness."
	worshippers = "Village Pastors, Retired Heroes, Healers"
	associated_faith = /datum/faith/old_god
	mob_traits = list(TRAIT_PSYDONIAN_GRIT)
	miracles = list(/obj/effect/proc_holder/spell/targeted/touch/orison			= CLERIC_ORI,
					/obj/effect/proc_holder/spell/self/check_boot				= CLERIC_T0,
					/obj/effect/proc_holder/spell/invoked/psydonendure			= CLERIC_T1,
					/obj/effect/proc_holder/spell/self/psydonrespite			= CLERIC_T2,
	)
	traits_tier = list(TRAIT_PSYDONITE = CLERIC_T1)
	confess_lines = list(
		"THERE IS ONLY ONE TRUE GOD!",
		"PSYDON YET LYVES! PSYDON YET ENDURES!",
		"TURN THE HEATHEN YET, BANISH THE MONSTER!",
		"WITH EVERY BROKEN BONE, I SWORE I LYVED!",
		"FORGIVE THEM, ALLFATHER, FOR THEY KNOW-NOT WHAT THEY DO!",
		"BEAR WITNESS, MY GOD; MY HAND STAYS ITSELF YET!",
	)
