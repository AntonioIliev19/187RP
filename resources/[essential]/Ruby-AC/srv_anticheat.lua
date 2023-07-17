local events = {
	'HCheat:TempDisableDetection',
	'BsCuff:Cuff696999',
	'police:cuffGranted',
	'mellotrainer:adminTempBan',
	'AdminMenu:giveCash',
	'AdminMenu:giveBank',
	'AdminMenu:giveDirtyMoney',
	'esx-qalle-jail:jailPlayer',
	'kickAllPlayer',
	'esx_gopostaljob:pay',
	'esx_banksecurity:pay',
	'esx_slotmachine:sv:2',
	'vrp_slotmachine:server:2',
	'esx_drugs:startHarvestCoke',
	'esx_drugs:startHarvestMeth',
	'esx_drugs:startHarvestWeed',
	'esx_drugs:startHarvestOpium',

	-- Ajouts de detection KRZ
	'KorioZ-PersonalMenu:Weapon_addAmmoToPedS',
	'KorioZ-PersonalMenu:Admin_BringS',
	'KorioZ-PersonalMenu:Admin_giveCash',
	'KorioZ-PersonalMenu:Admin_giveBank',
	'KorioZ-PersonalMenu:Admin_giveDirtyMoney',
	'KorioZ-PersonalMenu:Boss_promouvoirplayer',
	'KorioZ-PersonalMenu:Boss_destituerplayer',
	'KorioZ-PersonalMenu:Boss_recruterplayer',
	'KorioZ-PersonalMenu:Boss_virerplayer',
}

local eventsAdmin = {
	'Admin2Menu:giveCash',
	'Admin2Menu:giveBank',
	'Admin2Menu:giveDirtyMoney',
}

local Text               = {}
local lastduree          = ""
local lasttarget         = ""
local BanList            = {}
local BanListLoad        = false
local BanListHistory     = {}
local BanListHistoryLoad = false

Users = {}
violations = {}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('AC:GetGroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local group = xPlayer.getGroup()
	cb(group)
   end)

platenum = math.random(00001, 99998)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		local r = math.random(00001, 99998)
		platenum = r
	end
end)


GodModKickMessage = "¡TRAMPA DETECTADA! HA SIDO EXCLUIDO DEL SERVIDOR - [Cheat detectado #].".. platenum .."]."
kickMessage = "¡TRAMPA DETECTADA! NO SE LE PERMITE JUGAR AQUÍ! [Mod Menu detectado #".. platenum .."]."
kickMessagePolice = "DETECCIÓN DE ROBO DE VEHÍCULOS! No se permite el robo de vehículos de servicio de la policía/ems! Por favor, lea el reglamento. [Detección #".. platenum .."]."
BanMessageLuaInjection = "LUA MOD MENU / INYECCIÓN DETECTADA - ESTÁ GLOBALMENTE PROHIBIDO EN ESTE SERVIDOR [Ban ID: #".. platenum .."]."
BanMessageHealthHack = "TRAMPA DETECTADA - USTED ESTÁ GLOBALMENTE PROHIBIDO EN ESTGive D'argent détectéE SERVIDOR [Ban ID: #".. platenum .."]."
KickSessionSolo = "SESIÓN SOLO DETECTADA - Ha sido expulsado del servidor, por favor reconéctese. [Detección #".. platenum .."]."

function SendWebhookMessageStaff(webhook,message)
	webhook = "https://discordapp.com/api/webhooks/661307521289420800/j3GFvn7IM10dreP6VFeVuD2AU2zd4EKCyVNmMrnqAa_rncr24dyTMqHKsMje7vlY4Lbp"
	if webhook ~= "none" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

for i=1, #eventsAdmin, 1 do
	RegisterServerEvent(eventsAdmin[i])
	AddEventHandler(eventsAdmin[i], function()
		local _source = source
		TriggerEvent('AC:AdminDetected', eventsAdmin[i], _source, true)
	end)
end

RegisterServerEvent('AC:AdminDetected')
	AddEventHandler('AC:AdminDetected', function(source, isServerEvent)
		name = GetPlayerName(source)
		SendWebhookMessageStaff(webhook,"**Dar dinero detectado!** \n```diff\nJugador: "..name.."\nID del jugador: "..source.."\n\n- La persona esta dando dinero a travez de menu de admin\n+ Anticheat Flags: [Detection #".. platenum .."].```")

	end)

