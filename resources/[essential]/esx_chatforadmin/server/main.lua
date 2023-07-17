--[[

  Made with love by Cheleber, you can join my RP Server here: www.grandtheftlusitan.com
  You can add this lines do your esx_rpchat or use it to something else, works with essentialmode, es_admin and esx_identity!

--]]

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			name = identity['name'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height'],
			job = identity['job'],
			group = identity['group']
		}
	else
		return nil
	end
end

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end


  TriggerEvent('es:addCommand', 'a', function(source, args, user)
  	local grupos = getIdentity(source)
	local nome = getIdentity(source)
    if grupos.group == 'admin' or grupos.group == 'superadmin' then
	    TriggerClientEvent("sendMessageAdmin", -1, source, nome.name, table.concat(args, " "))
	end	
  end, {help = 'Chat Admins.'})
  
  --[[ Different Way to do it...
  AddEventHandler('chatMessage', function(source, color, msg)
	cm = stringsplit(msg, " ")
	if cm[1] == "/a" then
		CancelEvent()
		if tablelength(cm) > 1 then
			local names1 = GetPlayerName(source)
			local msgVar = {}
			local textmsg = ""
			for i=1, #cm do
				if i ~= 1 then
					textmsg = (textmsg .. " " .. tostring(cm[i]))
				end
			end
			local grupos = getIdentity(source)
	        if grupos.group == 'admin' or grupos.group == 'superadmin' then
		        TriggerClientEvent("sendMessageAdmin", -1, source, names1, textmsg)
			else
			    TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insuficient Premissions!")
			end
		end
	end	
end)  
  ]]--