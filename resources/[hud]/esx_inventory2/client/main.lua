ESX              = nil
local lSpeed	 = 1.49
poid		 = 0
local oldpoid  = 4

Citizen.CreateThread(function()
	while ESX == nil do
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	print(xPlayer)
 TriggerServerEvent('esx_advanced_inventory:FUpdate',xPlayer)
end)


RegisterNetEvent("esx_advanced_inventory:change")
AddEventHandler("esx_advanced_inventory:change", function(tpoid)
	poid = tpoid
end)



function drawLevel(r, g, b, a)
  SetTextFont(4)
  SetTextProportional(1
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0, 255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  AddTextComponentString("~y~inventário : ~s~ " .. poid/1000 .. " / 25.00 Kg ")
  DrawText(0.025, 0.780)
end





Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		SetPedMoveRateOverride(GetPlayerPed(-1),0.5)
			if poid < 15000 then
				SetPedMoveRateOverride(GetPlayerPed(-1),1.0)
				drawLevel(51, 153, 51, 255)
			elseif poid >= 15000 and poid < 20000 then
				SetPedMoveRateOverride(GetPlayerPed(-1),1.0)
				drawLevel(255, 102, 0, 255)
			else
				SetPedMoveRateOverride(GetPlayerPed(-1),0.8)
				drawLevel(204, 0, 0, 255)
		end
	end
