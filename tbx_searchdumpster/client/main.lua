ESX = exports["es_extended"]:getSharedObject()
searching = false
cachedDumpsters = {}

    if ESX["IsPlayerLoaded"]() then
		ESX["PlayerData"] = ESX["GetPlayerData"]()
    end

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(response)
	ESX["PlayerData"] = response
end)


Citizen["CreateThread"](function()
    while true do
        local sleepThread = 750
        lib.hideTextUI() 
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        if searching then DisableControls() end -- Prevent cancel the animation and walk away
        for i = 1, #Config["Dumpsters"] do
            local entity = GetClosestObjectOfType(playerCoords, 1.0, GetHashKey(Config["Dumpsters"][i]), false, false, false)
            local entityCoords = GetEntityCoords(entity)
            

            if DoesEntityExist(entity) then
                sleepThread = 5
                lib.showTextUI('[E]- pro prohledání')
                
                if IsControlJustReleased(0, 38) then
                    if not cachedDumpsters[entity] then
                        Search(entity)
                    else
                        lib.notify({
                            title = Strings["Searched"],
                            description = 'Proč znovu?',
                            style = {
                                backgroundColor = '#141517',
                                color = '#909296'
                            },
                            icon = 'ban',
                            iconColor = '#C53030'
                        })

                    end
                end
                --              
                break
            end
        end

        Citizen["Wait"](sleepThread)
    end
end)







Search = function(entity)
    searching = true
    cachedDumpsters[entity] = true
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_SHOPPING_CART", 0, true)
    if lib.progressBar({
        duration = Config["SearchTime"],
        label = 'Prohledávání',
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
        },
    }) then print('Do stuff when complete') else print('Do stuff when cancelled') end

    ESX["TriggerServerCallback"](GetCurrentResourceName(), function(found, object, quantity)
            if found then
                lib.notify({
                    title = Strings["Found"],
                    description = quantity .. "x " .. object,
                    type = 'success'
                })

            else
                lib.notify({
                    title = Strings["Nothing"],
                    description = 'zkuste to znova!',
                    style = {
                        backgroundColor = '#141517',
                        color = '#909296'
                    },
                    icon = 'ban',
                    iconColor = '#C53030'
                })

            end
        end)
        searching = false
        ClearPedTasks(PlayerPedId())
    end


DisableControls = function()
    DisableControlAction(0, 73) -- X (Handsup)
    DisableControlAction(0, 323) -- X (Reset)
    DisableControlAction(0, 288) -- F1 (Phone)
    DisableControlAction(0, 289) -- F2 (Inventory)
    DisableControlAction(0, 170) -- F3 (Menu)
    DisableControlAction(0, 166) -- F5 (Menu)
    DisableControlAction(0, 167) -- F6 (Menu)
end
