ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

------------------------------------
---- Utiliser équipement Pistol ----
------------------------------------

ESX.RegisterUsableItem('silence_pistol', function(source)
    TriggerClientEvent('esx_component:EquipSilencePistol', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~безшумен (Пистолет)')

end)

--------------------------------------
---- Utiliser équipement Pistol50 ----
--------------------------------------

ESX.RegisterUsableItem('silence_pistol50', function(source)
    TriggerClientEvent('esx_component:EquipSilencePistol50', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~безшумен (Пистолет50)')

end)

-----------------------------------------
---- Utiliser équipement SniperRifle ----
-----------------------------------------

ESX.RegisterUsableItem('silence_sniperrifle', function(source)
    TriggerClientEvent('esx_component:EquipSilenceSniperRifle', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~безшумен (Снайпер)')

end)

ESX.RegisterUsableItem('advancedscoped_sniperrifle', function(source)
    TriggerClientEvent('esx_component:EquipAdvancedScopedSniperRifle', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~(Снайпер)')

end)

---------------------------------------------------------
-------------- Utiliser Equipement CARBINERIFLE----------
---------------------------------------------------------

ESX.RegisterUsableItem('scope_smg', function(source)
    TriggerClientEvent('esx_component:EquipScopeSMG', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~мерник за SMG')

end)

ESX.RegisterUsableItem('lowrider_smg', function(source)
    TriggerClientEvent('esx_component:EquipLowRiderSMG', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~LowRider за SMG')

end)

ESX.RegisterUsableItem('supp_smg', function(source)
    TriggerClientEvent('esx_component:EquipSuppSMG', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~патронаж за SMG')

end)

ESX.RegisterUsableItem('grip_smg', function(source)
    TriggerClientEvent('esx_component:EquipGripSMG', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~дръжка за SMG')
end)

ESX.RegisterUsableItem('flashlight_assaultsmg', function(source)
    TriggerClientEvent('esx_component:EquipFlashlightSMG', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~фенер за SMG')

end)

---------------------------------------------------------
-------------- Utiliser Equipement COMBATPISTOL----------
---------------------------------------------------------

ESX.RegisterUsableItem('supp_cp', function(source)
    TriggerClientEvent('esx_component:EquipSuppCP', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~патронаж за Glock17')
end)

ESX.RegisterUsableItem('flash_cp', function(source)
    TriggerClientEvent('esx_component:EquipFlashCP', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~фенер за Glock17')
end)

ESX.RegisterUsableItem('lowrider_cp', function(source)
    TriggerClientEvent('esx_component:EquipLowRiderCP', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~LowRider за Glock17')
end)

--------------------------------------------------------
------------ Utiliser Equipement GUSENBERG -------------
--------------------------------------------------------

ESX.RegisterUsableItem('clip_gus', function(source)
    TriggerClientEvent('esx_component:EquipClipGus', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~подобрено зарядно устройство за GUSENBERG')
end)

-------------------------------------------------------------
------------ Utiliser Equipement SPECIALCARBINE -------------
-------------------------------------------------------------
ESX.RegisterUsableItem('clip_sc', function(source)
    TriggerClientEvent('esx_component:EquipClipSC', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~подобрено зарядно устройство за SCAR')
end)

ESX.RegisterUsableItem('grip_sc', function(source)
    TriggerClientEvent('esx_component:EquipGripSC', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~дръжка за SCAR')
end)

ESX.RegisterUsableItem('supp_sc', function(source)
    TriggerClientEvent('esx_component:EquipSuppSC', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~ SCAR')
end)

-------------------------------------------------------------
------------ Utiliser Equipement HEAVYPISTOL-----------------
-------------------------------------------------------------
ESX.RegisterUsableItem('clip_heavypistol', function(source)
    TriggerClientEvent('esx_component:EquipClipHeavyPistol', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~подобрено зарядно устройство за пистолет')
end)

ESX.RegisterUsableItem('supp_heavypistol', function(source)
    TriggerClientEvent('esx_component:EquipSuppHeavyPistol', source)
    TriggerClientEvent('esx:showNotification', source, 'Вие получихте ~g~1x ~b~безшумен sur le Pistolet Lourd')
end)
