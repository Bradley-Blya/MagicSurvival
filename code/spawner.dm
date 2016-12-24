/obj/spawner
	icon = 'icons/effects/spawners.dmi'
	invisibility = 101
	var/spawning = /mob/living/ball



/obj/spawner/ball
	icon_state = "ball"

	New()
		..()
		new spawning(loc)
		spawn(1)
			del src

/obj/spawner/ball_red
	icon_state = "ball_red"
	New()
		..()
		var/s = new spawning(loc)

		s:icon -= rgb(40,190,170)
		spawn(1)
			del src