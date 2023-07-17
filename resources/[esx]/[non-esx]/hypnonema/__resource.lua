


hypnonema_url 'https://thiago-dev.github.io/fivem-hypnonema'

hypnonema_poster_url 'https://imgur.com/F7IfBHy'


hypnonema_command_name 'hypnonema'


hypnonema_db_connString "Filename=hypnonema.db;Flush=true"

-- Whether logging is enabled or not
hypnonema_logging_enabled 'false'

-- The sync interval in ms
hypnonema_sync_interval '5000'



resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page 'client/html/index.html'
client_script 'client/Hypnonema.Client.net.dll'
server_script 'server/Hypnonema.Server.net.dll'

files {
    'client/Newtonsoft.Json.dll',
    'client/Hypnonema.Shared.dll',
    'client/html/index.html',
    'client/html/styles.css',
    'client/html/bg.png',
    'client/html/*.js'
}