local blips = {
  {title="Гараж", colour = 51, id = 492, x = 259.408, y = -783.078, z = 30.511},
  {title="Морга", colour = 51, id = 524, x = 408.61, y = -1625.47, z = 29.29},
  {title="Адвокатска Кантора", colour = 33, id = 606, x = -551.971, y = -192.111, z = 38.219}
 }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)