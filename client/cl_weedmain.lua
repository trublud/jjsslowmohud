if Config.EnableWeed then
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do Citizen.Wait(10) end

    ESX.PlayerData = ESX.GetPlayerData()
end)

Keys = {
    ['ESC'] = 322,
    ['F1'] = 288,
    ['F2'] = 289,
    ['F3'] = 170,
    ['F5'] = 166,
    ['F6'] = 167,
    ['F7'] = 168,
    ['F8'] = 169,
    ['F9'] = 56,
    ['F10'] = 57,
    ['~'] = 243,
    ['1'] = 157,
    ['2'] = 158,
    ['3'] = 160,
    ['4'] = 164,
    ['5'] = 165,
    ['6'] = 159,
    ['7'] = 161,
    ['8'] = 162,
    ['9'] = 163,
    ['-'] = 84,
    ['='] = 83,
    ['BACKSPACE'] = 177,
    ['TAB'] = 37,
    ['Q'] = 44,
    ['W'] = 32,
    ['E'] = 38,
    ['R'] = 45,
    ['T'] = 245,
    ['Y'] = 246,
    ['U'] = 303,
    ['P'] = 199,
    ['['] = 39,
    [']'] = 40,
    ['ENTER'] = 18,
    ['CAPS'] = 137,
    ['A'] = 34,
    ['S'] = 8,
    ['D'] = 9,
    ['F'] = 23,
    ['G'] = 47,
    ['H'] = 74,
    ['K'] = 311,
    ['L'] = 182,
    ['LEFTSHIFT'] = 21,
    ['Z'] = 20,
    ['X'] = 73,
    ['C'] = 26,
    ['V'] = 0,
    ['B'] = 29,
    ['N'] = 249,
    ['M'] = 244,
    [','] = 82,
    ['.'] = 81,
    ['LEFTCTRL'] = 36,
    ['LEFTALT'] = 19,
    ['SPACE'] = 22,
    ['RIGHTCTRL'] = 70,
    ['HOME'] = 213,
    ['PAGEUP'] = 10,
    ['PAGEDOWN'] = 11,
    ['DELETE'] = 178,
    ['LEFT'] = 174,
    ['RIGHT'] = 175,
    ['TOP'] = 27,
    ['DOWN'] = 173
}

