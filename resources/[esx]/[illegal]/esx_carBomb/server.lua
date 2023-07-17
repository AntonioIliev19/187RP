local ESX = nil
local bombedCars = {}

-- ESX DEPENDANCY --
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('engbomb', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local carJack = xPlayer.getInventoryItem('carjack')
	if carJack.count < 1 then
		TriggerClientEvent('esx:showNotification', source, 'You need a ~b~Car Jack~s~!')
	else
		TriggerClientEvent('esx_carBomb:getCar', source)
	end
end)

ESX.RegisterUsableItem('speccheck', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local roll = math.random(50)
	if roll == 9 or roll == 24 or roll == 47 then
		TriggerClientEvent('esx:showNotification', _source, 'You notice you have broken your ~b~Spec Checker~s~')
		xPlayer.removeInventoryItem('speccheck', 1)
	else
		TriggerClientEvent('esx_carBomb:checkCar', _source)
	end
end)

ESX.RegisterUsableItem('defuser', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local roll = math.random(50)
	local carJack = xPlayer.getInventoryItem('carjack')
	if carJack.count < 1 then
		TriggerClientEvent('esx:showNotification', _source, 'You need a ~b~Car Jack~s~!')
	else
		if Config.PoliceOnly then
			if xPlayer.job.name == 'police' then
				if roll == 9 or roll == 24 or roll == 47 then
					TriggerClientEvent('esx:showNotification', _source, 'You notice you have broken your ~g~Defuser~s~')
					xPlayer.removeInventoryItem('defuser', 1)
				else
					TriggerClientEvent('esx_carBomb:disarmCar', _source)
				end
			else
				print(('esx_carBomb: %s attempted to defuse a car (not police)!'):format(xPlayer.identifier))
			end
		else
			if roll == 9 or roll == 24 or roll == 47 then
				TriggerClientEvent('esx:showNotification', _source, 'You notice you have broken your ~g~Defuser~s~')
				xPlayer.removeInventoryItem('defuser', 1)
			else
				TriggerClientEvent('esx_carBomb:disarmCar', _source)
			end
		end
	end
end)

RegisterServerEvent('esx_carBomb:addPart')
AddEventHandler('esx_carBomb:addPart', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local roll = math.random(30)
	if roll == 3 or roll == 17 then
		xPlayer.addInventoryItem('bombpart1', 1)
	elseif roll == 7 or roll == 16 or roll == 24 or roll == 30 then
		xPlayer.addInventoryItem('bombpart2', 1)
	elseif roll == 11 or roll == 20 then
		xPlayer.addInventoryItem('bombpart3', 1)
	elseif roll == 1 then
		xPlayer.addMoney(1)
		TriggerClientEvent('esx:showNotification', _source, 'You found a dollar coin')
	else
		xPlayer.addInventoryItem('trash', 1)
	end
end)

RegisterServerEvent('esx_carBomb:createBomb')
AddEventHandler('esx_carBomb:createBomb', function(ped, coords)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local part1 = xPlayer.getInventoryItem('bombpart1')
	local part2 = xPlayer.getInventoryItem('bombpart2')
	local part3 = xPlayer.getInventoryItem('bombpart3')
	local bomb = xPlayer.getInventoryItem('engbomb')
	local count = 0
	if part1.count >= 1 then
		if part2.count >= Config.WireCost then
			if part3.count >= 1 then
				if bomb.count < bomb.limit then
					TriggerClientEvent('esx_carBomb:craftBomb', _source, ped, coords)
						xPlayer.removeInventoryItem('bombpart1', 1)
					repeat
						Citizen.Wait(5000)
						xPlayer.removeInventoryItem('bombpart2', 1)
						count = count + 1
					until count == Config.WireCost
					Citizen.Wait(3000)
					xPlayer.removeInventoryItem('bombpart3', 1)
					Citizen.Wait(2000)
					xPlayer.addInventoryItem('engbomb', 1)
				else
					TriggerClientEvent('esx:showNotification', _source, 'You already have too many ~r~Bombs~s~!')
				end
			else
				TriggerClientEvent('esx:showNotification', _source, 'You must have a ~r~Trigger~s~')
			end
		else
			TriggerClientEvent('esx:showNotification', _source, 'You do not have enough ~y~Wires~s~')
		end
	else
		TriggerClientEvent('esx:showNotification', _source, 'You must have a ~g~Casing~s~!')
	end
end)

