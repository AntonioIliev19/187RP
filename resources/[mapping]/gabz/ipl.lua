Citizen.CreateThread(function()
	interiorID = GetInteriorAtCoords(311.2546, -592.4204, 42.32737)

	RemoveIpl("rc12b_fixed")
	RemoveIpl("rc12b_destroyed")
	RemoveIpl("rc12b_default")
	RequestIpl("rc12b_hospitalinterior_lod")
	RequestIpl("rc12b_hospitalinterior")

end)