local SpawnedPlants = {}
local InteractedPlant = nil
local HarvestedPlants = {}
local canHarvest = true
local closestPlant = nil
local isDoingAction = false
local SpawnedPlantsObj ={}
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(150)

        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local inRange = false

        for i = 1, #Config.Plants do
            local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z,
                                                  Config.Plants[i].x,
                                                  Config.Plants[i].y,
                                                  Config.Plants[i].z, true)

            -- if Config.Plants[i].growth < 100 then
            if dist < 50.0 then
                inRange = true
                local hasSpawned = false
                local needsUpgrade = false
                local upgradeId = nil
                local tableRemove = nil

                for z = 1, #SpawnedPlants do
                    local p = SpawnedPlants[z]

                    if p.id == Config.Plants[i].id then
                        hasSpawned = true
                        if p.stage ~= Config.Plants[i].stage then
                            needsUpgrade = true
                            upgradeId = p.id
                            tableRemove = z
                        end
                    end
                end

                if not hasSpawned then
                    phealth = Config.Plants[i].health
                    local hash
                    if phealth > 75 then
                        if Config.Plants[i].stage == 1 then
                            hash = GetHashKey(
                                       Config.WeedStages[Config.Plants[i].stage])
                                    elseif Config.Plants[i].stage == 2 then
                                        hash = GetHashKey(Config.WeedStages[21])
                                    else 
                                 
                                        hash = GetHashKey(Config.WeedStages[31])
                                    end
                    elseif phealth > 50 then
                        if Config.Plants[i].stage == 1 then
                            hash = GetHashKey(Config.WeedStages[11])
                        elseif Config.Plants[i].stage == 2 then
                            hash = GetHashKey(Config.WeedStages[21])
                        else  
                           
                            hash = GetHashKey(Config.WeedStages[Config.Plants[i].stage])
                        end
                    else
                        if Config.Plants[i].stage == 1 then
                            hash = GetHashKey(Config.WeedStages[12])
                        else if Config.Plants[i].stage == 2 then
                            hash = GetHashKey(Config.WeedStages[21])
                        else 
                            hash = GetHashKey(Config.WeedStages[Config.Plants[i].stage])
                        end
                    end
                    end
               --     local hash = GetHashKey(
                          --           Config.WeedStages[Config.Plants[i].stage])
                    RequestModel(hash)
                    local data = {}
                    data.id = Config.Plants[i].id
                    data.stage = Config.Plants[i].stage

                    while not HasModelLoaded(hash) do
                        Citizen.Wait(10)
                        RequestModel(hash)
                    end

                    data.obj = CreateObject(hash, Config.Plants[i].x,
                                            Config.Plants[i].y,
                                            Config.Plants[i].z +
                                                GetPlantZ(Config.Plants[i].stage),
                                            false, false, false)
                    SetEntityAsMissionEntity(data.obj, true)
                    FreezeEntityPosition(data.obj, true)
                    table.insert(SpawnedPlants, data)
                    hasSpawned = false
                end

                if needsUpgrade then
                  
                    for o = 1, #SpawnedPlants do
                        local u = SpawnedPlants[o]

                        if u.id == upgradeId then
                            placeit('bkr_prop_weed_fan_floor_01a',u.obj,Config.Plants[i].z )
                            SetEntityAsMissionEntity(u.obj, false)
                            FreezeEntityPosition(u.obj, false)
                            DeleteObject(u.obj)

                          --  local hash = GetHashKey(
                                            -- Config.WeedStages[Config.Plants[i]
                                               --  .stage])
                                               phealth = Config.Plants[i].health
                                               local hash
                                               if phealth >= 75 then
                                                   if Config.Plants[i].stage == 1 then
                                                       hash = GetHashKey(
                                                                  Config.WeedStages[Config.Plants[i].stage])
                                                               elseif Config.Plants[i].stage == 2 then
                                                                   hash = GetHashKey(Config.WeedStages[21])
                                                               else 
                                                                   hash = GetHashKey(Config.WeedStages[31])
                                                               end
                                               elseif phealth >= 50 then
                                                   if Config.Plants[i].stage == 1 then
                                                       hash = GetHashKey(Config.WeedStages[11])
                                                   elseif Config.Plants[i].stage == 2 then
                                                       hash = GetHashKey(Config.WeedStages[21])
                                                   else 
                                                       hash = GetHashKey(Config.WeedStages[Config.Plants[i].stage])
                                                   end
                                               else
                                                   if Config.Plants[i].stage == 1 then
                                                       hash = GetHashKey(Config.WeedStages[12])
                                                   elseif Config.Plants[i].stage == 2 then
                                                       hash = GetHashKey(Config.WeedStages[21])
                                                   else 
                                                       hash = GetHashKey(Config.WeedStages[Config.Plants[i].stage])
                                                   end
                                               end
                            RequestModel(hash)
                            local data = {}
                            data.id = Config.Plants[i].id
                            data.stage = Config.Plants[i].stage

                            while not HasModelLoaded(hash) do
                                Citizen.Wait(10)
                                RequestModel(hash)
                            end

                            data.obj = CreateObject(hash, Config.Plants[i].x,
                                                    Config.Plants[i].y,
                                                    Config.Plants[i].z +
                                                        GetPlantZ(
                                                            Config.Plants[i]
                                                                .stage), false,
                                                    false, false)
                            SetEntityAsMissionEntity(data.obj, true)
                            FreezeEntityPosition(data.obj, true)
                            table.remove(SpawnedPlants, o)
                            table.insert(SpawnedPlants, data)
                            needsUpgrade = false
                        end
                    end
                end
            end
            -- end
        end
        for i = 1, 14 do
			EnableDispatchService(i, true)
		end
        if not InRange then Citizen.Wait(5000) end
    end

