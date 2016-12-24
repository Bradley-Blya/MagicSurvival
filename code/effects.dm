proc
	show_hit(mob/m)
		var/obj/o = new /obj(m.loc)
		o.layer = MOB_LAYER + 1
		o.pixel_x = rand(-8, 8)
		o.pixel_y = rand(-8, 8)
		o.mouse_opacity = 0
		o.icon_state = "attack"
		o.dir = pick(NORTH, SOUTH, EAST, WEST)
		animate(o, transform = matrix()*1.5, color = rgb(100,0,0), time = 3)
		spawn(6)
			del o

	show_heal(mob/m)
		var/obj/o = new /obj(m.loc)
		o.layer = MOB_LAYER + 1
		o.pixel_x = rand(-4, 4)
		o.pixel_y = rand(-4, 4)
		o.mouse_opacity = 0
		o.icon_state = "heal"
		spawn(8)
			del o

	showboom(atom/c)
		var/obj/o = new (c.loc)
		o.layer = MOB_LAYER + 0.5
		o.mouse_opacity = 0
		o.pixel_x = -32
		o.pixel_y = -32

		o.icon = 'explosion.dmi'
		animate(o,transform = matrix()*1.5,time=15)

		c.overlays += o
		spawn(10)
			c.overlays += o
			del o