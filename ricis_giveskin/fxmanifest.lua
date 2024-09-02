fx_version 'cerulean'
game 'gta5'

author 'RiCI'
description 'ESX Give SKin System'
version '1.0.0'

server_scripts {
    'shared/config.lua',
    'server/server.lua'
}

client_scripts {
    'client/client.lua'
}

shared_script{
    'shared/config.lua'
}

dependencies {
    'es_extended',
    'esx_skin'
}