end)

function placeit(objhash,plant,zloc)
    local hash = GetHashKey(objhash)
     
  
        local pos =
            GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 1.0, 0.0)
    
        if CanPlantSeedHere(pos) and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
          
          
          
       
RequestModel(hash)
local data = {}
data.id = #SpawnedPlantsObj+1
data.hash=hash

while not HasModelLoaded(hash) do
Citizen.Wait(10)
RequestModel(hash)
end

data.obj = CreateObject(hash, pos.x, pos.y, zloc , true, true, true)
PlaceObjectOnGroundProperly(data.obj )
SetEntityAsMissionEntity(data.obj, true)
FreezeEntityPosition(data.obj, true)
--table.remove(SpawnedPlantsObj, o)
table.insert(SpawnedPlantsObj, data)
          
            
        else
            exports['mythic_notify']:SendAlert('error', 'Too close to another object')
        end
   
end

function DestroyPlant()
    local plant = GetClosestPlant()
    local hasDone = false

    for k, v in pairs(HarvestedPlants) do
        if v == plant.id then hasDone = true end
    end

    if not hasDone then
        table.insert(HarvestedPlants, plant.id)
        local ped = GetPlayerPed(-1)
        isDoingAction = true
        TriggerServerEvent('jjsslowmohud:weed:plantHasBeenHarvested', plant.id)

        RequestAnimDict('amb@prop_human_bum_bin@base')
        while not HasAnimDictLoaded('amb@prop_human_bum_bin@base') do
            Citizen.Wait(0)
        end

        TaskPlayAnim(ped, 'amb@prop_human_bum_bin@base', 'base', 8.0, 8.0, -1,
                     1, 1, 0, 0, 0)
        FreezeEntityPosition(ped, true)
        exports['progressBars']:startUI(5000, "Destroying...")
        Citizen.Wait(5000)
        TriggerServerEvent('jjsslowmohud:weed:destroyPlant', plant.id)
        isDoingAction = false
        canHarvest = true
        FreezeEntityPosition(ped, false)
        ClearPedTasksImmediately(ped)
      
    else
        exports['mythic_notify']:SendAlert('error', 'Error')
    end
end

function HarvestWeedPlant()
    local plant = GetClosestPlant()
    local hasDone = false

    for k, v in pairs(HarvestedPlants) do
        if v == plant.id then hasDone = true end
    end

    if not hasDone then
        table.insert(HarvestedPlants, plant.id)
        local ped = GetPlayerPed(-1)
        isDoingAction = true
        TriggerServerEvent('jjsslowmohud:weed:plantHasBeenHarvested', plant.id)

        RequestAnimDict('amb@prop_human_bum_bin@base')
        while not HasAnimDictLoaded('amb@prop_human_bum_bin@base') do
            Citizen.Wait(0)
        end

        TaskPlayAnim(ped, 'amb@prop_human_bum_bin@base', 'base', 8.0, 8.0, -1,
                     1, 1, 0, 0, 0)
        FreezeEntityPosition(ped, true)
        exports['progressBars']:startUI(5000, "Harvesting...")
        Citizen.Wait(5000)
        TriggerServerEvent('jjsslowmohud:weed:harvestWeed', plant.id)
        isDoingAction = false
        canHarvest = true
        FreezeEntityPosition(ped, false)
        ClearPedTasksImmediately(ped)
     
    else
        exports['mythic_notify']:SendAlert('error', 'Error')
    end
end

function RemovePlantFromTable(plantId)
    for k, v in pairs(Config.Plants) do
        if v.id == plantId then table.remove(Config.Plants, k) end
    end
end





