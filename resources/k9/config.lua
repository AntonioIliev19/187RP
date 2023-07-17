K9Config = {}
K9Config = setmetatable(K9Config, {})

K9Config.OpenMenuIdentifierRestriction = false
K9Config.OpenMenuPedRestriction = false
K9Config.LicenseIdentifiers = {
	"license:166217c7c157f10555bfe50504c1c6bf2dfd0eb6"
}
K9Config.SteamIdentifiers = {
	"steam:11000010d0f1e23"
}
K9Config.PedsList = {
	"s_m_y_cop_01",
	"s_m_y_sheriff_01"
}

-- Restricts the dog to getting into certain vehicles
K9Config.VehicleRestriction = false
K9Config.VehiclesList = {
	
}

-- Searching Type ( RANDOM [AVAILABLE] | VRP [NOT AVAILABLE] | ESX [NOT AVAILABLE] )
K9Config.SearchType = "Random"
K9Config.OpenDoorsOnSearch = false

-- Used for Random Search Type --
K9Config.Items = {
	{item = "coke", illegal = true},
	{item = "weed", illegal = true},
	{item = "Blunt Spray", illegal = false},
	{item = "Crowbar", illegal = false},
	{item = "lockpick", illegal = false},
	{item = "Baggies", illegal = false},
	{item = "Used Needle", illegal = false},
	{item = "Open Container", illegal = false},
}

-- Language --
K9Config.LanguageChoice = "English"
K9Config.Languages = {
	["English"] = {
		follow = "Come",
		stop = "Heel",
		attack = "Bite",
		enter = "In",
		exit = "Out"
	}
}