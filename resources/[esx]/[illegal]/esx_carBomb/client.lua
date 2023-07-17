ESX = nil
local hasTicket, fighting, showing, working, warned = false, false, false, false, false
local ticketTime = 0
local enBomCars, poBomCars, msBomCars, stopBomCars, seatBomCars, servBomCars = {}, {}, {}, {}, {}, {}
local npcT = {}
local npc

-- ESX DEPENDANCY --
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	
	PlayerData = ESX.GetPlayerData()
	
end)

ObjectInFront = function(ped, pos)
	local entityWorld = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.5, 0.0)
	local car = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 30, ped, 0)
	local _, _, _, _, result = GetRaycastResult(car)
	return result
end

OpenDisarmMenu = function(ped, bt)
	local elements = {
		{ label = 'Confirm', value = 'yes' },
		{ label = 'Deny', value = 'no' }
	}
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'disarm', {
		title    = 'Disarm Old Bomb',
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'yes' then
			if bt == 'eng' then
				enBomCars = {}
			elseif bt == 'pos' then
				poBomCars = {}
			elseif bt == 'speed' then
				msBomCars = {}
			elseif bt == 'stop' then
				stopBomCars = {}
			elseif bt == 'seat' then
				seatBomCars = {}
			end
			menu.close()
		elseif data.current.value == 'no' then
			menu.close()
		end
	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent('esx_carBomb:recieveCars')
AddEventHandler('esx_carBomb:recieveCars', function(list)
	for i = 1,#list do
		table.insert(servBomCars, list[i])
	end
end)

RegisterNetEvent('esx_carBomb:checkCar')
AddEventHandler('esx_carBomb:checkCar', function()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local veh = ObjectInFront(ped, coords)
	if DoesEntityExist(veh) then
		if IsEntityAVehicle(veh) then
			for k,v in pairs(servBomCars) do
				if veh == v then
					ESX.ShowNotification('~r~High nitrogen concentration~s~')
				end
			end
		end
	end
end)

RegisterNetEvent('esx_carBomb:disarmCar')
AddEventHandler('esx_carBomb:disarmCar', function()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local veh = ObjectInFront(ped, coords)
	if DoesEntityExist(veh) then
		if IsEntityAVehicle(veh) then
			for k,v in pairs(servBomCars) do
				if veh == v then
					local dict
					local model = 'prop_carjack'
					local offset = GetOffsetFromEntityInWorldCoords(ped, 0.0, -2.0, 0.0)
					local headin = GetEntityHeading(ped)
					FreezeEntityPosition(veh, true)
					local vehpos = GetEntityCoords(veh)
					dict = 'mp_car_bomb'
					RequestAnimDict(dict)
					RequestModel(model)
					while not HasAnimDictLoaded(dict) or not HasModelLoaded(model) do
						Citizen.Wait(1)
					end
					local vehjack = CreateObject(GetHashKey(model), vehpos.x, vehpos.y, vehpos.z - 0.5, true, true, true)
					ESX.ShowNotification('Lifting vehicle with jack')
					AttachEntityToEntity(vehjack, veh, 0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1250, 1, 0.0, 1, 1)
					Citizen.Wait(1250)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.01, true, true, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
					Citizen.Wait(1000)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.025, true, true, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
					Citizen.Wait(1000)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.05, true, true, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
					Citizen.Wait(1000)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.1, true, true, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
					Citizen.Wait(1000)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.15, true, true, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
					Citizen.Wait(1000)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.2, true, true, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
					Citizen.Wait(1000)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.3, true, true, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
					dict = 'move_crawl'
					Citizen.Wait(1000)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.4, true, true, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.5, true, true, true)
					SetEntityCollision(veh, false, false)
					TaskPedSlideToCoord(ped, offset, headin, 1000)
					Citizen.Wait(1000)
					RequestAnimDict(dict)
					while not HasAnimDictLoaded(dict) do
						Citizen.Wait(100)
					end
					ESX.ShowNotification('Removing bomb')
					TaskPlayAnimAdvanced(ped, dict, 'onback_bwd', coords, 0.0, 0.0, headin - 180, 1.0, 0.5, 3000, 1, 0.0, 1, 1)
					dict = 'amb@world_human_vehicle_mechanic@male@base'
					Citizen.Wait(3000)
					RequestAnimDict(dict)
					while not HasAnimDictLoaded(dict) do
						Citizen.Wait(1)
					end
					TaskPlayAnim(ped, dict, 'base', 8.0, -8.0, 5000, 1, 0, false, false, false)
					dict = 'move_crawl'
					Citizen.Wait(5000)
					local coords2 = GetEntityCoords(ped)
					RequestAnimDict(dict)
					while not HasAnimDictLoaded(dict) do
						Citizen.Wait(1)
					end
					if veh == v then
						table.remove(servBomCars, k)
						TriggerServerEvent('esx_carBomb:removeCars', v)
					end
					TaskPlayAnimAdvanced(ped, dict, 'onback_fwd', coords2, 0.0, 0.0, headin - 180, 1.0, 0.5, 2000, 1, 0.0, 1, 1)
					Citizen.Wait(3000)
					dict = 'mp_car_bomb'
					RequestAnimDict(dict)
					while not HasAnimDictLoaded(dict) do
						Citizen.Wait(1)
					end
					ESX.ShowNotification('Lowering vehicle')
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1250, 1, 0.0, 1, 1)
					Citizen.Wait(1250)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.4, true, true, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
					Citizen.Wait(1000)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.3, true, true, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
					Citizen.Wait(1000)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.2, true, true, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
					Citizen.Wait(1000)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.15, true, true, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
					Citizen.Wait(1000)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.1, true, true, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
					Citizen.Wait(1000)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.05, true, true, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
					Citizen.Wait(1000)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.025, true, true, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
					dict = 'move_crawl'
					Citizen.Wait(1000)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.01, true, true, true)
					TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
					SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z, true, true, true)
					FreezeEntityPosition(veh, false)
					DeleteObject(vehjack)
					SetEntityCollision(veh, true, true)
				else
					ESX.ShowNotification('No bomb detected')
				end
			end
		end
	end