RegisterNetEvent('jjsslowmohud:weed:client:addFan')
AddEventHandler('jjsslowmohud:weed:client:addFan', function()
    local entity = nil
    local plant = GetClosestPlant()
    isDoingAction = true

    for k, v in pairs(SpawnedPlants) do
        if v.id == plant.id then entity = v.obj end
    end

    TaskTurnPedToFaceEntity(GetPlayerPed(-1), entity, -1)

    RequestAnimDict('amb@prop_human_bum_bin@base')
    while not HasAnimDictLoaded('amb@prop_human_bum_bin@base') do
        Citizen.Wait(0)
    end

    TaskPlayAnim(ped, 'amb@prop_human_bum_bin@base', 'base', 8.0, 8.0, -1, 1, 1,
                 0, 0, 0)
    FreezeEntityPosition(ped, false)
    exports['progressBars']:startUI(2000, "Adding Fan Speed...")
    Citizen.Wait(2000)
    TriggerServerEvent('jjsslowmohud:weed:server:addfan', plant.id)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    isDoingAction = false
end)





RegisterNetEvent('jjsslowmohud:weed:client:changeSoil')
AddEventHandler('jjsslowmohud:weed:client:changeSoil', function()
    local entity = nil
    local plant = GetClosestPlant()
    isDoingAction = true

    for k, v in pairs(SpawnedPlants) do
        if v.id == plant.id then entity = v.obj end
    end

    TaskTurnPedToFaceEntity(GetPlayerPed(-1), entity, -1)

    RequestAnimDict('amb@prop_human_bum_bin@base')
    while not HasAnimDictLoaded('amb@prop_human_bum_bin@base') do
        Citizen.Wait(0)
    end

    TaskPlayAnim(ped, 'amb@prop_human_bum_bin@base', 'base', 8.0, 8.0, -1, 1, 1,
                 0, 0, 0)
    FreezeEntityPosition(ped, false)
    exports['progressBars']:startUI(2000, "Changing Soil...")
    Citizen.Wait(2000)
    TriggerServerEvent('jjsslowmohud:weed:server:changeSoil', plant.id)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    isDoingAction = false
end)
RegisterNetEvent('jjsslowmohud:weed:client:addHumidity')
AddEventHandler('jjsslowmohud:weed:client:addHumidity', function()
    local entity = nil
    local plant = GetClosestPlant()
    isDoingAction = true

    for k, v in pairs(SpawnedPlants) do
        if v.id == plant.id then entity = v.obj end
    end

    TaskTurnPedToFaceEntity(GetPlayerPed(-1), entity, -1)

    RequestAnimDict('amb@prop_human_bum_bin@base')
    while not HasAnimDictLoaded('amb@prop_human_bum_bin@base') do
        Citizen.Wait(0)
    end

    TaskPlayAnim(ped, 'amb@prop_human_bum_bin@base', 'base', 8.0, 8.0, -1, 1, 1,
                 0, 0, 0)
    FreezeEntityPosition(ped, false)
    exports['progressBars']:startUI(2000, "Adding Humidity ...")
    Citizen.Wait(2000)
    TriggerServerEvent('jjsslowmohud:weed:server:addHumidity', plant.id)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    isDoingAction = false
end)
RegisterNetEvent('jjsslowmohud:weed:client:addphup')
AddEventHandler('jjsslowmohud:weed:client:addphup', function()
    local entity = nil
    local plant = GetClosestPlant()
    isDoingAction = true

    for k, v in pairs(SpawnedPlants) do
        if v.id == plant.id then entity = v.obj end
    end

    TaskTurnPedToFaceEntity(GetPlayerPed(-1), entity, -1)

    RequestAnimDict('amb@prop_human_bum_bin@base')
    while not HasAnimDictLoaded('amb@prop_human_bum_bin@base') do
        Citizen.Wait(0)
    end

    TaskPlayAnim(ped, 'amb@prop_human_bum_bin@base', 'base', 8.0, 8.0, -1, 1, 1,
                 0, 0, 0)
    FreezeEntityPosition(ped, false)
    exports['progressBars']:startUI(2000, "Adding ph up ...")
    Citizen.Wait(2000)
    TriggerServerEvent('jjsslowmohud:weed:server:addphup', plant.id)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    isDoingAction = false
end)
RegisterNetEvent('jjsslowmohud:weed:client:addphdown')
AddEventHandler('jjsslowmohud:weed:client:addphdown', function()
    local entity = nil
    local plant = GetClosestPlant()
    isDoingAction = true

    for k, v in pairs(SpawnedPlants) do
        if v.id == plant.id then entity = v.obj end
    end

    TaskTurnPedToFaceEntity(GetPlayerPed(-1), entity, -1)

    RequestAnimDict('amb@prop_human_bum_bin@base')
    while not HasAnimDictLoaded('amb@prop_human_bum_bin@base') do
        Citizen.Wait(0)
    end

    TaskPlayAnim(ped, 'amb@prop_human_bum_bin@base', 'base', 8.0, 8.0, -1, 1, 1,
                 0, 0, 0)
    FreezeEntityPosition(ped, false)
    exports['progressBars']:startUI(2000, "Adding ph down ...")
    Citizen.Wait(2000)
    TriggerServerEvent('jjsslowmohud:weed:server:addphdown', plant.id)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    isDoingAction = false
end)

