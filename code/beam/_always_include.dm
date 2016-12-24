/*

This code is common to all examples.

*/

#define DEBUG

world
	name = "Enemy AI Examples"

atom
	icon = 'icons.dmi'

turf
	icon_state = "grass"

	wall
		density = 1
		icon_state = "wall"

var
	list/hiding_spots = list()

obj
	hiding_spot
		icon_state = "hiding spot"
		New()
			..()
			invisibility = 1
			spawn(1)
				hiding_spots += src.loc

proc
	show_hit(mob/m)
		var/obj/o = new /obj(m.loc)
		o.layer = MOB_LAYER + 1
		o.pixel_x = rand(-8, 8)
		o.pixel_y = rand(-8, 8)
		o.mouse_opacity = 0
		o.icon_state = "attack"
		o.dir = pick(NORTH, SOUTH, EAST, WEST)
		sleep(6)
		del o

	show_heal(mob/m)
		var/obj/o = new /obj(m.loc)
		o.layer = MOB_LAYER + 1
		o.pixel_x = rand(-4, 4)
		o.pixel_y = rand(-4, 4)
		o.mouse_opacity = 0
		o.icon_state = "heal"
		sleep(8)
		del o

mob
	var
		dead = 0

	Move()
		if(dead) return 0
		. = ..()
