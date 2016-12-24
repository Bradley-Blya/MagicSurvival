
/turf
	var
		edge_weight = 0
		has_edges = 0

	proc
		__needs_edge(turf/t)
			if(!t) return 0
			if(istype(t, type)) return 0
			if(edge_weight == 0) return 0
			if(t.edge_weight > edge_weight)
				t.generate_edges()
				if(edge_weight < 0)
					return 1
				return 0
			return 1

		__add_edge(d)
			if(edge_weight > 0)
				var/image/i = image(icon, "edge", layer = TURF_LAYER + 0.01 * edge_weight, dir = d)

				if(d & NORTH) i.pixel_y = 32
				if(d & SOUTH) i.pixel_y = -32
				if(d & EAST) i.pixel_x = 32
				if(d & WEST) i.pixel_x = -32

				overlays += i

			if(edge_weight < 0)
				var/image/i = image(icon, "edge", layer = TURF_LAYER + 0.01, dir = d)

				if(d & NORTH) i.dir = SOUTH
				if(d & SOUTH) i.dir = NORTH
				if(d & EAST) i.dir = WEST
				if(d & WEST) i.dir = EAST

				overlays += i

		generate_edges()

			if(has_edges) return

			var/north = __needs_edge(locate(x, y + 1, z))
			var/south = __needs_edge(locate(x, y - 1, z))
			var/east = __needs_edge(locate(x + 1, y, z))
			var/west = __needs_edge(locate(x - 1, y, z))

			if(north) __add_edge(NORTH)
			if(south) __add_edge(SOUTH)
			if(east) __add_edge(EAST)
			if(west) __add_edge(WEST)

			if(north && east) __add_edge(NORTHEAST)
			if(north && west) __add_edge(NORTHWEST)
			if(south && east) __add_edge(SOUTHEAST)
			if(south && west) __add_edge(SOUTHWEST)

			has_edges = 1

			/*
			// this was the old code
			for(var/turf/t in oview(1, src))

				// if its the same type we don't need to show the edge
				if(istype(t, type)) continue

				// if t's edge_weight is less than or equal to this tiles,
				// we don't show the edge (because we'll show the edge for t).
				if(t.edge_weight > edge_weight) continue

				var/d = get_dir(src, t)

				var/image/i = image(edge_icon, icon_state, layer = TURF_LAYER + 0.01 * edge_weight, dir = d)

				if(d & NORTH) i.pixel_y = 32
				if(d & SOUTH) i.pixel_y = -32
				if(d & EAST) i.pixel_x = 32
				if(d & WEST) i.pixel_x = -32

				overlays += i

			has_edges = 1
			*/

		clear_edges()

			if(!has_edges) return

			overlays = null
			has_edges = 0



/turf/surf/land/loamy
	edge_weight = 2
/turf/surf/land/sandy
	edge_weight = 3
/turf/surf/water
	edge_weight = -1
/world
	proc
		generate_edges()
			set background = 1
			for(var/turf/t in world)
				t.generate_edges()

		clear_edges()
			set background = 1
			for(var/turf/t in world)
				t.clear_edges()