RegisterNetEvent('jjsslowmohud:weed:client:NewWaterplant')
AddEventHandler('jjsslowmohud:weed:client:NewWaterplant', function()
    local entity = nil
    local plant = GetClosestPlant()
    isDoingAction = true

    for k, v in pairs(SpawnedPlants) do
        if v.id == plant.id then entity = v.obj end
    end

    TaskTurnPedToFaceEntity(GetPlayerPed(-1), entity, -1)

    RequestAnimDict('amb@prop_human_bum_bin@base')
    while not HasAnimDictLoaded('amb@prop_human_bum_bin@base') do
        Citizen.Wait(0)
    end

    TaskPlayAnim(ped, 'amb@prop_human_bum_bin@base', 'base', 8.0, 8.0, -1, 1, 1,
                 0, 0, 0)
    FreezeEntityPosition(ped, false)
    exports['progressBars']:startUI(2000, "Changing Soil ...")
    Citizen.Wait(2000)
    TriggerServerEvent('jjsslowmohud:weed:server:changeSoil', plant.id)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    isDoingAction = false
end)
RegisterNetEvent('jjsslowmohud:weed:client:addTemp')
AddEventHandler('jjsslowmohud:weed:client:addTemp', function()
    local entity = nil
    local plant = GetClosestPlant()
    isDoingAction = true

    for k, v in pairs(SpawnedPlants) do
        if v.id == plant.id then entity = v.obj end
    end

    TaskTurnPedToFaceEntity(GetPlayerPed(-1), entity, -1)

    RequestAnimDict('amb@prop_human_bum_bin@base')
    while not HasAnimDictLoaded('amb@prop_human_bum_bin@base') do
        Citizen.Wait(0)
    end

    TaskPlayAnim(ped, 'amb@prop_human_bum_bin@base', 'base', 8.0, 8.0, -1, 1, 1,
                 0, 0, 0)
    FreezeEntityPosition(ped, false)
    exports['progressBars']:startUI(2000, "Adding AC...")
    Citizen.Wait(2000)
    TriggerServerEvent('jjsslowmohud:weed:server:addTemp', plant.id)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    isDoingAction = false
end)
RegisterNetEvent('jjsslowmohud:weed:client:addLights')
AddEventHandler('jjsslowmohud:weed:client:addLights', function()
    local entity = nil
    local plant = GetClosestPlant()
    isDoingAction = true

    for k, v in pairs(SpawnedPlants) do
        if v.id == plant.id then entity = v.obj end
    end

    TaskTurnPedToFaceEntity(GetPlayerPed(-1), entity, -1)

    RequestAnimDict('amb@prop_human_bum_bin@base')
    while not HasAnimDictLoaded('amb@prop_human_bum_bin@base') do
        Citizen.Wait(0)
    end

    TaskPlayAnim(ped, 'amb@prop_human_bum_bin@base', 'base', 8.0, 8.0, -1, 1, 1,
                 0, 0, 0)
    FreezeEntityPosition(ped, false)
    exports['progressBars']:startUI(2000, "adding Lights...")
    Citizen.Wait(2000)
    TriggerServerEvent('jjsslowmohud:weed:server:addLights', plant.id)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    isDoingAction = false
end)
RegisterNetEvent('jjsslowmohud:weed:client:addFan')
AddEventHandler('jjsslowmohud:weed:client:addFan', function()
    local entity = nil
    local plant = GetClosestPlant()
    isDoingAction = true

    for k, v in pairs(SpawnedPlants) do
        if v.id == plant.id then entity = v.obj end
    end

    TaskTurnPedToFaceEntity(GetPlayerPed(-1), entity, -1)

    RequestAnimDict('amb@prop_human_bum_bin@base')
    while not HasAnimDictLoaded('amb@prop_human_bum_bin@base') do
        Citizen.Wait(0)
    end

    TaskPlayAnim(ped, 'amb@prop_human_bum_bin@base', 'base', 8.0, 8.0, -1, 1, 1,
                 0, 0, 0)
    FreezeEntityPosition(ped, false)
    exports['progressBars']:startUI(2000, "Adding Fan...")
    Citizen.Wait(2000)
    TriggerServerEvent('jjsslowmohud:weed:server:addFan', plant.id)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    isDoingAction = false
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        local InRange = false
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        for k, v in pairs(Config.Plants) do
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, true) <
                1.3 and not isDoingAction and not v.beingHarvested and
                not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
               
                    if v.growth < 100 then
                        local plant = GetClosestPlant()
                        DrawText3D(v.x, v.y, v.z,
                                   'Thirst: ' .. v.thirst .. '% - Hunger: ' ..
                                       v.hunger .. '% - Growth: ' .. v.growth ..
                                       '% -  Quality: ' .. v.quality.. '%')
                        DrawText3D(v.x, v.y, v.z - 0.18,
                                   'Tend Plant: [ ~b~Q~w~ ]')
                            --[[       DrawText3D(v.x, v.y, v.z - 0.36,
                                   'Adjust:  [ ~b~.~w~ ]Fans - [ ~y~,~w~ ]Lights - [ ~y~[~w~ ]Humidity - [ ~b~]~w~ ]Temp')
                        DrawText3D(v.x, v.y, v.z + 0.18,
                                   'Humidity: ' .. v.humidity ..
                                       '% - Temperture: ' .. v.temp ..
                                       '% - Air: ' .. v.air .. '% -  Light: ' ..
                                       v.light .. '%')
                        DrawText3D(v.x, v.y, v.z + 0.36,
                                   'PH: ' .. v.ph .. '  TDS: ' .. v.tds ..
                                       '  Age: ' .. (v.plantage or 1) ..
                                       '     Health: ' .. (v.health or 0))
                   
                        if IsControlJustReleased(0, Keys["G"]) then
                            if v.id == plant.id then
                                TriggerServerEvent(
                                    'jjsslowmohud:server:checkPlayerHasThisItem',
                                    'water_bottle',
                                    'jjsslowmohud:weed:client:waterPlant', true)
                            end
                        elseif IsControlJustReleased(0, Keys["H"]) then
                            if v.id == plant.id then
                                TriggerServerEvent(
                                    'jjsslowmohud:server:checkPlayerHasThisItem',
                                    'fertilizer', 'jjsslowmohud:weed:client:feedPlant',
                                    true)
                            end
                        elseif IsControlJustReleased(0, Keys["U"]) then
                            if v.id == plant.id then
                                TriggerServerEvent(
                                    'jjsslowmohud:server:checkPlayerHasThisItem',
                                    'soil_change', 'jjsslowmohud:weed:client:changeSoil',
                                    true)
                            end
                        elseif IsControlJustReleased(0, Keys["["]) then
                            if v.id == plant.id then
                                TriggerServerEvent(
                                    'jjsslowmohud:server:checkPlayerHasThisItem',
                                    'humidity_pack', 'jjsslowmohud:weed:client:addHumidity',
                                    true)
                            end
                        elseif IsControlJustReleased(0, Keys["."]) then
                            if v.id == plant.id then
                                TriggerServerEvent(
                                    'jjsslowmohud:server:checkPlayerHasThisItem',
                                    'fan_pack', 'jjsslowmohud:weed:client:addFan',
                                    true)
                            end
                        elseif IsControlJustReleased(0, Keys[","]) then
                            if v.id == plant.id then
                                TriggerServerEvent(
                                    'jjsslowmohud:server:checkPlayerHasThisItem',
                                    'light_pack', 'jjsslowmohud:weed:client:addLights',
                                    true)
                            end
                        elseif IsControlJustReleased(0, Keys["]"]) then
                            if v.id == plant.id then
                                TriggerServerEvent(
                                    'jjsslowmohud:server:checkPlayerHasThisItem',
                                    'temperture_pack', 'jjsslowmohud:weed:client:addTemp',
                                    true)
                            end
                        end
                         ]]
                    else
                        DrawText3D(v.x, v.y, v.z,
                                   '[Can Harvest! - Quality: ' .. v.quality .. ']')
                                   DrawText3D(v.x, v.y, v.z - 0.18,
                                   'Tend Plant: [ ~b~Q~w~ ]')
                      --  DrawText3D(v.x, v.y, v.z - 0.18, '~g~Q~w~ - Harvest')
                     --   if IsControlJustReleased(0, Keys["E"]) and canHarvest then
                     --       local plant = GetClosestPlant()
                       --     if v.id == plant.id then
                        --        HarvestWeedPlant()
                        --    end
                      --  end
                    end
                
            end
        end
    end
