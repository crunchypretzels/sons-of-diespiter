/datum/patron/old_god/esotericism
	name = "Psydon, the Unknowable"
	domain = "All the world and all its peoples."
	desc = "Who is Psydon, really? The Weeping God leaves no answers and expects no question. Whether He abandoned Psydonia, lyves yet among its peoples, or even still governs as the world-sovereign, as many faces of Psydon exist as do followers."
	worshippers = "Wandering Souls, Daemon-Hunters, Those Yet Unknown"
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
		"REBUKE THE HEATHEN, SUNDER THE MONSTER!",
		"WITH EVERY BROKEN BONE, I SWORE I LYVED!",
		"FORGIVE THEM, ALLFATHER, FOR THEY KNOW-NOT WHAT THEY DO!",
		"BEAR WITNESS, MY GOD; THE SACRIFICE MADE MANIFEST!",
	)
