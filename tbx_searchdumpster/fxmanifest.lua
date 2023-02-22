fx_version "bodacious"

game "gta5"

lua54 'yes'

description "baz_dumpsters"

version "1.0.1"

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_script "client/main.lua"

server_script "server/main.lua"