RegisterServerEvent('AC:VehModdeur')
AddEventHandler('AC:VehModdeur', function(car, modele, carName)
	--SendWebhookMessage(webhook,"**RUBY - AC | Suppression de véhicule**```\n\nVehicule ID: "..car.."\nModèle: "..modele.."\nNom: "..carName.."\n\n[Detection #".. platenum .."].``` ")
end)

function SendWebhookMessage(webhook,message)
	webhook = "https://discordapp.com/api/webhooks/627203187367215106/Ek-fNkbywAVNeDGDeQpxDzmfcERCDjLGQhw2OTdAL0ZdlCu4hLygc-QvOKM8s_dl_tt3"
	if webhook ~= "none" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end


for i=1, #events, 1 do
	RegisterServerEvent(events[i])
	AddEventHandler(events[i], function()
		local _source = source
		TriggerEvent('AC:injectionDetected', events[i], _source, true)
	end)
end

RegisterServerEvent('AC:LittleDetection')
	AddEventHandler('AC:LittleDetection', function(invincible,oldHealth, newHealth, curWait)
			name = GetPlayerName(source)

			WarnPlayer(name)
			--print('===========================================')
			--print(' ')
			--print(' ')
			--print(' ')
			--print(' ')
			--print('^1Player id ^0[' .. source .. '] ^1à essayer d\'utiliser un cheat de health: ^0'..newHealth-oldHealth..'hp ( to reach '..newHealth..'hp ) in '..curWait..'ms! ^1 | nom de la personne : ^0[' .. name .. ']')
			--print(' ')
			--print(' ')
			--print(' ')
			--print(' ')
			--print('===========================================')
			--SendWebhookMessage(webhook,"**Health Hack Detected!** \n```diff\nJoueurs: "..name.."\nID du joueurs: "..source.."\n- Nombre(s) de détéction: \n\n- Régénération de :"..newHealth-oldHealth.."HP\n- HP après la régen: "..newHealth.."\n- Temps pour avoir "..newHealth..": "..curWait.."ms!\n+ Anticheat Flags: ( La régenération à été forcé )\n[Detection #".. platenum .."].```")

			if newHealth > 201 then
				TriggerEvent("RubyAntiCheat:Ban", 'Ruby_Anti_Cheat', source, 0, BanMessageHealthHack)
				TriggerClientEvent('chatMessage', -1, "RUBY - AC", {255, 0, 0}, "El jugador: " .. name .. " está banneado: "..BanMessageHealthHack.."")
				SendWebhookMessage(webhook,"**¡Detectado Health Hack!: "..name.."\nID jugador: "..source.."\n- Número(s) de detección: 1 - Regeneración de :"..newHealth-oldHealth.."HP\n- HP después de la regeneración: "..newHealth.."\n- Tiempo para conseguir "..newHealth..": "..curWait.."ms!\n+ Banderas Anticorrupción: [Detección]".. platenum .."].```")
				SendWebhookMessageStaff(webhook,"**Mod Menu detectado!** \n```Diferenciación: "..name.."\nID jugador: "..source.."\n- Número(s) de detección: 1 - Regeneración de :"..newHealth-oldHealth.."HP después de la regeneración...: "..newHealth.."\n- Tiempo para conseguir "..newHealth..": "..curWait.."ms!\n+ Banderas Anticheat: ( El jugador fue baneado perma después de "..avert.." detección de servidores. Prohibir la identificación: #".. platenum .."]. )```")
			
			--else
			--	SendWebhookMessage(webhook,"**Health Hack Detected!** \n```diff\nJoueurs: "..name.."\nID du joueurs: "..source.."\n- Nombre(s) de détéction: \n\n- Régénération de :"..newHealth-oldHealth.."HP\n- HP après la régen: "..newHealth.."\n- Temps pour avoir "..newHealth..": "..curWait.."ms!\n+ Anticheat Flags: ( False positive possible )\n[Detection #".. platenum .."].```")
			end


	end)

RegisterServerEvent('AC:PoliceVehicule')
	AddEventHandler('AC:PoliceVehicule', function()
			name = GetPlayerName(source)
			--DropPlayer(source, kickMessagePolice)
	end)

