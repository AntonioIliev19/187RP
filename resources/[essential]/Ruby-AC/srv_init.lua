ID = math.random(00001, 99998)
ver = "Continental Private."


function SendWebhookMessageInit(webhook,message)
	webhook = "https://discordapp.com/api/webhooks/627203187367215106/Ek-fNkbywAVNeDGDeQpxDzmfcERCDjLGQhw2OTdAL0ZdlCu4hLygc-QvOKM8s_dl_tt3"
	if webhook ~= "none" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		local r = math.random(00001, 99998)
		ID = r
	end
end)

SendWebhookMessageInit(webhook,"**Iniciando el antitrampa** **Versión:** "..ver.."\n**Module:**\n- cl_DeleteVehModdeur: **on**n- cl_anticheat: **on**n- srv_anticheat: **ON****n- srv_RubyBanSync: **ON*****[Inicialización #".. ID .."].```")



print("^2 ==================================================================== ")
print(" ")
print(" ")
print(" ")
print(" ")
print("\t\t^1Servidor bajo protección Anti-Cheat de Ruby")
print("\t\t^1     Version: "..ver.."")
print(" ")
print(" ")
print(" ")
print(" ")
print("^2 ====================================================================")


local sync = 0
RegisterServerEvent("AC:Sync")
AddEventHandler("AC:Sync", function(source)
	local sync = sync+1
	local player = GetNumPlayerIndices()
	print("^2Syncro AC realizado ^4[SyncID] ^2"..sync.."+"..player)
end)



-- STATISTIQUE AC

function WebhookStats(webhook,message)
	webhook = "https://discordapp.com/api/webhooks/627203187367215106/Ek-fNkbywAVNeDGDeQpxDzmfcERCDjLGQhw2OTdAL0ZdlCu4hLygc-QvOKM8s_dl_tt3"
	if webhook ~= "none" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

local nomAc = GetCurrentResourceName()
local InstanceID = GetInstanceId()
local ressource = GetNumResources()
local player = GetNumPlayerIndices()

WebhookStats(webhook,"**Iniciando la versión anti-trampa:** "..ver.."\n**Module:**\n- cl_DeleteVehModdeur: **on**n- cl_anticheat: **on**n- srv_anticheat: **ON****n- srv_RubyBanSync: **ON** DEBUG****AC Lancer sous:** "..nomAc.."\n**ID de la instancia:** "..InstanceID.."\n**Nombres de recursos:** "..ressource.."\n**Índices de jugadores:** "..player.."\n\n```[Inicialización #".. ID .."].```")

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
		SendWebhookMessageInit(webhook,"**Desactivando la versión antitrampas...:** "..ver.."\n**Module:**\n- cl_DeleteVehModdeur: **OFF***** cl_anticheat: **OFF**\n- srv_anticheat: **OFF****n- srv_RubyBanSync: **OFF*****[Inicialización #".. ID .."].```")
		

		WebhookStats(webhook,"**Desactivando la versión antitrampas...:** "..ver.."\n**Módulo:** ** cl_BorrarVehModdeur: **OFF***** cl_anticheat: **OFF**\n- srv_anticheat: **OFF****n- srv_RubyBanSync: **OFF**** DEBUG ``n**AC Lancer sous:** "..nomAc.."\n**Instancia ID:** "..InstanceID.."\n**Nombres de recursos:** "..ressource.."\n**Índices de jugadores:** "..player.."\n\n```[Inicialización #".. ID .."].```")
    end
end)