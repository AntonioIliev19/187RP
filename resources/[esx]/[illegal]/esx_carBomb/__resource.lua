resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX CAR BOMB'

version '1.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server.lua'
}

client_scripts {
	'config.lua',
	'client.lua'
}

dependency 'es_extended'