const names = [
    "предната дясна врата",
    "задната лява врата",
    "задната дясна врата",
];

const names2 = [
    "предната дясна врата",
    "задната лява врата",
    "задната дясна врата",
];

HelpText = function(msg)
{
    if (!IsHelpMessageOnScreen())
    {
        SetTextComponentFormat('STRING')
        AddTextComponentString(msg)
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)
    }
}

MyClosestVehicle = function(x, y, z, radius)
{
    for (let i = 1; i < 72; i++)
    {
        const angle = (i * 5) * Math.PI / 180;

        const sx = (50.0 * Math.cos(angle)) + x;
        const sy = (50.0 * Math.sin(angle)) + y;

        const ex = x - (sx - x);
        const ey = y - (sy - y);

        const rayHandle = StartShapeTestCapsule(sx, sy, z, ex, ey, z, radius, 10, PlayerPedId(), 1000);

        const ent = GetShapeTestResult(rayHandle, false)[4];

        return ent;
    }
}

setTick(() => {
    let ped = PlayerPedId();
    let pco = GetEntityCoords(ped);

    let veh = MyClosestVehicle(pco[0], pco[1], pco[2], 5.0);

    if (DoesEntityExist(veh))
    {
        for (let i = 1; i < GetNumberOfVehicleDoors(veh); i++)
        {
            let coord = GetEntryPositionOfDoor(veh, i);

            if (Vdist2(pco[0], pco[1], pco[2], coord[0], coord[1], coord[2]) < 0.75 && !DoesEntityExist(GetPedInVehicleSeat(veh, i - 1)) && GetVehicleDoorLockStatus(veh) !== 2)
            {
                if (names[i - 1] && !IsThisModelABike(GetEntityModel(veh)) && !IsThisModelABoat(GetEntityModel(veh)))
                    HelpText("Натисни ~INPUT_CONTEXT~ за да отвориш " + names[i - 1]);
                else if (names2[i - 1] && IsThisModelABike(GetEntityModel(veh)) && IsThisModelABoat(GetEntityModel(veh)))
                    HelpText("Натисни ~INPUT_CONTEXT~ за да седнеш на седалката." + names2[i - 1]);
                else
                    HelpText("Натисни ~INPUT_CONTEXT~ за да отвориш вратата ");

                if (IsControlJustPressed(1, 38))
                {
                    TaskEnterVehicle(ped, veh, 10000, i - 1, 1.0, 1, 0);
                }
            }
        }
    }
});