end)

local IsSearching = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(12)
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local InRange = false

        for k, v in pairs(Config.SeedLocations) do
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z) <
                1.5 then InRange = true end
        end

        if InRange and not IsSearching and
            not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
            DrawText3D(pos.x, pos.y, pos.z, '~y~G~w~ - Search')
            if IsControlJustReleased(0, Keys["G"]) then
                IsSearching = true
                RequestAnimDict('amb@prop_human_bum_bin@base')
                while not HasAnimDictLoaded('amb@prop_human_bum_bin@base') do
                    Citizen.Wait(0)
                end

                TaskPlayAnim(ped, 'amb@prop_human_bum_bin@base', 'base', 8.0,
                             8.0, -1, 1, 1, 0, 0, 0)
                FreezeEntityPosition(ped, true)
                exports['progressBars']:startUI(10000, "Searching...")
                Citizen.Wait(10000)
                FreezeEntityPosition(ped, false)
                IsSearching = false
                ClearPedTasksImmediately(ped)
                if math.random(1, 10) == 7 then
                    TriggerServerEvent('jjsslowmohud:weed:server:giveShittySeed')
                end
            end
        else
            Citizen.Wait(3000)
        end
    end
end)

function GetClosestPlants()
    local dist = 1000
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local plant = {}

    for i = 1, #Config.Plants do
        local xd = GetDistanceBetweenCoords(pos.x, pos.y, pos.z,
                                            Config.Plants[i].x,
                                            Config.Plants[i].y,
                                            Config.Plants[i].z, true)
        if xd < dist then
            dist = xd
            plant = Config.Plants[i]
        end
    end

    return plant
