/mob
	icon = 'icons/mob/mob.dmi'
	icon_state = "happy"
	var/time_to_move = 17
	var/next_move = 0

/mob/Login()
	..()
	src.icon -= rgb(180,80,180)
	//src.icon += rgb(0,0,250)
	//Bots -= src
	//Players += src

/mob/New()
	..()
	Mobs += src

/mob/Del()
	Mobs -= src
	..()

/mob/Move()
	glide_size = 36/time_to_move
	if(world.time < next_move)
		return 0
	next_move = world.time + (time_to_move*world.tick_lag)

	//for(var/obj/action/O in loc)
	//	if(O.actor = src)
	//		del O

	..()