end)

RegisterNetEvent('esx_carBomb:giveTicket')
AddEventHandler('esx_carBomb:giveTicket', function()
	ticketTime = ticketTime + Config.TicketTime
	ESX.ShowNotification('You have recieved a ~g~Ticket~s~ for the ~g~Scrap Yard~s~ for '..tonumber(string.format('%.' .. (1) .. 'f', (ticketTime / 60)))..' minutes')
end)

RegisterNetEvent('esx_carBomb:craftBomb')
AddEventHandler('esx_carBomb:craftBomb', function(ped, coords)
	local dict
	local headin = GetEntityHeading(ped)
	dict = 'mini@repair'
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(1)
	end
	working = true
	local count = 0
	repeat
		TaskPlayAnimAdvanced(ped, dict, 'fixing_a_ped', coords, 0.0, 0.0, headin, 0.5, 0.01, 5000, 1, 0.0, 1, 1)
		Citizen.Wait(5000)
		count = count + 1
	until count == Config.WireCost
	Citizen.Wait(5000)
	working = false
end)

RegisterNetEvent('esx_carBomb:placeBomb')
AddEventHandler('esx_carBomb:placeBomb', function(ped, coords, veh)
	local dict
	local model = 'prop_carjack'
	local offset = GetOffsetFromEntityInWorldCoords(ped, 0.0, -2.0, 0.0)
	local headin = GetEntityHeading(ped)
	FreezeEntityPosition(veh, true)
	local vehpos = GetEntityCoords(veh)
	dict = 'mp_car_bomb'
	RequestAnimDict(dict)
	RequestModel(model)
	while not HasAnimDictLoaded(dict) or not HasModelLoaded(model) do
		Citizen.Wait(1)
	end
	local vehjack = CreateObject(GetHashKey(model), vehpos.x, vehpos.y, vehpos.z - 0.5, true, true, true)
	ESX.ShowNotification('Lifting vehicle with jack')
	AttachEntityToEntity(vehjack, veh, 0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1250, 1, 0.0, 1, 1)
	Citizen.Wait(1250)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.01, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.025, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.05, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.1, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.15, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.2, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.3, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	dict = 'move_crawl'
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.4, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.5, true, true, true)
	SetEntityCollision(veh, false, false)
	TaskPedSlideToCoord(ped, offset, headin, 1000)
	Citizen.Wait(1000)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
	ESX.ShowNotification('Placing bomb')
	TaskPlayAnimAdvanced(ped, dict, 'onback_bwd', coords, 0.0, 0.0, headin - 180, 1.0, 0.5, 3000, 1, 0.0, 1, 1)
	dict = 'amb@world_human_vehicle_mechanic@male@base'
	Citizen.Wait(3000)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(1)
	end
	TaskPlayAnim(ped, dict, 'base', 8.0, -8.0, 5000, 1, 0, false, false, false)
	dict = 'move_crawl'
	Citizen.Wait(5000)
	local coords2 = GetEntityCoords(ped)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(1)
	end
	TaskPlayAnimAdvanced(ped, dict, 'onback_fwd', coords2, 0.0, 0.0, headin - 180, 1.0, 0.5, 2000, 1, 0.0, 1, 1)
	Citizen.Wait(3000)
	dict = 'mp_car_bomb'
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(1)
	end
	ESX.ShowNotification('Lowering vehicle')
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1250, 1, 0.0, 1, 1)
	Citizen.Wait(1250)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.4, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.3, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.2, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.15, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.1, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.05, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.025, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	dict = 'move_crawl'
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.01, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z, true, true, true)
	FreezeEntityPosition(veh, false)
	DeleteObject(vehjack)
	SetEntityCollision(veh, true, true)
	TriggerServerEvent('esx_carBomb:storeCars', veh)
