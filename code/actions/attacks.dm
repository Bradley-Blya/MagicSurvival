/obj/action

	var/actor

/obj/action/attack
	icon = 'icons/effects/98x98.dmi'


/obj/action/attack/proc/perform(var/time)
	show_effects(time)
	world << "DONE"


/obj/action/attack/proc/show_effects(var/t)
	layer = MOB_LAYER + 0.5
	mouse_opacity = 0
	icon = 'icons/effects/actions.dmi'
	icon_state = "attack3"
	var/a = pick(120,240)
	animate(src, transform = turn(matrix()*3, a), time = t*0.4)
	sleep(t*0.4)
	animate(src, transform = matrix()*1, time = 0)
	a -= 240
	animate(src, transform = turn(matrix()*3, a), time = t*0.4)
	sleep(t*0.4)
	a += pick(100, -100)
	animate(src, transform = turn(matrix()*7, a), time = t*0.1)
	sleep(t*0.20)
	del src

/obj/action/attack/Uncrossed(atom/movable/O)
	if(O == actor)
		del src

	..()