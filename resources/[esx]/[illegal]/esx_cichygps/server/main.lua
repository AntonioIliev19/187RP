ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('lokalizator', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)


	TriggerClientEvent('esx_cichygps:lokalizator', source)

end)




  RegisterServerEvent('esx_cichygps:zabierz')
  AddEventHandler('esx_cichygps:zabierz', function()
    local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('lokalizator', 1)

end)

