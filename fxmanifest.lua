fx_version 'cerulean'
game 'gta5'

author 'Khazadream'
description 'Prop menu to visualize props'
version '0.0.1'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
}

client_scripts { 
    '@menuv/menuv.lua',
    'config.lua',
    'client/*.lua',
}
server_scripts { 
    'server/*.lua',
    '@oxmysql/lib/MySQL.lua',
}

-- dependencies {
--     'qb-core',
--     'oxmysql',
--     'menuv'
-- }