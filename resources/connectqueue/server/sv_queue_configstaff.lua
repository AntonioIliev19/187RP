Config = {}

-- priority list can be any identifier. (hex steamid, steamid32, ip) Integer = power over other people with priority
-- a lot of the steamid converting websites are broken rn and give you the wrong steamid. I use https://steamid.xyz/ with no problems.
-- you can also give priority through the API, read the examples/readme.
Config.Priority = {
	--FONDATEUR et CO FONDATEUR
    ["steam:11000014095cb5e"] = 100, -- toni
	["steam:110000132c0ee82"] = 95, -- ico
	["steam:11000013a81e89b"] = 90, -- dogo
	["steam:11000010ed7ec5b"] = 90, -- the shy rado
	["steam:11000010585553a"] = 90, -- mitkoo
	["steam:1100001068cf9da"] = 90, -- marti
	["steam:11000011623c8d2"] = 90, -- donald trump
	["steam:1100001169b7b8f"] = 90, -- priqtelq na aikido boeca
	["steam:110000106d7a7ea"] = 90, -- stenly
	["steam:110000117044625"] = 90, -- gosho
	["steam:11000010bf74485"] = 90 -- ogi
}

-- require people to run steam
Config.RequireSteam = true

-- "whitelist" only server
Config.PriorityOnly = true

-- disables hardcap, should keep this true
Config.DisableHardCap = true

-- will remove players from connecting if they don't load within: __ seconds; May need to increase this if you have a lot of downloads.
-- i have yet to find an easy way to determine whether they are still connecting and downloading content or are hanging in the loadscreen.
-- This may cause session provider errors if it is too low because the removed player may still be connecting, and will let the next person through...
-- even if the server is full. 10 minutes should be enough
Config.ConnectTimeOut = 600

-- will remove players from queue if the server doesn't recieve a message from them within: __ seconds
Config.QueueTimeOut = 90

-- will give players temporary priority when they disconnect and when they start loading in
Config.EnableGrace = true

-- how much priority power grace time will give
Config.GracePower = 5

-- how long grace time lasts in seconds
Config.GraceTime = 480

-- on resource start, players can join the queue but will not let them join for __ milliseconds
-- this will let the queue settle and lets other resources finish initializing
Config.JoinDelay = 30000

-- will show how many people have temporary priority in the connection message
Config.ShowTemp = true

-- simple localization
Config.Language = {
    joining = "\xF0\x9F\x8E\x89Влизане...",
    connecting = "\xE2\x8F\xB3Зареждане...",
    idrr = "\xE2\x9D\x97[187-Queue] Грешка: Не мога да възстановя вашите идентификационни данни, опитайте се да рестартирате играта си.",
    err = "\xE2\x9D\x97[187-Queue Има грешка.",
    pos = "\xF0\x9F\x90\x8C Вие сте %d/%d на опашката \xF0\x9F\x95\x9C%s",
    connectingerr = "\xE2\x9D\x97[187-Queue] Грешка при свързване.",
    timedout = "\xE2\x9D\x97[187-Queue] Грешка: Тайм аут.",
    wlonly = "\xE2\x9D\x97[187-Queue] Сървъра е в Whitelist Mode.",
    steam = "\xE2\x9D\x97 [187-Queue] Грешка: Steam трябва да е пуснат."
}