end)

RegisterNetEvent('esx_carBomb:getCar')
AddEventHandler('esx_carBomb:getCar', function()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local veh = ObjectInFront(ped, coords)
	if DoesEntityExist(veh) then
		if IsEntityAVehicle(veh) then
			local elements = {
				{ label = 'Make Engine Bomb', value = 'engb' },
				{ label = 'Make Posistion Bomb', value = 'posb' },
				{ label = 'Make Speed Bomb', value = 'speedb' },
				{ label = 'Make Stop Bomb', value = 'stopb' },
				{ label = 'Make Seat Bomb', value = 'seatb' }
			}
			ESX.UI.Menu.CloseAll()
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'bombtype', {
				title    = 'Bomb Type',
				align    = 'top-left',
				elements = elements
			}, function(data, menu)
				local bomb = data.current.value

				if bomb == 'engb' then
					if enBomCars[1] == nil then
						enBomCars[1] = veh
						SetEntityAsMissionEntity(veh, true, true)
						TriggerServerEvent('esx_carBomb:triggerBomb', ped, coords, veh)
					else
						ESX.ShowNotification('You may only place one ~r~Bomb~s~ of each type at a time')
						OpenDisarmMenu(ped, 'eng')
					end
					menu.close()
				elseif bomb == 'posb' then
					local pos = GetEntityCoords(veh)
					if poBomCars[1] == nil then
						poBomCars[1] = veh
						poBomCars[2] = pos
						SetEntityAsMissionEntity(veh, true, true)
						TriggerServerEvent('esx_carBomb:triggerBomb', ped, coords, veh)
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'choose_detonate_distance',
							{
								title = 'Bomb Detonate Distance'
							},
						function(data, menu)

							local detDis = tonumber(data.value)

							if detDis == nil then
								ESX.ShowNotification('The ~r~Distance~s~ needs to be above zero!')
							elseif detDis > 1500 then
								ESX.ShowNotification('The ~r~Distance~s~ needs to be below 1500, or the signal might not send!')
							else
								poBomCars[3] = detDis
								menu.close()
							end
						end, function(data, menu)
						end)
					else
						ESX.ShowNotification('You may only place one ~r~Bomb~s~ of each type at a time')
						OpenDisarmMenu(ped, 'pos')
					end
					menu.close()
				elseif bomb == 'speedb' then
					local pos = GetEntityCoords(veh)
					if msBomCars[1] == nil then
						msBomCars[1] = veh
						SetEntityAsMissionEntity(veh, true, true)
						TriggerServerEvent('esx_carBomb:triggerBomb', ped, coords, veh)
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'choose_bomb_speed',
							{
								title = 'Bomb Detonate Speed'
							},
						function(data, menu)

							local bombSpeed = tonumber(data.value)

							if bombSpeed == nil then
								ESX.ShowNotification('The ~g~Speed~s~ needs to be above zero!')
							elseif bombSpeed > 150 then
								ESX.ShowNotification('The ~g~Speed~s~ needs to be below 150!')
							else
								msBomCars[2] = bombSpeed
								menu.close()
							end
						end, function(data, menu)
						end)
					else
						ESX.ShowNotification('You may only place one ~r~Bomb~s~ of each type at a time')
						OpenDisarmMenu(ped, 'speed')
					end
					menu.close()
				elseif bomb == 'stopb' then
					local pos = GetEntityCoords(veh)
					if stopBomCars[1] == nil then
						stopBomCars[1] = veh
						stopBomCars[2] = pos
						SetEntityAsMissionEntity(veh, true, true)
						TriggerServerEvent('esx_carBomb:triggerBomb', ped, coords, veh)
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'choose_detonate_distance',
							{
								title = 'Bomb Detonate Distance'
							},
						function(data, menu)

							local detDis = tonumber(data.value)

							if detDis == nil then
								ESX.ShowNotification('The ~r~Distance~s~ needs to be above 5!')
							elseif detDis <= 5 then
								ESX.ShowNotification('The ~r~Distance~s~ needs to be above 5!')
							else
								stopBomCars[3] = detDis
								menu.close()
							end
						end, function(data, menu)
						end)
					else
						ESX.ShowNotification('You may only place one ~r~Bomb~s~ of each type at a time')
						OpenDisarmMenu(ped, 'stop')
					end
					menu.close()
				elseif bomb == 'seatb' then
					if seatBomCars[1] == nil then
						seatBomCars[1] = veh
						SetEntityAsMissionEntity(veh, true, true)
						TriggerServerEvent('esx_carBomb:triggerBomb', ped, coords, veh)
						ESX.ShowNotification('driver, pass, backdrive, backpass, farbackdrive, farbackpass')
						ESX.UI.Menu.CloseAll()
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'choose_bomb_seat',
							{
								title = 'Bomb Trigger Seat'
							},
						function(data, menu)

							local seat = data.value

							if seat == nil then
								ESX.ShowNotification('The ~b~Seat~s~ needs to be driver, pass, backdrive, backpass, farbackdriver, or farbackpass!')
							elseif seat == 'driver' then
								ESX.ShowNotification('Why are you wasting a ~b~Seat~s~ ~r~Bomb~s~ on a driver?!')
								seatBomCars[2] = -1
								menu.close()
							elseif seat == 'pass' then
							ESX.ShowNotification('Front passenger ~b~Seat~s~ armed!')
								seatBomCars[2] = 0
								menu.close()
							elseif seat == 'backdrive' then
								ESX.ShowNotification('Back left passenger ~b~Seat~s~ armed!')
								seatBomCars[2] = 1
								menu.close()
							elseif seat == 'backpass' then
								ESX.ShowNotification('Back right passenger ~b~Seat~s~ armed!')
								seatBomCars[2] = 2
								menu.close()
							elseif seat == 'farbackdrive' then
								ESX.ShowNotification('Far back left passenger ~b~Seat~s~ armed!')
								seatBomCars[2] = 3
								menu.close()
							elseif seat == 'farbackpass' then
								ESX.ShowNotification('Far back right passenger ~b~Seat~s~ armed!')
								seatBomCars[2] = 4
								menu.close()
							else
								ESX.ShowNotification('The ~b~Seat~s~ needs to be driver, pass, backdrive, backpass, farbackdriver, or farbackpass!')
							end
						end, function(data, menu)
						end)
					else
						ESX.ShowNotification('You may only place one ~r~Bomb~s~ of each type at a time')
						OpenDisarmMenu(ped, 'seat')
					end
					menu.close()
				end
			end, function(data, menu)
				menu.close()
			end)
		else
			ESX.ShowNotification('You must be facing a ~y~Vehicle~s~!')
		end
	else
		ESX.UI.Menu.CloseAll()
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'reverse_engineer', {
			title    = 'Reverse Engineer',
			align    = 'top-left',
			elements = {
				{label = 'Reverse to Defuser', value = 'reveng'},
				{label = 'Cancel', value = 'cancel'}
			}
		}, function(data, menu)
			if data.current.value == 'reveng' then
				TriggerServerEvent('esx_carBomb:createDefuser')
				menu.close()
			else
				menu.close()
			end
		end, function(data, menu)
		end)
	end