end

RegisterNetEvent('jjsslowmohud:weed:client:removeWeedObject')
AddEventHandler('jjsslowmohud:weed:client:removeWeedObject', function(plant)
    for i = 1, #SpawnedPlants do
        local o = SpawnedPlants[i]
        if o.id == plant then
            SetEntityAsMissionEntity(o.obj, false)
            FreezeEntityPosition(o.obj, false)
            DeleteObject(o.obj)
        end
    end
end)

RegisterNetEvent('jjsslowmohud:weed:client:notify')
AddEventHandler('jjsslowmohud:weed:client:notify', function(msg)
 
    if Config.UseESX and ESX ~= nil then
        esxnotification('🌿', ' ', msg, 1000)
    else
           exports['mythic_notify']:SendAlert('inform', msg)
    end
end)

RegisterNetEvent('jjsslowmohud:weed:client:waterPlant')
AddEventHandler('jjsslowmohud:weed:client:waterPlant', function()
    local entity = nil
    local plant = GetClosestPlant()
    local ped = GetPlayerPed(-1)
    isDoingAction = true

    for k, v in pairs(SpawnedPlants) do
        if v.id == plant.id then entity = v.obj end
    end

    TaskTurnPedToFaceEntity(GetPlayerPed(-1), entity, -1)

    RequestAnimDict('amb@prop_human_bum_bin@base')
    while not HasAnimDictLoaded('amb@prop_human_bum_bin@base') do
        Citizen.Wait(0)
    end

    TaskPlayAnim(ped, 'amb@prop_human_bum_bin@base', 'base', 8.0, 8.0, -1, 1, 1,
                 0, 0, 0)
    FreezeEntityPosition(ped, true)
    exports['progressBars']:startUI(2000, "Watering...")
    Citizen.Wait(2000)
    FreezeEntityPosition(ped, false)
    TriggerServerEvent('jjsslowmohud:weed:server:waterPlant', plant.id)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    isDoingAction = false
end)

