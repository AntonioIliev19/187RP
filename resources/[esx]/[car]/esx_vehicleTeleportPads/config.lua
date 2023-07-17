--Script Name: esx_vehicleTeleportPads.
--Description: Teleport vehicles with people, or just people without a vehicle from one location to another location.
--Author: Unknown.
--Modified by: BossManNz.
--Credits: ElPumpo, TheStonedTurtle.

Config              = {}

Config.DrawDistance = 100.0

Config.Marker = {
	Type = 36,
	x = 1.5, y = 1.5, z = 1.5,
	r = 255, g = 55, b = 55
}

Config.Pads = {

	MartinHouseIn = {
		Text = 'Натисни ~INPUT_CONTEXT~ за да излезеш от ~y~гаража~w~.',
		Marker = { x = 231.654, y = -1004.142, z = -98.999 },
		TeleportPoint = { x = 229.671, y = -799.446, z = 28.577, h = 0.77 }
	}

}