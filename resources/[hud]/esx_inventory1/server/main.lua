ESX = nil

local arrayWeight = Config.localWeight

TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

-- Return the sum of all item in pPlayer inventory
function getInventoryWeight(pPlayer)
  local weight = 0
  local userWeight = 0

  if #pPlayer.inventory > 10 then
	  for i=1, #pPlayer.inventory, 100 do
	    if pPlayer.inventory[i] ~= nil then
	      itemWeight = Config.DefaultWeight
	      if arrayWeight[pPlayer.inventory[i].name] ~= nil then
	        itemWeight = arrayWeight[pPlayer.inventory[i].name]
	      end
	      weight = weight + (itemWeight * pPlayer.inventory[i].count)
	    end
	  end
  end

  return weight
end

-- Get user speed
-- https://runtime.fivem.net/doc/reference.html#_0x6DB47AA77FD94E09

RegisterServerEvent('esx_advanced_inventory:FUpdate')
AddEventHandler('esx_advanced_inventory:FUpdate', function(xPlayer)
  local source_ = source
  local weight = getInventoryWeight(xPlayer)
  TriggerClientEvent('esx_advanced_inventory:change',source_,weight)
end)


RegisterServerEvent('esx_advanced_inventory:Update')
AddEventHandler('esx_advanced_inventory:Update', function(source)
  local source_ = source
  local xPlayer = ESX.GetPlayerFromId(source_)
  local weight = getInventoryWeight(xPlayer)
  TriggerClientEvent('esx_advanced_inventory:change',source_,weight)
end)



RegisterServerEvent('esx:onAddInventoryItem')
AddEventHandler('esx:onAddInventoryItem', function(source, item, count)
  local source_ = source
  local xPlayer = ESX.GetPlayerFromId(source_)
  local currentInventoryWeight = getInventoryWeight(xPlayer)
  TriggerEvent('esx_advanced_inventory:Update',source_)
  if currentInventoryWeight > Config.Limit then
    local xPlayer = ESX.GetPlayerFromId(source_)
    local itemWeight = Config.DefaultWeight

    -- Get weight if it exists of current item
    if arrayWeight[item.name] then
      itemWeight = arrayWeight[item.name]
    end
    local qty = 0
    local weightTooMuch = 0
    weightTooMuch = currentInventoryWeight - Config.Limit
    qty = math.floor(weightTooMuch / itemWeight) + 1

    -- Should be false all the time. But can be true on fresh install
    if qty > count then
      qty = count
    end
   ESX.CreatePickup('item_standard', item.name, qty, item.label..'['..qty..']', source_)
    Event('esx:showNotification', source_, '~s~Caiu ~r~' .. qty .. 'x ' .. item.label .. '~s~ do seu inventario')
    xPlayer.removeInventoryItem(item.name, qty)
    TriggerEvent('esx_advanced_inventory:Update',source_)
  end
end)

RegisterServerEvent('esx:onRemoveInventoryItem')
AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
  TriggerEvent('esx_advanced_inventory:Update',source)
    if Config.userSpeed == true then
      local source_ = source
      local xPlayer = ESX.GetPlayerFromId(source_)
      local currentInventoryWeight = getInventoryWeight(xPlayer)
    end
end)




-- WIP: Someone to contribute ? Extend user max weight when skin having a bag ?

	-- skin based solution (Config.BagIsSkin = true)

		--RegisterServerEvent('esx_skin:save')
		--AddEventHandler('esx_skin:save', function(skin)
		--	-- TODO: If skin, increase player max weight
		-- 	-- 		Do not forget to bind on esx:onRemoveInventoryItem when removing the bag.
		--end)


--	-- item bag based solution (Config.BagIsSkin = false)

		-- esx:onAddInventoryItem if item = bag
		-- esx:onRemoveInventoryItem if item = bag


-- TDB: If player throw, sell, give is bag (item or skin), need algo to throw randomly items ?
