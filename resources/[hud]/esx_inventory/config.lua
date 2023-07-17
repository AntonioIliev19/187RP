Config	=	{}
Config.Locale = 'en'

-- FUEL STUFF
Config.EnableBlips				= true
Config.EnableJerryCans			= true
Config.EnableBuyableJerryCans	= true -- Coming soon, currently useless
Config.VehicleFailure			= 5 -- At what fuel-percentage should the engine stop functioning properly? (Defualt: 10)
 -- Limite, a unidade pode ser o que você quiser. Originalmente gramas (como pessoas comuns podem segurar 25kg)
Config.Limit = 25000

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 25

-- WIP Segurando mais e mais coisas tornam você mais lento e lento (Não trabalhe neste momento .. Tente algum nativo, olhe para client / main.lua)
Config.userSpeed = false

-- TODO, see server/main.lua
--Config.Config.BagIsSkin = true

-- If true, ignore rest of file
Config.WeightSqlBased = false

-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:
Config.localWeight = {
 --###-->> Lojas <<--###-- 
 bread = 50,  		--30
 sandwich = 12,  		--30
 water = 25,		--30
 icetea = 25,		--30
 cocacola = 24,		--30
 redgull = 10,		--30
 milk = 25,		--30
 cigarett = 15,		--30
 lighter = 25,		--30
 tel = 50,		--30
 
 --###-->> Bar <<--###-- 
 wine = 300,
 beer = 100,
 vodka = 255,
 tequila = 250,
 whisky = 700,
 
 --###-->> Minerios <<--###-- 
 stone = 50,
 washed_stone = 58,
 copper = 59,
 iron = 24, 
 gold = 100,
 diamond = 250,
 
 --###-->> Drogas <<--###--
 weed = 40,			
 weed_pooch = 45,	
 meth = 40,			
 meth_pooch = 45,		
 opium = 40,		
 opium_pooch = 45,
 coke = 40,			
 coke_pooch = 45, 
 turtle = 40, 
 turtle_meat = 45,
 
 --###-->> Misturado <<--###-- 
 alive_chicken = 155,
 slaughtered_chicken =1500,
 packaged_chicken = 1000,
 fish = 25,
 wood = 15,
 cutted_wood = 15,
 packaged_plank = 15,
 petrol = 25,
 petrol_raffin = 12,
 essence = 100,
 whool = 100,
 fabric = 150,
 clothe = 300,
 ble = 1000,
 farine = 150,
 gazbottle = 2000,	
 fixtool = 50,		
 carotool = 155,	
 blowpipe = 123,	
 fixkit = 300,		
 carokit = 300,		
 bandage = 15,		
 medikit = 25,		
 croquettes = 90,	
 raisin = 400,		
 jus_raisin = 400,	
 vine = 300,		 
 grand_cru = 125,	
 jusfruit = 155,				
 brolly = 15,		
 bong = 24,		
 rose = 5,			
 notepad = 10,		
 icetea = 50,		
 grapperaisin = 150,
 bolchips = 25,
 bolnoixcajou = 25,
 bolpistache = 20,
 defibrillateur = 25,
 poubelle = 50,
 latex = 50,
 borracha = 50,
 borracha_embalada = 5,
 
  --###-->> Acesorios de Armas <<--###-- 
 clip = 25,
 advanced_scope = 25,
 armor = 5000,
 barrel = 1000,
 fmj = 32,
 hollow = 25,
 lazer_scope = 100,
 metreshooter = 100,
 silent = 25,
 very_extended_magazine = 25,
 thermal_scope = 25,
 pecas = 250,
 
 --###-->> Acesorios de Carros <<--###-- 
 alarm1 = 1400,
 alarm2 = 1400,
 alarm3 = 1400,
 alarminterface = 500,
 carokit = 1000
 
}