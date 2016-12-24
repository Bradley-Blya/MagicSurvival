/mob/verb/test1()
	src.time_to_move ++

/mob/verb/test2()
	src.time_to_move --

/mob/verb/attack2()
	var/obj/o = new/obj(loc)
	o.layer = MOB_LAYER + 0.5
	o.mouse_opacity = 0
	o.pixel_x = -16
	o.pixel_y = -16
	o.icon = 'icons/effects/98x98.dmi'
	o.icon_state = "attack"
	sleep((38*world.tick_lag))
	del o

/mob/verb/attack()
	set instant = 1
	var/tt = world.time
	var/ttt = time2text(world.timeofday,"mm:ss")
	var/obj/action/attack/a = new (loc)
	a.actor = src
	a.perform()
	ttt += " -- "
	ttt += time2text(world.timeofday,"mm:ss")
	world << "<font size=5 color=red>! == [world.time - tt]</font>  [ttt]"

/mob/verb/showB()
	showboom(src)