RegisterServerEvent('esx_carBomb:createDefuser')
AddEventHandler('esx_carBomb:createDefuser', function(ped, coords)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local defus = xPlayer.getInventoryItem('defuser')
	local spec = xPlayer.getInventoryItem('speccheck')
	local bomb = xPlayer.getInventoryItem('engbomb')
	local count = 0
	if defus.count < defus.limit then
		if bomb.count >= 1 then
			if spec.count < spec.limit then
				xPlayer.removeInventoryItem('engbomb', 1)
				xPlayer.addInventoryItem('speccheck', 1)
				xPlayer.addInventoryItem('defuser', 1)
			else
				xPlayer.removeInventoryItem('engbomb', 1)
				xPlayer.addInventoryItem('defuser', 1)
				TriggerClientEvent('esx:showNotification', _source, 'You already have a ~g~Spectrometer~s~!')
			end
		else
			TriggerClientEvent('esx:showNotification', _source, 'You must have a ~r~Bomb~s~')
		end
	else
		TriggerClientEvent('esx:showNotification', _source, 'You already have a ~g~Defuser~s~!')
	end
end)


RegisterServerEvent('esx_carBomb:sellTicket')
AddEventHandler('esx_carBomb:sellTicket', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getMoney() >= Config.TicketCost then
		xPlayer.removeMoney(Config.TicketCost)
		TriggerClientEvent('esx_carBomb:giveTicket', _source)
	else
		TriggerClientEvent('esx:showNotification', _source, 'You do not have enough ~g~Cash~s~!')
	end
end)

RegisterServerEvent('esx_carBomb:takeTrash')
AddEventHandler('esx_carBomb:takeTrash', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local _xTrash = xPlayer.getInventoryItem('trash')
	if _xTrash.count ~= 0 then
		local rem = _xTrash.count % 5
		xPlayer.removeInventoryItem('trash', (_xTrash.count - rem))
		xPlayer.addMoney(_xTrash.count * (1/5))
	else
		TriggerClientEvent('esx:showNotification', _source, 'You have no ~r~Trash~s~')
	end
end)

RegisterServerEvent('esx_carBomb:triggerBomb')
AddEventHandler('esx_carBomb:triggerBomb', function(ped, coords, veh)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('engbomb', 1)
	TriggerClientEvent('esx_carBomb:placeBomb', _source, ped, coords, veh)
end)

RegisterServerEvent('esx_carBomb:storeCars')
AddEventHandler('esx_carBomb:storeCars', function(veh)
	table.insert(bombedCars, veh)
	TriggerEvent('esx_carBomb:sendCars')
end)

RegisterServerEvent('esx_carBomb:removeCars')
AddEventHandler('esx_carBomb:removeCars', function(veh)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local bomb = xPlayer.getInventoryItem('engbomb')
	for k,v in pairs(bombedCars) do
		if veh == v then
			table.remove(bombedCars, k)
		end
	end
	if bomb.count < bomb.limit then
		xPlayer.addInventoryItem('engbomb', 1)
	else
		TriggerClientEvent('esx:showNotification', _source, 'You cannot carry another ~r~Bomb~s~!')
	end
	TriggerEvent('esx_carBomb:sendCars')
end)

RegisterServerEvent('esx_carBomb:sendCars')
AddEventHandler('esx_carBomb:sendCars', function(veh)
	TriggerClientEvent('esx_carBomb:recieveCars', -1, bombedCars)
end)

RegisterServerEvent('esx_carBomb:policeAlert')
AddEventHandler('esx_carBomb:policeAlert', function(streetName)
	local _source = source
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], 'An intruder has entered our property at ' .. streetName)
		end
	end
end)