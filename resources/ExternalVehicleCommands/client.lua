----------------------------------------------
-- External Vehicle Commands, Made by FAXES --
----------------------------------------------

--- Config ---

usingKeyPress = true -- Allow use of a key press combo (default Ctrl + E) to open trunk/hood from outside
togKey = 38 -- E


--- Code ---

function ShowInfo(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

RegisterCommand("trunk", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 5

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
            ShowInfo("[Vehicle] ~g~Trunk Closed.")
        else	
            SetVehicleDoorOpen(veh, door, false, false)
            ShowInfo("[Vehicle] ~g~Trunk Opened.")
        end
    else
        if distanceToVeh < 6 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
                ShowInfo("[Vehicle] ~g~Trunk Closed.")
            else
                SetVehicleDoorOpen(vehLast, door, false, false)
                ShowInfo("[Vehicle] ~g~Trunk Opened.")
            end
        else
            ShowInfo("[Vehicle] ~y~Too far away from vehicle.")
        end
    end
end)

RegisterCommand("hood", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 4

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
            ShowInfo("[Vehicle] ~g~Hood Closed.")
        else	
            SetVehicleDoorOpen(veh, door, false, false)
            ShowInfo("[Vehicle] ~g~Hood Opened.")
        end
    else
        if distanceToVeh < 4 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
                ShowInfo("[Vehicle] ~g~Hood Closed.")
            else	
                SetVehicleDoorOpen(vehLast, door, false, false)
                ShowInfo("[Vehicle] ~g~Hood Opened.")
            end
        else
            ShowInfo("[Vehicle] ~y~Too far away from vehicle.")
        end
    end
end)

RegisterCommand("door", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    
    if args[1] == "1" then -- Front Left Door
        door = 0
    elseif args[1] == "2" then -- Front Right Door
        door = 1
    elseif args[1] == "3" then -- Back Left Door
        door = 2
    elseif args[1] == "4" then -- Back Right Door
        door = 3
    else
        door = nil
        ShowInfo("Usage: ~n~~b~/door [door]")
        ShowInfo("~y~Possible doors:")
        ShowInfo("1(Front Left Door), 2(Front Right Door)")
        ShowInfo("3(Back Left Door), 4(Back Right Door)")
    end

    if door ~= nil then
        if IsPedInAnyVehicle(ped, false) then
            if GetVehicleDoorAngleRatio(veh, door) > 0 then
                SetVehicleDoorShut(veh, door, false)
                ShowInfo("[EVC] ~g~Door Closed.")
            else	
                SetVehicleDoorOpen(veh, door, false, false)
                ShowInfo("[EVC] ~g~Door Opened.")
            end
        else
            if distanceToVeh < 4 then
                if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                    SetVehicleDoorShut(vehLast, door, false)
                    ShowInfo("[EVC] ~g~Door Closed.")
                else	
                    SetVehicleDoorOpen(vehLast, door, false, false)
                    ShowInfo("[EVC] ~g~Door Opened.")
                end
            else
                ShowInfo("[EVC] ~y~Too far away from vehicle.")
            end
        end
    end
end)

if usingKeyPress then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(10)
            local ped = GetPlayerPed(-1)
            local veh = GetVehiclePedIsUsing(ped)
            local vehLast = GetPlayersLastVehicle()
            local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
            local door = 5
            if IsControlPressed(1, 224) and IsControlJustPressed(1, togKey) then
                if not IsPedInAnyVehicle(ped, false) then
                    if distanceToVeh < 4 then
                        if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                            SetVehicleDoorShut(vehLast, door, false)
                            ShowInfo("[EVC] ~g~Trunk Closed.")
                        else	
                            SetVehicleDoorOpen(vehLast, door, false, false)
                            ShowInfo("[EVC] ~g~Trunk Opened.")
                        end
                    else
                        ShowInfo("[EVC] ~y~Too far away from vehicle.")
                    end
                end
            end
        end
    end)
end