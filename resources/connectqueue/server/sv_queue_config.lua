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
	["steam:11000013240cf5b"] = 90, -- bobito_bg 5 evra
	["steam:1100001321f4350"] = 80, -- vili
	["steam:1100001163c8c6b"] = 80, -- denis
	["steam:1100001365424d9"] = 80, -- rumen
	["steam:11000010bf74485"] = 80, -- ogi
	["steam:1100001178bde84"] = 90, -- svinks
	["steam:11000011073c380"] = 80, -- gecata
	["steam:1100001335c26b7"] = 90, -- stakito
	["steam:11000010cabe201"] = 80, -- krumov
	["steam:11000011cd1ab8c"] = 80, -- boriskata zoner
	["steam:11000010bd209b9"] = 80, -- makedoneca grozen
	["steam:11000013df6a18c"] = 80, -- badema
	["steam:11000011571a33e"] = 80, -- dani na ico
	["steam:110000112d33cad"] = 80, -- lio na ico
	["steam:110000106d7a7ea"] = 90, -- stenly
	["steam:110000117044625"] = 90, -- gosho
	["steam:1100001131fda54"] = 80, -- monkata
	["steam:1100001079d61c4"] = 90, -- darkk kill 5 evra
	["steam:110000138be09ef"] = 90, -- gilzata 5 evra 
	["steam:11000011c84a83a"] = 90,  -- quizles 5 evra
	["steam:1100001196620e7"] = 95, -- brat mi
	["steam:110000109b9d44a"] = 90, -- ogi afrikaneca
	["steam:11000010d53f15a"] = 90, -- m-power 5 evra
	["steam:110000117807a4d"] = 90, -- skorpi wear 5 evra
	["steam:110000110740dac"] = 80, -- radanski
	["steam:11000010cabe201"] = 80, -- krumov
	["steam:11000011d384e46"] = 90, -- darkygtx 5 evra
	["steam:110000133f3b68f"] = 80, -- niki donkov moq klas
	["steam:1100001002f2c5f"] = 10, -- VANKO lapeto peppapig
	["steam:1100001121f048a"] = 10, -- 7SeventyNine9
	["steam:110000118d15b46"] = 10, -- TrxpX
	["steam:11000013d63f586"] = 10, -- ROSKATA
	["steam:11000013e3d0ac4"] = 10, -- martookk
	["steam:11000011656ed4c"] = 10, -- Neshev
	["steam:11000011aac06e9"] = 10, -- gratewolf
	["steam:110000117ab33a4"] = 10, -- stilyanbg33
	["steam:11000013caebb59"] = 10, -- kitaec メリオダス
	["steam:110000117bd1727"] = 10, -- gufi bachi ceci
	["steam:1100001351a8827"] = 10, -- igrata
	["steam:110000117424794"] = 10, -- joraka
	["steam:110000116ece4ef"] = 10, -- sloomy
	["steam:11000010d75e2e9"] = 10, -- kalokata
	["steam:1100001173b6f6a"] = 10, -- n.fasa
	["steam:1100001191c9725"] = 10, -- don kurleone
	["steam:11000010cee6189"] = 10, -- todorow
	["steam:11000010d5b65a1"] = 10, -- gosho boilera
	["steam:11000013e1b8d05"] = 10, -- marto
	["steam:11000013c871008"] = 10, -- Anton Petrov
	["steam:11000010d363a3b"] = 10, -- Pythona
	["steam:1100001170a0254"] = 10, --thesupermax
	["steam:11000011cabc4f1"] = 10, -- nik4o0o
	["steam:110000114aa3695"] = 10, -- divaka21
	["steam:11000013abe08e8"] = 10, -- pablito
	["steam:11000014042a4b1"] = 10, -- komara222
	["steam:11000010cc61991"] = 10, -- niksata
	["steam:11000010d090ca6"] = 10, -- Ms_Govnio
	["steam:110000134928a8d"] = 10, -- stakata
	["steam:11000011d4db806"] = 10, -- peter
	["steam:1100001122f4191"] = 10 -- stefcho obelq
}

-- require people to run steam
Config.RequireSteam = true

-- "whitelist" only server
Config.PriorityOnly = false

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