function SetData()
	players = {}
	for _, player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		table.insert( players, player )
end

	
	local name = GetPlayerName(PlayerId())
	local id = GetPlayerServerId(PlayerId())
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', "~r~187 RolePlay~s~ | Discord : ~g~discord.gg/D4k3wFR~s~ | ID: "..id.." | ~r~".. #players .." в града")
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		SetData()
	end
end)

Citizen.CreateThread(function()
    AddTextEntry("PM_PANE_LEAVE", "~r~Излезте ~w~от~y~ 187 RolePlay 😭")
end)

Citizen.CreateThread(function()
    AddTextEntry("PM_PANE_QUIT", "~r~Изключете ~o~FiveM 🐌")
end)

---------------------------------
--- Copyright by ikNox#6088 ---
---------------------------------