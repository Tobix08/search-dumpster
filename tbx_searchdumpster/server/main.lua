ESX = exports["es_extended"]:getSharedObject()

ESX["RegisterServerCallback"](GetCurrentResourceName(), function(source, cb)
    local player = ESX["GetPlayerFromId"](source)
    local luck = math["random"](1, 6)

    if player then
        if luck == 5 then
            local randomItem = Config["Items"][math["random"](#Config["Items"])]
            local quantity = math["random"](#Config["Items"])
            local itemLabel = ESX["GetItemLabel"](randomItem)

            if player["canCarryItem"](randomItem, quantity) then
                player["addInventoryItem"](randomItem, 2)
                cb(true, itemLabel, 2)
            else
                cb(false)
            end
        else
            if Config["EnableWeapons"] then -- disabled by default, enable in the config.
                if luck == 1 then
                    local randomWeapon = Config["Weapons"][math["random"](#Config["Weapons"])]
                    local ammunition = math["random"](#Config["Weapons"])
                    local weaponLabel = ESX["GetWeaponLabel"](randomWeapon)

                    if player["hasWeapon"](randomWeapon) then
                        cb(false)
                    else
                        player["addInventoryItem"](randomWeapon, ammunition)
                        cb(true, weaponLabel, 1)
                    end
                else
                    cb(false)
                end
            else
                cb(false)
            end
        end
    else
        cb(false)
    end
end)
