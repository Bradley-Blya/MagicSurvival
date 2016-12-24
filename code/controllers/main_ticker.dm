var/datum/ticker/Ticker

var/list/Mobs[0]

var/list/Logrus[0]
var/list/Spells[0]


/datum/ticker
	var/ticks = 0

	New()
		..()
		if(Ticker)
			del Ticker
		Ticker = src
		src.process()

/datum/ticker/proc/process()
	while(1)
		sleep(1)
		ticks++

		for(var/mob/living/M in Mobs)
			M.Life(ticks)
			M.AI(ticks)





		lagstopsleep()
	//	world << "[world.time] - [world.timeofday] - [ticks]"
	//	world << "[Mobs[1]]"

