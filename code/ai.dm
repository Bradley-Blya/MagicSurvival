	#define IGNORE 0
	#define PLAYER_TEAM 1
	#define MONSTER_TEAM 2
	#define MISC_TEAM 3

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

	var/team

	var/next_check
	var/delay = 1

	proc/process(tick)
		if(!Mob)
			return

		if(check_hostiles())
			decide_sighted()

		Mob.Move(get_step(Mob, pick(NORTH, EAST, WEST, SOUTH)))


	proc/check_hostiles() //returns 1 if there are hostiles in view
		for(var/mob/living/M in view())
			var/t = M.get_team()
			if(t != team)
				return 1

	proc/decide_sighted() //ai dicides wether they attack, run away, or track
		return



/mob/living/proc/get_team()
	if(client)
		return PLAYER_TEAM

	if(ai)
		return ai.team

	return IGNORE

