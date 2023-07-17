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
Config.DefaultWeight = 0

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
 sandwich = 165,  		--30
 water = 600,		--30
 icetea = 300,		--30
 cocacola = 350,		--30
 redbull = 280,		--30
 milk = 500,		--30
 cigarett = 15,		--30
 lighter = 25,		--30
 tel = 143,		--30
 
 --###-->> Bar <<--###-- 
 wine = 1200,
 beer = 700,
 vodka = 755,
 tequila = 2600,
 whisky = 2000,
 
 --###-->> Minerios <<--###-- 
 stone = 550,
 washed_stone = 100,
 copper = 100,
 iron = 100, 
 gold = 100,
 diamond = 100,
 
 --###-->> Drogas <<--###--
 weed = 100,			
 weed_pooch = 200,	
 meth = 100,			
 meth_pooch = 200,		
 opium = 100,		
 opium_pooch = 200,
 coke = 100,			
 coke_pooch = 200, 
 turtle = 100, 
 turtle_meat = 200,
 
 --###-->> Misturado <<--###-- 
 alive_chicken = 2000,
 slaughtered_chicken =1500,
 packaged_chicken = 1000,
 fish = 1000,
 wood = 5000,
 cutted_wood = 3500,
 packaged_plank = 2000,
 petrol = 7000,
 petrol_raffin = 4000,
 essence = 2500,
 whool = 600,
 fabric = 150,
 clothe = 300,
 ble = 1000,
 farine = 5000,
 gazbottle = 2000,	
 fixtool = 900,		
 carotool = 900,	
 blowpipe = 1200,	
 fixkit = 800,		
 carokit = 800,		
 bandage = 70,		
 medikit = 500,		
 croquettes = 90,	
 raisin = 400,		
 jus_raisin = 400,	
 vine = 600,		 
 grand_cru = 400,	
 jusfruit = 600,				
 brolly = 300,		
 bong = 600,		
 rose = 200,			
 notepad = 150,		
 icetea = 300,		
 grapperaisin = 150,
 bolchips = 600,
 bolnoixcajou = 250,
 bolpistache = 250,
 defibrillateur = 300,
 poubelle = 1000,
 latex = 1500,
 borracha = 1000,
 borracha_embalada = 500,
 
  --###-->> Acesorios de Armas <<--###-- 
 clip = 750,
 advanced_scope = 900,
 armor = 5000,
 barrel = 1000,
 fmj = 300,
 hollow = 200,
 lazer_scope = 100,
 metreshooter = 100,
 silent = 500,
 very_extended_magazine = 900,
 thermal_scope = 900,
 pecas = 250,
 
 --###-->> Acesorios de Carros <<--###-- 
 alarm1 = 3400,
 alarm2 = 3400,
 alarm3 = 3400,
 alarminterface = 1000,
 carokit = 2000
 
}