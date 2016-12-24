	#define PLAYERS_TEAM = 1
	#define MONSTER_TEAM = 2
	#define MISC_TEAM = 3

	#define ATTACK 1
	#define TRACKING 2
	#define DEFENCE 3
	#define CHASING 4
	#define RETREATING 5
	#define STALK 6

/datum/ai
	var/mob/living/Mob
	var/list
		enemies[0]
		alies[0]
		neutral[0]

	var/team = 3

	var/next_check
	var/delay

/datum/ai/proc/process(tick)
	if(!Mob)
		return
	Mob.Move(get_step(Mob, pick(NORTH, EAST, WEST, SOUTH)))
