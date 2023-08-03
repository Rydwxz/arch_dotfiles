-- Define your visual elements here
-- For examples, and a complete list on the possible elements and their
-- properties, go to https://github.com/fisadev/conky-draw/
-- (and be sure to use the lastest version)

elements = {
	{
	 kind = 'ring_graph',
     center = {x = 30, y = 110},
     conky_value = 'cpu cpu1',
     radius = 25,
     graduated = true,
     number_graduation=24,
     angle_between_graduation=3,
     start_angle = 0,
     end_angle = 360,
     color= 0x00ff59,
     background_color= 0x00d79e,
	 background_alpha= 1.0,
	},
}
