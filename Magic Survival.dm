/*
	These are simple defaults for your project.
 */

world
	//fps = 20		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default
	tick_lag = 0.2

	view = 6		// show up to 6 tiles outward from center (13x13 view)
	turf = /turf/ground
	area = /area/misc

/world/New()
	Ticker = new()


// Make objects move 8 pixels per tick when walking

mob
	step_size = 32
	glide_size = 3

obj
	step_size = 32
	glide_size = 8
