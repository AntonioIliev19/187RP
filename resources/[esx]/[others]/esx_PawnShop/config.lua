--------------------------------
------- Created by Hamza -------
-------------------------------- 

Config = {}

-- Pawn Shop Positions:
Config.PawnZones = {
	PawnShops = {
		Pos = {
			{x = 412.42,  y = 314.41, z = 103.02},
			{x = 182.76821899414,  y = -1319.3857421875, z = 29.317152023315},
			{x = -1459.3402099609,  y = -413.79244995117, z = 35.739379882813}
		}
	}
}

-- Pawn Shop Blip Settings:
Config.EnablePawnShopBlip = true
Config.BlipSprite = 59
Config.BlipDisplay = 4
Config.BlipScale = 0.65
Config.BlipColour = 5
Config.BlipName = "Заложна къща"

-- Pawn Shop Marker Settings:
Config.KeyToOpenShop = 38														-- default 38 is E
Config.ShopMarker = 27 															-- marker type
Config.ShopMarkerColor = { r = 255, g = 255, b = 0, a = 100 } 					-- rgba color of the marker
Config.ShopMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }  						-- the scale for the marker on the x, y and z axis
Config.ShopDraw3DText = "Натиснете ~g~[E]~s~ за да отворите ~y~Заложната къща~s~"					-- set your desired text here

-- Pawn Shop Item List:
Config.ItemsInPawnShop = {
	{ itemName = 'lockpick', label = 'Шперцове', BuyInPawnShop = true, BuyPrice = 35, SellInPawnShop = true, SellPrice = 5 },
	{ itemName = 'raspberry', label = 'ОС за хакване', BuyInPawnShop = false, BuyPrice = 2500, SellInPawnShop = true, SellPrice = 300 },
	{ itemName = 'coke_pooch', label = 'Coke', BuyInPawnShop = true, BuyPrice = 5000, SellInPawnShop = true, SellPrice = 50 },
	{ itemName = 'blowtorch', label = 'Горелка', BuyInPawnShop = true, BuyPrice = 5000, SellInPawnShop = true, SellPrice = 200 },
	{ itemName = 'meth', label = 'Амфети', BuyInPawnShop = true, BuyPrice = 5000, SellInPawnShop = true, SellPrice = 10 },
	{ itemName = 'c4_bank', label = 'Бомба', BuyInPawnShop = true, BuyPrice = 10000, SellInPawnShop = true, SellPrice = 250 },
	{ itemName = 'rolex', label = 'Ролекс', BuyInPawnShop = true, BuyPrice = 10000, SellInPawnShop = true, SellPrice = 1050 },
	{ itemName = 'lom', label = 'АТМ Скимър', BuyInPawnShop = true, BuyPrice = 500, SellInPawnShop = true, SellPrice = 250 },
	{ itemName = 'oxygen_mask', label = 'Кислородна маска', BuyInPawnShop = true, BuyPrice = 150, SellInPawnShop = true, SellPrice = 50 },
	{ itemName = 'lokalizator', label = 'Проследяващо устройство', BuyInPawnShop = true, BuyPrice = 550, SellInPawnShop = true, SellPrice = 350 },
	{ itemName = 'phone', label = 'Телефон', BuyInPawnShop = true, BuyPrice = 250, SellInPawnShop = true, SellPrice = 50 },
}

