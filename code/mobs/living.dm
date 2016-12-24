/mob/living
	var/health = 10
	var/ai_active = 1
	var/datum/ai/ai
	var/next_action = 0


/mob/living/New()
	..()
	Mobs += src

/mob/living/Login()
	ai = null
	ai_active = 0


/mob/living/proc/Life(ticks)
	return

/mob/living/proc/AI(ticks)
	if(ai_active == 3)
		return
	if(client)
		return
	if(!ai_active)
		return
	if(!ai)
		ai = new()
		ai.Mob = src
	spawn(-1)
		ai_active = 2
		ai.process(ticks)
		ai_active = 1





/mob/living/ball
	var/power = 100
	var/nutrition = 100


