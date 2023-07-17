local Vehicles = {
{label = ‘Audi RS6’, spawnName = ‘rs6’},
{label = ‘Dodge Challenger’, spawnName = ‘16challenger’},
{label = ‘BMW M760i’, spawnName = ‘17m760i’},
{label = ‘Range Rover Velar’, spawnName = ‘18Velar’},
{label = ‘BMW 325e’, spawnName = ‘325e’},
{label = ‘Mercedes 600SEL’, spawnName = ‘600sel’},
{label = ‘BMW X5’, spawnName = ‘48is’},
{label = ‘Audi A8’, spawnName = ‘a8l’},
{label = ‘Audi A4’, spawnName = ‘aaq4’},
{label = ‘Mercedes E350’, spawnName = ‘ae350’},
{label = ‘Hyundai Genesis’, spawnName = ‘alpha’},
{label = ‘Audi RS3’, spawnName = ‘audirs3’},
{label = ‘Audi RS6 TK’, spawnName = ‘audirs6tk’},


Citizen.CreateThread(function()
for num,vehicle in ipairs(Vehicles) do
AddTextEntryByHash(GetHashKey(vehicle.spawnName), vehicle.label)
end
end)