Config	=	{}
Config.Locale = 'en'

-- FUEL STUFF
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
Config.WeightSqlBased = true


--Config.EnableBlips				= true
--Config.EnableJerryCans			= true

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
 weed = 1000,			
 weed_pooch = 2000,	
 meth = 1000,			
 meth_pooch = 2000,		
 opium = 1000,		
 opium_pooch = 2000,
 coke = 1000,			
 coke_pooch = 2000, 
 turtle = 1000, 
 turtle_meat = 2000,
 
 --###-->> Misturado <<--###-- 
 fish = 100000,
 chicken = 20000,
 wood = 500000,
 cutted_wood = 350000,
 packaged_plank = 200000,
 petrol = 700000,
 petrol_raffin = 400000,
 essence = 250000,
 whool = 60000,
 fabric = 15000,
 clothe = 30000,
 ble = 100000,
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
 bolchips = 6000,
 bolnoixcajou = 2500,
 bolpistache = 2500,
 defibrillateur = 3000,
 poubelle = 10000,
 latex = 15000,
 borracha = 10000,
 borracha_embalada = 5000,
 
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