end)

AddEventHandler('esx:playerLoaded', function()
	TriggerServerEvent('esx_carBomb:sendCars')
end)

RegisterNetEvent('esx_carBomb:trespass')
AddEventHandler('esx_carBomb:trespass', function(ped)
    local x,y,z = table.unpack(GetEntityCoords(ped, false))
    local plyPos = GetEntityCoords(ped,  true)
    local streetName, crossing = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
    local streetName, crossing = GetStreetNameAtCoord(x, y, z)
    streetName = GetStreetNameFromHashKey(streetName)
    crossing = GetStreetNameFromHashKey(crossing)
	
	if Config.UseGCPhone then
        if crossing ~= nil then
            local coords      = GetEntityCoords(ped)

            TriggerServerEvent('esx_addons_gcphone:startCall', 'police', 'An intruder has entered our property at ' .. streetName .. ' and ' .. crossing, PlayerCoords, {
                PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z },
            })
        else
            TriggerServerEvent('esx_addons_gcphone:startCall', 'police', 'An intruder has entered our property at ' .. streetName, PlayerCoords, {
                PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z },
            })
        end
    else
		TriggerServerEvent('esx_carBomb:policeAlert', streetName)
	end
end)

Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		Citizen.Wait(1000)
		if ticketTime ~= 0 then
			hasTicket = true
			ticketTime = ticketTime - 1
			if ticketTime == 30 then
				ESX.ShowNotification('You have 30 seconds left on your ~g~Ticket~s~ time')
			end
		else
			hasTicket = false
			showing = false
		end
		local coords = GetEntityCoords(ped)
		for i = 1,#servBomCars do
			local carpos = GetEntityCoords(servBomCars[i])
			if enBomCars[1] ~= nil then
				if enBomCars[1] == servBomCars[i] then
					local enBomCar = enBomCars[1]
					local enCarPos = GetEntityCoords(enBomCar)
					local engineOn = GetIsVehicleEngineRunning(enBomCar)
					if engineOn ~= false then
						NetworkExplodeVehicle(enBomCar, true, false, 0)
						AddExplosion(enCarPos, 7, 2000, true, false, 50, false)
						SetEntityAsNoLongerNeeded(enBomCar)
						enBomCars[1] = nil
						ESX.ShowNotification('Bomb triggered')
					end
				end
			end
			if poBomCars[1] ~= nil then
				if poBomCars[1] == servBomCars[i] then
					local poBomCar = poBomCars[1]
					local poCarPos = GetEntityCoords(poBomCar)
					local startPos = poBomCars[2]
					if poBomCars[3] ~= nil then
						if GetDistanceBetweenCoords(poCarPos, startPos, true) > poBomCars[3] then
							NetworkExplodeVehicle(poBomCar, true, false, 0)
							AddExplosion(poCarPos, 7, 2000, true, false, 50, false)
							SetEntityAsNoLongerNeeded(poBomCar)
							poBomCars[1] = nil
							poBomCars[2] = nil
							poBomCars[3] = nil
							ESX.ShowNotification('Bomb triggered')
						end
					end
				end
			end
			if msBomCars[1] ~= nil then
				if msBomCars[1] == servBomCars[i] then
					local msBomCar = msBomCars[1]
					local msCarPos = GetEntityCoords(msBomCar)
					local speed = GetEntitySpeed(msBomCar)
					local mscSpeed
					if Config.UseKPH == true then
						mscSpeed = (speed * 3.6)
					else
						mscSpeed = (speed * 2.236936)
					end
					if msBomCars[2] ~= nil then
						if mscSpeed > msBomCars[2] then
							NetworkExplodeVehicle(msBomCar, true, false, 0)
							AddExplosion(msCarPos, 7, 2000, true, false, 50, false)
							SetEntityAsNoLongerNeeded(msBomCar)
							msBomCars[1] = nil
							msBomCars[2] = nil
							ESX.ShowNotification('Bomb triggered')
						end
					end
				end
			end
			if stopBomCars[1] ~= nil then
				if stopBomCars[1] == servBomCars[i] then
					local stopBomCar = stopBomCars[1]
					local stopCarPos = GetEntityCoords(stopBomCar)
					local startPos = stopBomCars[2]
					local stopcSpeed = GetEntitySpeed(stopBomCar)
					if stopBomCars[3] ~= nil then
						if GetDistanceBetweenCoords(stopCarPos, startPos, true) > stopBomCars[3] then
							if stopcSpeed == 0 then
								NetworkExplodeVehicle(stopBomCar, true, false, 0)
								AddExplosion(stopCarPos, 7, 2000, true, false, 50, false)
								SetEntityAsNoLongerNeeded(stopBomCar)
								stopBomCars[1] = nil
								stopBomCars[2] = nil
								stopBomCars[3] = nil
								ESX.ShowNotification('Bomb triggered')
							end
						end
					end
				end
			end
			if seatBomCars[1] ~= nil then
				if seatBomCars[1] == servBomCars[i] then
					local seatBomCar = seatBomCars[1]
					local seatCarPos = GetEntityCoords(seatBomCar)
					if seatBomCars[2] ~= nil then
						local empty = IsVehicleSeatFree(seatBomCar, seatBomCars[2])
						if empty == false then
							NetworkExplodeVehicle(seatBomCar, true, false, 0)
							AddExplosion(seatCarPos, 7, 2000, true, false, 50, false)
							SetEntityAsNoLongerNeeded(seatBomCar)
							seatBomCars[1] = nil
							seatBomCars[2] = nil
							ESX.ShowNotification('Bomb triggered')
						end
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()

	for loc,areas in pairs(Config.Zones.CollectZones) do
		local blip
		if loc == 'RecCenter' then
			blip = AddBlipForRadius(areas.Yard, 25.0)

			SetBlipColour(blip, 1)
			SetBlipAlpha(blip, 100)
			SetBlipDisplay(blip, 5)
			SetBlipAsShortRange(blip, true)
		elseif loc == 'HayesAuto' then
			blip = AddBlipForRadius(areas.Yard, 15.0)

			SetBlipColour(blip, 1)
			SetBlipAlpha(blip, 100)
			SetBlipDisplay(blip, 5)
			SetBlipAsShortRange(blip, true)
		else
			blip = AddBlipForRadius(areas.Yard, 20.0)

			SetBlipColour(blip, 1)
			SetBlipAlpha(blip, 100)
			SetBlipDisplay(blip, 5)
			SetBlipAsShortRange(blip, true)
		end
		blip = AddBlipForCoord(areas.Entrance)
		
		SetBlipSprite (blip, 276)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.0)
		SetBlipColour (blip, 2)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(loc)
		EndTextCommandSetBlipName(blip)
	end
	while true do
		local ped = PlayerPedId()
		Citizen.Wait(0)
		local coords = GetEntityCoords(ped)
		for k,v in pairs(Config.Zones) do
			for loc,areas in pairs(v) do
				if loc == 'SandyAirField' or loc == 'RecCenter' or loc == 'HayesAuto' or loc == 'MuriettaOilField' then
					if GetDistanceBetweenCoords(coords, areas.Entrance, true) < Config.DrawDistance then
						DrawMarker(29, areas.Entrance, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 50, 250, 100, 200, false, true, 2, false, 0, 0, false)
					end
					if GetDistanceBetweenCoords(coords, areas.Entrance, true) < 1.5 then
						ESX.ShowHelpNotification('Press ~g~E~s~ to interact with  ~g~Scrap Yard~s~')
						if IsControlJustReleased(0, 51) then
							local elements = {
								{label = 'Buy Ticket', value = 'buy'},
								{label = 'Give Trash', value = 'give'}
							}
							ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'scrap_yard', {
								title    = 'Scrap Yard',
								align    = 'top-left',
								elements = elements
							}, function(data, menu)
								if data.current.value == 'buy' then
									if GetDistanceBetweenCoords(coords, areas.Entrance, true) < 1.5 then
										TriggerServerEvent('esx_carBomb:sellTicket')
									end
									menu.close()
								elseif data.current.value == 'give' then
									if GetDistanceBetweenCoords(coords, areas.Entrance, true) < 1.5 then
										TriggerServerEvent('esx_carBomb:takeTrash')
									end
									menu.close()
								end
							end, function(data, menu)
								menu.close()
							end)
						end
					elseif ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'scrap_yard') then
						ESX.UI.Menu.CloseAll()
					end
				else
					if GetDistanceBetweenCoords(coords, areas, true) < Config.DrawDistance then
						DrawMarker(0, areas, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 50, 250, 100, 200, false, true, 2, false, 0, 0, false)
					end
					if GetDistanceBetweenCoords(coords, areas, true) < 1.5 then
						if k == 'ProcessZones' then
							if working == false then
								ESX.ShowHelpNotification('Press ~g~E~s~ to craft a ~r~Bomb~s~')
								if IsControlJustReleased(0, 51) then
									TriggerServerEvent('esx_carBomb:createBomb', ped, coords)
								end
							end
						elseif k == 'TeleInZones' then
							ESX.ShowHelpNotification('Press ~g~E~s~ to enter location')
							if IsControlJustReleased(0, 51) then
								for nloc,nareas in pairs(Config.Zones.TeleOutZones) do
									if nloc == loc then
										SetEntityCoords(ped, nareas, false, false, false, false)
									end
								end
							end
						elseif k == 'TeleOutZones' then
							ESX.ShowHelpNotification('Press ~g~E~s~ to exit location')
							if IsControlJustReleased(0, 51) then
								for nloc,nareas in pairs(Config.Zones.TeleInZones) do
									if nloc == loc then
										SetEntityCoords(ped, nareas, false, false, false, false)
									end
								end
							end
						end
					end
				end
			end
		end
		if GetDistanceBetweenCoords(coords, Config.Zones.CollectZones.RecCenter.Yard, true) < 25 then
			if hasTicket == false then
				if fighting == false then
					RequestModel(GetHashKey('a_m_m_hillbilly_01'))
					while not HasModelLoaded('a_m_m_hillbilly_01') do
						Citizen.Wait(1)
					end
					npc = CreatePed(0, GetHashKey('a_m_m_hillbilly_01'), Config.Zones.CollectZones.RecCenter.Yard, 100.0, true, false)
					npcT[1] = npc
					SetPedAsEnemy(npc, true)
					SetEntityInvincible(npc, true)
					TaskCombatPed(npc, ped, 0, 16)
					SetRelationshipBetweenGroups(5, -1285976420, GetHashKey('PLAYER'))
					SetRelationshipBetweenGroups(5, GetHashKey('PLAYER'), -1285976420)
					if Config.AlertCops then
						TriggerEvent('esx_carBomb:trespass', ped)
					end
					fighting = true
				end
			else
				if showing == false then
					ESX.ShowNotification('Search around for parts')
					SetRelationshipBetweenGroups(1, -1285976420, GetHashKey('PLAYER'))
					SetRelationshipBetweenGroups(1, GetHashKey('PLAYER'), -1285976420)
					showing = true
				else
					local currentpos = coords
					Citizen.Wait(1000)
					local newpos = GetEntityCoords(ped)
					if newpos ~= currentpos then
						local roll = math.random(50)
						local dict = 'amb@medic@standing@tendtodead@idle_a'
						local view = GetFollowPedCamViewMode()
						Citizen.Wait(1000)
						if view == 4 then
							if roll == 3 or roll == 9 or roll == 15 or roll == 27 or roll == 34 or roll == 49 then
								ESX.ShowNotification('You see something on the ground')
								Citizen.Wait(1000)
								RequestAnimDict(dict)
								while not HasAnimDictLoaded(dict) do
									Citizen.Wait(1)
								end
								TaskPlayAnim(ped, dict, 'idle_a', 8.0, -8.0, 3000, 1, 0.0, false, false, false)
								Citizen.Wait(2500)
								TriggerServerEvent('esx_carBomb:addPart')
							end
						else
							if roll == 3 or roll == 27 or roll == 49 then
								ESX.ShowNotification('You see something on the ground')
								Citizen.Wait(1000)
								RequestAnimDict(dict)
								while not HasAnimDictLoaded(dict) do
									Citizen.Wait(1)
								end
								TaskPlayAnim(ped, dict, 'idle_a', 8.0, -8.0, 3000, 1, 0.0, false, false, false)
								Citizen.Wait(2500)
								TriggerServerEvent('esx_carBomb:addPart')
							end
						end
					end
				end
			end
		elseif GetDistanceBetweenCoords(coords, Config.Zones.CollectZones.SandyAirField.Yard, true) < 20 then
			if hasTicket == false then
				if fighting == false then
					RequestModel(GetHashKey('a_m_m_hillbilly_01'))
					while not HasModelLoaded('a_m_m_hillbilly_01') do
						Citizen.Wait(1)
					end
					npc = CreatePed(0, GetHashKey('a_m_m_hillbilly_01'), Config.Zones.CollectZones.SandyAirField.Yard, 100.0, true, false)
					npcT[1] = npc
					SetPedAsEnemy(npc, true)
					SetEntityInvincible(npc, true)
					TaskCombatPed(npc, ped, 0, 16)
					SetRelationshipBetweenGroups(5, -1285976420, GetHashKey('PLAYER'))
					SetRelationshipBetweenGroups(5, GetHashKey('PLAYER'), -1285976420)
					if Config.AlertCops then
						TriggerEvent('esx_carBomb:trespass', ped)
					end
					fighting = true
				end
			else
				if showing == false then
					ESX.ShowNotification('Search around for parts')
					SetRelationshipBetweenGroups(1, -1285976420, GetHashKey('PLAYER'))
					SetRelationshipBetweenGroups(1, GetHashKey('PLAYER'), -1285976420)
					showing = true
				else
					local currentpos = coords
					Citizen.Wait(1000)
					local newpos = GetEntityCoords(ped)
					if newpos ~= currentpos then
						local roll = math.random(50)
						local dict = 'amb@medic@standing@tendtodead@idle_a'
						local view = GetFollowPedCamViewMode()
						Citizen.Wait(1000)
						if view == 4 then
							if roll == 3 or roll == 9 or roll == 15 or roll == 27 or roll == 34 or roll == 49 then
								ESX.ShowNotification('You see something on the ground')
								Citizen.Wait(1000)
								RequestAnimDict(dict)
								while not HasAnimDictLoaded(dict) do
									Citizen.Wait(1)
								end
								TaskPlayAnim(ped, dict, 'idle_a', 8.0, -8.0, 3000, 1, 0.0, false, false, false)
								Citizen.Wait(2500)
								TriggerServerEvent('esx_carBomb:addPart')
							end
						else
							if roll == 3 or roll == 27 or roll == 49 then
								ESX.ShowNotification('You see something on the ground')
								Citizen.Wait(1000)
								RequestAnimDict(dict)
								while not HasAnimDictLoaded(dict) do
									Citizen.Wait(1)
								end
								TaskPlayAnim(ped, dict, 'idle_a', 8.0, -8.0, 3000, 1, 0.0, false, false, false)
								Citizen.Wait(2500)
								TriggerServerEvent('esx_carBomb:addPart')
							end
						end
					end
				end
			end
		elseif GetDistanceBetweenCoords(coords, Config.Zones.CollectZones.MuriettaOilField.Yard, true) < 25 then
			if hasTicket == false then
				if fighting == false then
					RequestModel(GetHashKey('a_m_m_hillbilly_01'))
					while not HasModelLoaded('a_m_m_hillbilly_01') do
						Citizen.Wait(1)
					end
					npc = CreatePed(0, GetHashKey('a_m_m_hillbilly_01'), Config.Zones.CollectZones.MuriettaOilField.Yard, 100.0, true, false)
					npcT[1] = npc
					SetPedAsEnemy(npc, true)
					SetEntityInvincible(npc, true)
					TaskCombatPed(npc, ped, 0, 16)
					SetRelationshipBetweenGroups(5, -1285976420, GetHashKey('PLAYER'))
					SetRelationshipBetweenGroups(5, GetHashKey('PLAYER'), -1285976420)
					if Config.AlertCops then
						TriggerEvent('esx_carBomb:trespass', ped)
					end
					fighting = true
				end
			else
				if showing == false then
					ESX.ShowNotification('Search around for parts')
					SetRelationshipBetweenGroups(1, -1285976420, GetHashKey('PLAYER'))
					SetRelationshipBetweenGroups(1, GetHashKey('PLAYER'), -1285976420)
					showing = true
				else
					local currentpos = coords
					Citizen.Wait(1000)
					local newpos = GetEntityCoords(ped)
					if newpos ~= currentpos then
						local roll = math.random(50)
						local dict = 'amb@medic@standing@tendtodead@idle_a'
						local view = GetFollowPedCamViewMode()
						Citizen.Wait(1000)
						if view == 4 then
							if roll == 3 or roll == 9 or roll == 15 or roll == 27 or roll == 34 or roll == 49 then
								ESX.ShowNotification('You see something on the ground')
								Citizen.Wait(1000)
								RequestAnimDict(dict)
								while not HasAnimDictLoaded(dict) do
									Citizen.Wait(1)
								end
								TaskPlayAnim(ped, dict, 'idle_a', 8.0, -8.0, 3000, 1, 0.0, false, false, false)
								Citizen.Wait(2500)
								TriggerServerEvent('esx_carBomb:addPart')
							end
						else
							if roll == 3 or roll == 27 or roll == 49 then
								ESX.ShowNotification('You see something on the ground')
								Citizen.Wait(1000)
								RequestAnimDict(dict)
								while not HasAnimDictLoaded(dict) do
									Citizen.Wait(1)
								end
								TaskPlayAnim(ped, dict, 'idle_a', 8.0, -8.0, 3000, 1, 0.0, false, false, false)
								Citizen.Wait(2500)
								TriggerServerEvent('esx_carBomb:addPart')
							end
						end
					end
				end
			end
		elseif GetDistanceBetweenCoords(coords, Config.Zones.CollectZones.HayesAuto.Yard, true) < 15 then
			if hasTicket == false then
				if fighting == false then
					RequestModel(GetHashKey('a_m_m_hillbilly_01'))
					while not HasModelLoaded('a_m_m_hillbilly_01') do
						Citizen.Wait(1)
					end
					npc = CreatePed(0, GetHashKey('a_m_m_hillbilly_01'), Config.Zones.CollectZones.HayesAuto.Yard, 100.0, true, false)
					npcT[1] = npc
					SetPedAsEnemy(npc, true)
					SetEntityInvincible(npc, true)
					TaskCombatPed(npc, ped, 0, 16)
					SetRelationshipBetweenGroups(5, -1285976420, GetHashKey('PLAYER'))
					SetRelationshipBetweenGroups(5, GetHashKey('PLAYER'), -1285976420)
					if Config.AlertCops then
						TriggerEvent('esx_carBomb:trespass', ped)
					end
					fighting = true
				end
			else
				if showing == false then
					ESX.ShowNotification('Search around for parts')
					SetRelationshipBetweenGroups(1, -1285976420, GetHashKey('PLAYER'))
					SetRelationshipBetweenGroups(1, GetHashKey('PLAYER'), -1285976420)
					showing = true
				else
					local currentpos = coords
					Citizen.Wait(1000)
					local newpos = GetEntityCoords(ped)
					if newpos ~= currentpos then
						local roll = math.random(50)
						local dict = 'amb@medic@standing@tendtodead@idle_a'
						local view = GetFollowPedCamViewMode()
						Citizen.Wait(1000)
						if view == 4 then
							if roll == 3 or roll == 9 or roll == 15 or roll == 27 or roll == 34 or roll == 49 then
								ESX.ShowNotification('You see something on the ground')
								Citizen.Wait(1000)
								RequestAnimDict(dict)
								while not HasAnimDictLoaded(dict) do
									Citizen.Wait(1)
								end
								TaskPlayAnim(ped, dict, 'idle_a', 8.0, -8.0, 3000, 1, 0.0, false, false, false)
								Citizen.Wait(2500)
								TriggerServerEvent('esx_carBomb:addPart')
							end
						else
							if roll == 3 or roll == 27 or roll == 49 then
								ESX.ShowNotification('You see something on the ground')
								Citizen.Wait(1000)
								RequestAnimDict(dict)
								while not HasAnimDictLoaded(dict) do
									Citizen.Wait(1)
								end
								TaskPlayAnim(ped, dict, 'idle_a', 8.0, -8.0, 3000, 1, 0.0, false, false, false)
								Citizen.Wait(2500)
								TriggerServerEvent('esx_carBomb:addPart')
							end
						end
					end
				end
			end
		else
			if fighting == true then
				npc = npcT[1]
				SetPedAsEnemy(npc, false)
				SetEntityInvincible(npc, false)
				ClearPedTasks(npc)
				SetRelationshipBetweenGroups(1, -1285976420, GetHashKey('PLAYER'))
				SetRelationshipBetweenGroups(1, GetHashKey('PLAYER'), -1285976420)
				SetEntityAsNoLongerNeeded(npc)
				fighting = false
			end
			if showing == true then
				showing = false
			end
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		ESX.UI.Menu.CloseAll()
		npc = npcT[1]
		SetPedAsEnemy(npc, false)
		SetEntityInvincible(npc, false)
		ClearPedTasks(npc)
		SetRelationshipBetweenGroups(1, -1285976420, GetHashKey('PLAYER'))
		SetRelationshipBetweenGroups(1, GetHashKey('PLAYER'), -1285976420)
		SetEntityAsNoLongerNeeded(npc)
	end
end)