RegisterNetEvent('jjsslowmohud:weed:client:feedPlant')
AddEventHandler('jjsslowmohud:weed:client:feedPlant', function()
    local entity = nil
    local plant = GetClosestPlant()
    isDoingAction = true

    for k, v in pairs(SpawnedPlants) do
        if v.id == plant.id then entity = v.obj end
    end

    TaskTurnPedToFaceEntity(GetPlayerPed(-1), entity, -1)

    RequestAnimDict('amb@prop_human_bum_bin@base')
    while not HasAnimDictLoaded('amb@prop_human_bum_bin@base') do
        Citizen.Wait(0)
    end

    TaskPlayAnim(ped, 'amb@prop_human_bum_bin@base', 'base', 8.0, 8.0, -1, 1, 1,
                 0, 0, 0)
    FreezeEntityPosition(ped, false)
    exports['progressBars']:startUI(2000, "Fertilizing...")
    Citizen.Wait(2000)
    TriggerServerEvent('jjsslowmohud:weed:server:feedPlant', plant.id)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    isDoingAction = false
end)
RegisterNetEvent('jjsslowmohud:weed:client:updateWeedobjData')
AddEventHandler('jjsslowmohud:weed:client:updateWeedobjData',
                function(data) Config.PlantsObj = data end)

RegisterNetEvent('jjsslowmohud:weed:client:updateWeedData')
AddEventHandler('jjsslowmohud:weed:client:updateWeedData',
                function(data) Config.Plants = data end)

RegisterNetEvent('jjsslowmohud:weed:client:plantNewSeed')
AddEventHandler('jjsslowmohud:weed:client:plantNewSeed', function(type)
    local pos =
        GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 1.0, 0.0)

    if CanPlantSeedHere(pos) and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
        TriggerServerEvent('jjsslowmohud:weed:server:plantNewSeed', type, pos)
    else
        exports['mythic_notify']:SendAlert('error', 'Too close to another plant')
    end
end)

RegisterNetEvent('jjsslowmohud:weed:client:plantSeedConfirm')
AddEventHandler('jjsslowmohud:weed:client:plantSeedConfirm', function()
    RequestAnimDict("pickup_object")
    while not HasAnimDictLoaded("pickup_object") do Citizen.Wait(7) end
    TaskPlayAnim(GetPlayerPed(-1), "pickup_object", "pickup_low", 8.0, -8.0, -1,
                 1, 0, false, false, false)
    Citizen.Wait(1800)
    ClearPedTasks(GetPlayerPed(-1))
end)

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function CanPlantSeedHere(pos)
    local canPlant = true

    for i = 1, #Config.Plants do
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Plants[i].x,
                                    Config.Plants[i].y, Config.Plants[i].z, true) <
            1.3 then canPlant = false end
    end

    return canPlant
end

function GetPlantZ(stage)
    if stage == 1 then
        return -1.0
    else
        return -3.5
    end
end
end