RegisterServerEvent('AC:GodModDetected')
	AddEventHandler('AC:GodModDetected', function(source)

		local s = source
		nom = GetPlayerName(source)
	
	
		print('===========================================')
		print(' ')
		print(' ')
		print(' ')
		print(' ')
		print('^1Player id ^0[' .. source .. '] ^Uno fue prohibido un día después de cinco detecciones. Nombre del evento. : ^0[' .. nom .. ']')
		print(' ')
		print(' ')
		print(' ')
		print(' ')
		print('===========================================')
		SendWebhookMessageStaff(webhook,"**Mod Menu detectado!** \n```diff\nJugador: "..nom.."\nID Jugador: "..source.."\n\n- Número(s) de Detección: 1\n+ Banderas Anticorrupción: ( El jugador fue baneado perma después de "..avert.." detección de servidores. [Ban ID: #".. platenum .."]. )```")
		TriggerEvent("RubyAntiCheat:Ban", 'Ruby_Anti_Cheat', source, 0, BanMessageHealthHack)
		TriggerClientEvent('chatMessage', -1, "RUBY - AC", {255, 0, 0}, "El jugador: " .. nom .. " está banneado: "..BanMessageHealthHack.."")
	
		--DropPlayer(source, BanMessageHealthHack)
	
	end)

RegisterServerEvent('AC:injectionDetected')
AddEventHandler('AC:injectionDetected', function(name, source, isServerEvent)

	local eventType = 'client'
	local s = source
	local nom = GetPlayerName(source)

	if isServerEvent then
		eventType = 'server'
	end

	print('===========================================')
	print(' ')
	print(' ')
	print(' ')
	print(' ')
	print('^1Player id ^0[' .. source .. '] ^1 tratando de usar un evento del tipo...: ^0' .. eventType .. ' ^1 | nombre del evento : ^0[' .. name .. ']')
	print(' ')
	print(' ')
	print(' ')
	print(' ')
	print('===========================================')
	SendWebhookMessageStaff(webhook,"**Mod Menu detectado!** \n```diff\nJugador: "..nom.."\nID Jugador: "..source.."\n\n- Tipo de evento utilizado : " .. eventType .. "\n- Nombre del evento utilizado : " .. name .. "\n+ Banderas Anticorrupción: ( El jugador ha sido bloqueado permanentemente del servidor. [Ban ID: #".. platenum .."]. )```")
	
	TriggerEvent("RubyAntiCheat:Ban", 'Ruby_Anti_Cheat', source, 0, BanMessageLuaInjection)
	TriggerClientEvent('chatMessage', -1, "RUBY - AC", {255, 0, 0}, "El Jugador: " .. nom .. " esta banneado: "..BanMessageLuaInjection.."")
	--DropPlayer(source, BanMessageLuaInjection)
end)


RegisterServerEvent('AC:ArmeDetect')
AddEventHandler('AC:ArmeDetect', function(source)

	local eventType = 'client'
	local s = source
	nom = GetPlayerName(source)

	if isServerEvent then
		eventType = 'server'
	end

	print('===========================================')
	print(' ')
	print(' ')
	print(' ')
	print(' ')
	print('^1Player id ^0[' .. source .. '] ^1 tratando de usar un evento del tipo...: ^0' .. eventType .. ' ^1 | nombre del evento : ^0[' .. name .. ']')
	print(' ')
	print(' ')
	print(' ')
	print(' ')
	print('===========================================')
	SendWebhookMessageStaff(webhook,"**Lista negra de Armas** \n```diff\nJoueurs: "..nom.."\nID Jugador: "..source.."\n\n+ Banderas Anticorrupción: ( El jugador ha sido bloqueado permanentemente del servidor. [Ban ID: #".. platenum .."]. )```")
	TriggerEvent("RubyAntiCheat:Ban", 'Ruby_Anti_Cheat', source, 0, BanMessageHealthHack)
	TriggerClientEvent('chatMessage', -1, "RUBY - AC", {255, 0, 0}, "El jugador: " .. nom .. " está banneado: "..BanMessageHealthHack.."")

	--DropPlayer(source, BanMessageLuaInjection)
end)


RegisterServerEvent('AC:CheatDetected2')
AddEventHandler('AC:CheatDetected2', function(source)

	name = GetPlayerName(source)
	print('===========================================')
	print(' ')
	print(' ')
	print(' ')
	print(' ')
	print('^1Player id ^0[' .. source .. '] ^1ha sido pateado, God Mod / cheat detectado !')
	print(' ')
	print(' ')
	print(' ')
	print(' ')
	print('===========================================')
	SendWebhookMessageStaff(webhook,"**HACK DE SALUD DETECTADO!** \n```diff\nJugador: "..name.."\nID Jugador: "..source.."\n\n+ Banderas Anticheat: (la persona ha sido baneada del servidor para siempre.)```")

	TriggerEvent("RubyAntiCheat:Ban", 'Ruby_Anti_Cheat', source, 0, BanMessageHealthHack)
	TriggerClientEvent('chatMessage', -1, "RUBY - AC", {255, 0, 0}, "Jugador: " .. name .. " está banneado: "..BanMessageHealthHack.."")

	--DropPlayer(source, BanMessageHealthHack)
end)


