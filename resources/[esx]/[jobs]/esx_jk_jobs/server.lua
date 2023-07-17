ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_jk_jobs:setJobt')
AddEventHandler('esx_jk_jobs:setJobt', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("slaughterer", 0)-- 0 is job grade
	TriggerClientEvent('esx:showNotification', source, 'Ти беше нает ~g~' .. xPlayer.getName())
end)

RegisterServerEvent('esx_jk_jobs:setJobp')Vous avez été engagé
AddEventHandler('esx_jk_jobs:setJobp', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("lumberjack", 0)-- 0 is job grade
	TriggerClientEvent('esx:showNotification', source, 'Ти беше нает  ~g~' .. xPlayer.getName())
end)

RegisterServerEvent('esx_jk_jobs:setJobn')
AddEventHandler('esx_jk_jobs:setJobn', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("tailor", 0) -- 0 is job grade
	TriggerClientEvent('esx:showNotification', source, 'Ти беше нает  ~g~' .. xPlayer.getName())	
end)

RegisterServerEvent('esx_jk_jobs:setJobb')
AddEventHandler('esx_jk_jobs:setJobb', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("unemployed", 0) -- 0 is job grade
	TriggerClientEvent('esx:showNotification', source, 'Ти беше нает  ~g~' .. xPlayer.getName())	
end)