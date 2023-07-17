-- Announcing
TriggerEvent('es:addGroupCommand', 'announce', "admin", function(source, args, user)
	TriggerClientEvent('announce', -1, "~o~Съобщение от Admin", table.concat(args, " "), 5)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Нямате права !")
end, {help = "Обявете съобщение до целия сървър", params = {{name = "announcement", help = "Съобщението за обявяване"}}})