RegisterServerEvent('AC:GiveArgent')
AddEventHandler('AC:GiveArgent', function(source)

	name = GetPlayerName(source)
	print('===========================================')
	print(' ')
	print(' ')
	print(' ')
	print(' ')
	print('^1Player id ^0[' .. source .. '] ^1 ser prohibido para dar el motor de engaño de dinero')
	print(' ')
	print(' ')
	print(' ')
	print(' ')
	print('===========================================')
	SendWebhookMessageStaff(webhook,"**GIVE MOODER!** \n```diff\nJugador: "..name.."\nID de Jugador: "..source.."\n\n+ Anticheat Flags: ( la persona esta baneada definitivamente del server.)```")
	TriggerEvent("RubyAntiCheat:Ban", 'Ruby_Anti_Cheat', source, 0, BanMessageHealthHack)
	TriggerClientEvent('chatMessage', -1, "RUBY - AC", {255, 0, 0}, "Jugador: " .. name .. " está banneado: "..BanMessageHealthHack.."")


	--DropPlayer(source, BanMessageHealthHack)
end)

function WarnPlayer(playername)
	local isKnown = false
	local isKnownCount = 1
	for i,thePlayer in ipairs(violations) do
		if thePlayer.name == name then
			isKnown = true
			if violations[i].count == 10 then
				isKnownCount = violations[i].count
				print('===========================================')
				print(' ')
				print(' ')
				print(' ')
				print(' ')
				print('^1Player id ^0[' .. source .. '] ^kickeado por God Mode !')
				print(' ')
				print(' ')
				print(' ')
				print(' ')
				print('===========================================')
				SendWebhookMessageStaff(webhook,"**CHEATER DETECTED!** \n```diff\nJugador: "..playername.."\nID de jugador: "..source.."\n\n+ Anticheat Flags: ( la persona ha sido baneada : "..isKnownCount.." detection. )```")
				table.remove(violations,i)
				TriggerEvent("RubyAntiCheat:Ban", 'Ruby_Anti_Cheat', source, 0, BanMessageHealthHack)
				TriggerClientEvent('chatMessage', -1, "RUBY - AC", {255, 0, 0}, "Jugador: " .. name .. " está banneado: "..BanMessageHealthHack.."")

				--DropPlayer(source, BanMessageHealthHack)
				--DropPlayer(source, kickMessage)
			else
				violations[i].count = violations[i].count+1
				isKnownCount = violations[i].count
			end
		end
	end

	if not isKnown then
		table.insert(violations, { name = name, count = 1 })
	end

	return isKnown, isKnownCount,isKnownExtraText
end



-- Log De warn


RegisterServerEvent('AC:TropDeDetection')
AddEventHandler('AC:TropDeDetection', function(detect)
	local s = source
	nom = GetPlayerName(source)
	SendWebhookMessage(webhook,"**Posible cheater détectado** \n```diff\nJugador: "..nom.."\nID Jugador: "..source.."\n- Nombre(s) de detección: "..detect.."\n\n+ Banderas Anticorrupción: [El jugador es posiblemente un tramposo]. #".. platenum .."].```")
end)


-- Lynx menu detection
RegisterServerEvent('antilynx8:anticheat')
AddEventHandler('antilynx8:anticheat', function(meme, memename)
	SendWebhookMessageStaff(webhook,"**LYNX MENU DETECTADO** \n```diff\nJugador: "..memename.."\nID Jugador: "..meme.."\n\n+ Banderas Anticheat: ( la persona ha sido permanentemente baneada del servidor.)```")
	TriggerEvent("RubyAntiCheat:Ban", 'Ruby_Anti_Cheat', meme, 0, BanMessageLuaInjection)
	TriggerClientEvent('chatMessage', -1, "  RUBY - AC", {255, 0, 0}, "El Jugador: " .. memename .. " está banneado: "..BanMessageLuaInjection.."")
end) 