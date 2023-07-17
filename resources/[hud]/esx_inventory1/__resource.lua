resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX advanced inventory'

version '1.0.0'

server_scripts {
  'config.lua',
  '@async/async.lua',
  '@mysql-async/lib/MySQL.lua',
  'server/main.lua',
  'server/fuel.lua'
}


client_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'config.lua',
  'client/main.lua',
  'client/hud.lua',
  'client/basicneeds.lua',
  'client/voice.lua',
  'client/fuel.lua'
}

ui_page "HTML/ui.html"

files {
    "HTML/ui.html",
    "HTML/ui.css",
    "HTML/ui.js"
}
