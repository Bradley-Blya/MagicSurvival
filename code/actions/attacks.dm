/obj/action

	var/actor

/obj/action/attack
	icon = 'icons/effects/98x98.dmi'
	var/damage = 20
	var/dmg_type = "brute"
	var/time_of_action = 30


/obj/action/attack
	proc/perform(var/time)
		time = time_of_action*world.tick_lag
		show_effects(time)
		apply_effects()
		world << "DONE"

	proc/apply_effects()
		for(var/mob/living/M in range(1))
			if(M == actor)
				continue
			M.apply_dmg(damage, dmg_type)

/obj/action/attack
	proc/show_effects(var/t)
		layer = MOB_LAYER + 0.5
		mouse_opacity = 0
		icon = 'icons/effects/actions.dmi'
		icon_state = "attack2"
		var/a = pick(120,240)
		animate(src, transform = turn(matrix()*3, a), time = t*0.4)
		sleep(t*0.4)
		animate(src, transform = matrix()*1, time = 0.01)
		a -= 240
		animate(src, transform = turn(matrix()*3, a), time = t*0.4)
		sleep(t*0.4)
		a += pick(100, -100)
		animate(src, transform = turn(matrix()*7, a), time = t*0.1)
		sleep(t*0.20)
		spawn(1)
			del src

/obj/action/attack/Uncrossed(atom/movable/O)//if user moves, attack stops
	if(O == actor)
		del src

	..()