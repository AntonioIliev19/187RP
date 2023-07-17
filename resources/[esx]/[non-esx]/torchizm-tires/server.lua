ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('tires', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('torchizm-tires:Use', source)
end)

RegisterServerEvent('torchizm-tires:Used')
AddEventHandler('torchizm-tires:Used', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('tires', 1)
end)