if Config.EnableWeed then
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local PlantsLoaded = false


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        if PlantsLoaded then
            TriggerClientEvent('jjsslowmohud:weed:client:updateWeedData', -1, Config.Plants)
        end
    end
end)

Citizen.CreateThread(function()
    TriggerEvent('jjsslowmohud:weed:server:getWeedPlants')
    print('PLANTS HAVE BEEN LOADED')
    PlantsLoaded = true
end)

ESX.RegisterUsableItem('weed_og-kush_seed', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'og_kush')
    xPlayer.removeInventoryItem('weed_og-kush_seed', 1)
end)
RegisterCommand('weed', function(source, args, raw)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.addInventoryItem('soil_change', 1)
    xPlayer.addInventoryItem('ph_up', 1)
    xPlayer.addInventoryItem('ph_down', 1)
    xPlayer.addInventoryItem('temperture_pack', 1)
    xPlayer.addInventoryItem('fan_pack', 1)
    xPlayer.addInventoryItem('humidity_pack', 1)
    xPlayer.addInventoryItem('light_pack', 1)
    xPlayer.addInventoryItem('water_bottle', 1)
    xPlayer.addInventoryItem('fertilizer', 1)
    xPlayer.addInventoryItem('gdp_seed', 1)
    xPlayer.addInventoryItem('cheeseberry_seed', 1)    
    xPlayer.addInventoryItem('ambulance_seed', 1)
    TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'granddaddy_purp')

end,true)
ESX.RegisterUsableItem('ph_up', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

   -- TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'blue_dream')
    xPlayer.removeInventoryItem('ph_up', 1)
end)
ESX.RegisterUsableItem('ph_down', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

   -- TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'blue_dream')
    xPlayer.removeInventoryItem('ph_down', 1)
end)
ESX.RegisterUsableItem('temperture_pack', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

   -- TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'blue_dream')
    xPlayer.removeInventoryItem('temperture_pack', 1)
end)
ESX.RegisterUsableItem('fan_pack', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

   -- TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'blue_dream')
    xPlayer.removeInventoryItem('fan_pack', 1)
end)
ESX.RegisterUsableItem('light_pack', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

   -- TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'blue_dream')
    xPlayer.removeInventoryItem('light_pack', 1)
end)
ESX.RegisterUsableItem('humidity_pack', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

   -- TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'blue_dream')
    xPlayer.removeInventoryItem('humidity_pack', 1)
end)









ESX.RegisterUsableItem('weed_peauto', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

   -- TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'blue_dream')
    xPlayer.removeInventoryItem('weed_peauto', 1)
end)
ESX.RegisterUsableItem('peauto_seed', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'peauto')
    xPlayer.removeInventoryItem('peauto_seed', 1)
end)

ESX.RegisterUsableItem('weed_purpun', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

   -- TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'blue_dream')
    xPlayer.removeInventoryItem('weed_purpun', 1)
end)
ESX.RegisterUsableItem('purpun_seed', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'purpun')
    xPlayer.removeInventoryItem('purpun_seed', 1)
end)

ESX.RegisterUsableItem('weed_nlight', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

   -- TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'blue_dream')
    xPlayer.removeInventoryItem('weed_nlight', 1)
end)
ESX.RegisterUsableItem('nlight_seed', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'nlight')
    xPlayer.removeInventoryItem('nlight_seed', 1)
end)


ESX.RegisterUsableItem('gdp_seed', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'granddaddy_purp')
    xPlayer.removeInventoryItem('gdp_seed', 1)
end)


ESX.RegisterUsableItem('weed_granddaddy', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

   -- TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'blue_dream')
    xPlayer.removeInventoryItem('weed_granddaddy', 1)
end)
ESX.RegisterUsableItem('cheeseberry_seed', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'cheeseberry')
    xPlayer.removeInventoryItem('cheeseberry_seed', 1)
end)

ESX.RegisterUsableItem('weed_cheeseberry', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

   -- TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'blue_dream')
    xPlayer.removeInventoryItem('weed_cheeseberry', 1)
end)



ESX.RegisterUsableItem('weed_ambulance', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

   -- TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'blue_dream')
    xPlayer.removeInventoryItem('weed_ambulance', 1)
end)
ESX.RegisterUsableItem('ambulance_seed', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'ambulance')
    xPlayer.removeInventoryItem('ambulance_seed', 1)
end)

ESX.RegisterUsableItem('weed_bananakush_seed', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'banana_kush')
    xPlayer.removeInventoryItem('weed_bananakush_seed', 1)
end)

ESX.RegisterUsableItem('weed_bluedream_seed', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'blue_dream')
    xPlayer.removeInventoryItem('weed_bluedream_seed', 1)
end)

ESX.RegisterUsableItem('weed_purple-haze_seed', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    TriggerClientEvent('jjsslowmohud:weed:client:plantNewSeed', src, 'purplehaze')
    xPlayer.removeInventoryItem('weed_purple-haze_seed', 1)
end)

RegisterServerEvent('jjsslowmohud:weed:server:saveWeedPlant')
AddEventHandler('jjsslowmohud:weed:server:saveWeedPlant', function(data)
    local data = json.encode(data)
    
    MySQL.Async.execute('INSERT INTO weed_plants (properties) VALUES (@properties)', {
        ['@properties'] = data,
    }, function ()
    end)
end)

RegisterServerEvent('jjsslowmohud:server:checkPlayerHasThisItem')
AddEventHandler('jjsslowmohud:server:checkPlayerHasThisItem', function(item, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer.getInventoryItem(item).count > 0 then
        TriggerClientEvent(cb, src)
    else
        TriggerClientEvent('jjsslowmohud:weed:client:notify', src, 'You are missing ' .. item)
    end
end)

RegisterServerEvent('jjsslowmohud:weed:server:giveShittySeed')
AddEventHandler('jjsslowmohud:weed:server:giveShittySeed', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.addInventoryItem(Config.BadSeedReward, math.random(1, 2))
end)
local Colors = {
    Stressed = {0, 153, 0, 0},
    PHWrong = {0, 0, 153, 176},
    TDSWrong = {0, 90, 102, 0},
    WaterWrong = {0, 200, 255, 0},
    Growing = {0, 255, 128, 128},
    Tend = {255, 255, 128, 128},
    Healing = {255, 0, 102, 102},
    Harvest = {255, 128, 128, 128}
}
RegisterServerEvent('jjsslowmohud:weed:server:plantNewSeed')
AddEventHandler('jjsslowmohud:weed:server:plantNewSeed', function(type, location)
    local src = source
    local plantId = math.random(111111, 999999)
    local xPlayer = ESX.GetPlayerFromId(src)
    local SeedData = {id = plantId, type = type, x = location.x, y = location.y, z = location.z, hunger = Config.StartingHunger, thirst = Config.StartingThirst, growth = 0.0, quality = 100.0, stage = 1, grace = true, beingHarvested = false, planter = xPlayer.identifier, light = Config.StartingLight, air = Config.StartingAir, temp = Config.StartingTemp, humidity = Config.StartingHumidity, ph = Config.StartingPH,tds = Config.StartingTDS, color=Colors.Growing, health=100}

    local PlantCount = 0

    for k, v in pairs(Config.Plants) do
        if v.planter == xPlayer.identifier then
            PlantCount = PlantCount + 1
        end
    end

    if PlantCount >= Config.MaxPlantCount then
        TriggerClientEvent('jjsslowmohud:weed:client:notify', src, 'You already have ' .. Config.MaxPlantCount .. ' plants down')
    else
        table.insert(Config.Plants, SeedData)
        TriggerClientEvent('jjsslowmohud:weed:client:plantSeedConfirm', src)
        TriggerEvent('jjsslowmohud:weed:server:saveWeedPlant', SeedData)
        TriggerEvent('jjsslowmohud:weed:server:updatePlants')
    end
end)

RegisterServerEvent('jjsslowmohud:weed:plantHasBeenHarvested')
AddEventHandler('jjsslowmohud:weed:plantHasBeenHarvested', function(plantId)
    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            v.beingHarvested = true
        end
    end

    TriggerEvent('jjsslowmohud:weed:server:updatePlants')
end)

RegisterServerEvent('jjsslowmohud:weed:destroyPlant')
AddEventHandler('jjsslowmohud:weed:destroyPlant', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            table.remove(Config.Plants, k)
        end
    end

    TriggerClientEvent('jjsslowmohud:weed:client:removeWeedObject', -1, plantId)
    TriggerEvent('jjsslowmohud:weed:server:weedPlantRemoved', plantId)
    TriggerEvent('jjsslowmohud:weed:server:updatePlants')
  
    TriggerClientEvent('jjsslowmohud:weed:client:notify', src, 'You destroy the weed plant')
end)

RegisterServerEvent('jjsslowmohud:weed:harvestWeed')
AddEventHandler('jjsslowmohud:weed:harvestWeed', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local amount
    local label
    local item
    local goodQuality = false
    local hasFound = false

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            for y = 1, #Config.YieldRewards do
                if v.type == Config.YieldRewards[y].type then
                    label = Config.YieldRewards[y].label
                    item = Config.YieldRewards[y].item
                    amount = math.random(Config.YieldRewards[y].rewardMin, Config.YieldRewards[y].rewardMax)
                    local quality = math.ceil(v.quality)
                    hasFound = true
                    table.remove(Config.Plants, k)
                    if quality > 94 then
                        goodQuality = true
                    end
                    amount = math.ceil(amount * (quality / 35))
                end
            end
        end
    end

    if hasFound then
        TriggerClientEvent('jjsslowmohud:weed:client:removeWeedObject', -1, plantId)
        TriggerEvent('jjsslowmohud:weed:server:weedPlantRemoved', plantId)
        TriggerEvent('jjsslowmohud:weed:server:updatePlants')
        if label ~= nil then
            TriggerClientEvent('jjsslowmohud:weed:client:notify', src, 'You harvest x' .. amount .. ' ' .. label)
        end
        xPlayer.addInventoryItem(item, amount)
        if goodQuality then
            if math.random(1, 10) > 3 then
                local seed = math.random(1, #Config.GoodSeedRewards)
                xPlayer.addInventoryItem(Config.GoodSeedRewards[seed], math.random(2, 4))
            end
        else
            xPlayer.addInventoryItem(Config.BadSeedRewards, math.random(1, 2))
        end
    else
        print('did not find')
    end
end)

RegisterServerEvent('jjsslowmohud:weed:server:updatePlants')
AddEventHandler('jjsslowmohud:weed:server:updatePlants', function()
    TriggerClientEvent('jjsslowmohud:weed:client:updateWeedData', -1, Config.Plants)
    TriggerClientEvent('jjsslowmohud:weed:client:updateWeedobjData', -1, Config.PlantsObj)
end)
RegisterServerEvent('jjsslowmohud:weed:server:addFan')
AddEventHandler('jjsslowmohud:weed:server:addFan', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].air= Config.Plants[k].air+20
          
            Config.Plants[k].health=Config.Plants[k].health +10
        end
    end

    xPlayer.removeInventoryItem('fan_pack', 1)
    TriggerEvent('jjsslowmohud:weed:server:updatePlants')
end)
RegisterServerEvent('jjsslowmohud:weed:server:addTemp')
AddEventHandler('jjsslowmohud:weed:server:addTemp', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].temp= Config.Plants[k].temp+20
          
            Config.Plants[k].health=Config.Plants[k].health +10
        end
    end

    xPlayer.removeInventoryItem('temperture_pack', 1)
    TriggerEvent('jjsslowmohud:weed:server:updatePlants')
end)
RegisterServerEvent('jjsslowmohud:weed:server:addHumidity')
AddEventHandler('jjsslowmohud:weed:server:addHumidity', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
         
            Config.Plants[k].humidity= Config.Plants[k].humidity+20
            Config.Plants[k].health=Config.Plants[k].health +10
        end
    end

    xPlayer.removeInventoryItem('humidity_pack', 1)
    TriggerEvent('jjsslowmohud:weed:server:updatePlants')
end)
RegisterServerEvent('jjsslowmohud:weed:server:addLights')
AddEventHandler('jjsslowmohud:weed:server:addLights', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
           
            Config.Plants[k].light= Config.Plants[k].light+20
            Config.Plants[k].health=Config.Plants[k].health +10
        end
    end

    xPlayer.removeInventoryItem('light_pack', 1)
    TriggerEvent('jjsslowmohud:weed:server:updatePlants')
end)
RegisterServerEvent('jjsslowmohud:weed:server:changeSoil')
AddEventHandler('jjsslowmohud:weed:server:changeSoil', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].thirst = Config.StartingThirst
            Config.Plants[k].thirst = Config.StartingHunger
            Config.Plants[k].tds = Config.StartingTDS
            Config.Plants[k].ph = Config.StartingPH
            Config.Plants[k].phflux=0
            Config.Plants[k].saltbuildup=0
            Config.Plants[k].waterage=1
            Config.Plants[k].health=Config.Plants[k].health +50
        end
    end

    xPlayer.removeInventoryItem('soil_change', 1)
    TriggerEvent('jjsslowmohud:weed:server:updatePlants')
end)

RegisterServerEvent('jjsslowmohud:weed:server:waterPlant')
AddEventHandler('jjsslowmohud:weed:server:waterPlant', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].thirst = Config.Plants[k].thirst +  math.random(Config.ThirstIncrease.min, Config.ThirstIncrease.max)
            Config.Plants[k].tds = Config.Plants[k].tds - (math.random(Config.TDSIncrease.min, Config.TDSIncrease.max)/5)
            Config.Plants[k].phflux=Config.Plants[k].phflux+0.2
            Config.Plants[k].ph=Config.Plants[k].ph+0.3
            Config.Plants[k].saltbuildup=Config.Plants[k].saltbuildup-1
            Config.Plants[k].waterage=Config.Plants[k].waterage-1
            Config.Plants[k].health=Config.Plants[k].health +20
            if Config.Plants[k].thirst > 100.0 then
                Config.Plants[k].thirst = 100.0
            end
        end
    end

    xPlayer.removeInventoryItem('water_bottle', 1)
    TriggerEvent('jjsslowmohud:weed:server:updatePlants')
end)
RegisterServerEvent('jjsslowmohud:weed:server:addphup')
AddEventHandler('jjsslowmohud:weed:server:addphup', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].ph= Config.Plants[k].ph+0.4
          
            Config.Plants[k].health=Config.Plants[k].health +10
        end
    end

    xPlayer.removeInventoryItem('ph_down', 1)
    TriggerEvent('jjsslowmohud:weed:server:updatePlants')
end)
RegisterServerEvent('jjsslowmohud:weed:server:addphdown')
AddEventHandler('jjsslowmohud:weed:server:addphdown', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].ph= Config.Plants[k].ph-6
          
            Config.Plants[k].health=Config.Plants[k].health +10
        end
    end

    xPlayer.removeInventoryItem('ph_down', 1)
    TriggerEvent('jjsslowmohud:weed:server:updatePlants')
end)
RegisterServerEvent('jjsslowmohud:weed:server:feedPlant')
AddEventHandler('jjsslowmohud:weed:server:feedPlant', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].hunger = Config.Plants[k].hunger + math.random(Config.HungerIncrease.min, Config.HungerIncrease.max)
            Config.Plants[k].tds = Config.Plants[k].tds + math.random(Config.TDSIncrease.min, Config.TDSIncrease.max)
            Config.Plants[k].ph=Config.Plants[k].ph-0.3
            Config.Plants[k].phflux=Config.Plants[k].phflux-0.2
            Config.Plants[k].health=Config.Plants[k].health +30
            if Config.Plants[k].hunger > 100.0 then
                Config.Plants[k].hunger = 100.0
            end
        end
    end

    xPlayer.removeInventoryItem('fertilizer', 1)
    TriggerEvent('jjsslowmohud:weed:server:updatePlants')
end)

RegisterServerEvent('jjsslowmohud:weed:server:updateWeedPlant')
AddEventHandler('jjsslowmohud:weed:server:updateWeedPlant', function(id, data)
    local result = MySQL.Sync.fetchAll('SELECT * FROM weed_plants')

    if result[1] then
        for i = 1, #result do
            local plantData = json.decode(result[i].properties)
            if plantData.id == id then
                local newData = json.encode(data)
                MySQL.Async.execute('UPDATE weed_plants SET properties = @properties WHERE id = @id', {
                    ['@properties'] = newData,
                    ['@id'] = result[i].id,
                }, function ()
                end)
            end
        end
    end
end)

RegisterServerEvent('jjsslowmohud:weed:server:weedPlantRemoved')
AddEventHandler('jjsslowmohud:weed:server:weedPlantRemoved', function(plantId)
    local result = MySQL.Sync.fetchAll('SELECT * FROM weed_plants')

    if result then
        for i = 1, #result do
            local plantData = json.decode(result[i].properties)
            if plantData.id == plantId then

                MySQL.Async.execute('DELETE FROM weed_plants WHERE id = @id', {
                    ['@id'] = result[i].id
                })

                for k, v in pairs(Config.Plants) do
                    if v.id == plantId then
                        table.remove(Config.Plants, k)
                    end
                end
            end
        end
    end
end)

RegisterServerEvent('jjsslowmohud:weed:server:getWeedPlants')
AddEventHandler('jjsslowmohud:weed:server:getWeedPlants', function()
    local data = {}
    local result = MySQL.Sync.fetchAll('SELECT * FROM weed_plants')

    if result[1] then
        for i = 1, #result do
            local plantData = json.decode(result[i].properties)
            print(plantData.id)
            table.insert(Config.Plants, plantData)
        end
    end
end)



RegisterServerEvent('jjsslowmohud:weed:server:weedPlantGrow')
AddEventHandler('jjsslowmohud:weed:server:weedPlantGrow', function(plantId)


       
     
 
end)


Citizen.CreateThread(function()
    while true do
        -- Citizen.Wait(math.random(65000, 75000))
  if Config.debug then
    Citizen.Wait(500)
  else
Citizen.Wait(Config.GrowthCycletime)
  end      

        -- Citizen.Wait(300)
        for i = 1, #Config.Plants do

            

            if Config.Plants[i].growth < 100 then
                if Config.Plants[i].grace then
                    Config.Plants[i].grace = false
                    
                else
                  
                    local ph = Config.Plants[i].ph or Config.StartingPH
                    local plantage = Config.Plants[i].plantage or 1
                    local waterage =Config.Plants[i].waterage or 1
                    plantage=plantage+0.25
                    waterage=waterage+0.25
                    Config.Plants[i].plantage=plantage
                    Config.Plants[i].waterage =waterage
                    local tds= Config.Plants[i].tds or Config.StartingTDS
                    local light = Config.Plants[i].light or Config.StartingLight
                    local temp = Config.Plants[i].temp or Config.StartingTemp
                    local air =  Config.Plants[i].air or Config.StartingAir
                    Config.Plants[i].air=air
              
                    Config.Plants[i].temp=temp
                    Config.Plants[i].light=light
                    local healthflux=Config.Plants[i].healthflux or 0
                    local health = Config.Plants[i].health or 100
                   
                    local phflux=Config.Plants[i].phflux or 0.000
                    local tdsusage=Config.Plants[i].tdsusage or 0
                    local saltbuildup=Config.Plants[i].saltbuildup or 0
                    local waterusage=Config.Plants[i].waterusage or 0
                    waterusage=round((light + temp + air)*plantage/100,1)
                    tdsusage = round((light + temp + air)*plantage/ph/10,1)
                    saltbuildup= round(waterusage/ tds *waterage,2)
                    phflux=0.01+(saltbuildup/tdsusage)+(0.01+plantage-waterage)/50
                 ph=round(ph-(phflux/25),3)
                 phflux=round(phflux,3)
                      tds=tds-(phflux/10)
                      tds=round(tds,2)
                         if (tds > ((plantage+7*7)*3 )) then
                             tds = 6666
                             ph = 4.20
                           end
                    --healthflux = (((light/plantage)+(temp/plantage)+(air/plantage)*-3)+(phflux*-3))
                    healthflux = ((light-plantage)+(temp-plantage)+(air-plantage)+(phflux*-2))
     healthflux= round(healthflux*(plantage/100),4)
     if healthflux < -3 then healthflux = -3 end
     if healthflux > 2 then healthflux = 2 end
     if saltbuildup > 8 then saltbuildup = 8 end
                      -- good for 90 day life   healthflux = (plantage/waterage)-(plantage-light)-(plantage-temp)+(plantage-air)
                
                      health=round(health+healthflux,1)
if health < 0 then health =0 end
if health > 150 then health =150 end
                      Config.Plants[i].waterusage=waterusage
                     Config.Plants[i].tdsusage=tdsusage
                     Config.Plants[i].saltbuildup=saltbuildup
                     Config.Plants[i].phflux=phflux
                     Config.Plants[i].ph=ph
                     Config.Plants[i].tds=tds
                     Config.Plants[i].healthflux=heahealthfluxlth
                   Config.Plants[i].health=health
                     if Config.debug   then   print("healthflux "..healthflux ) end
                     if Config.debug  then   print("tds "..tds ) end
                     if Config.debug   then    print("New PH "..ph ) end
                     if Config.debug     then   print("phflux "..phflux ) end
                     if Config.debug     then    print("saltbuildup "..saltbuildup ) end
                     if Config.debug   then    print("tdsusage "..tdsusage ) end
                     if Config.debug   then   print("waterusage "..waterusage ) end
                     if Config.debug  then   print("health "..health ) end
             
                 
                    Config.Plants[i].thirst =  round(Config.Plants[i].thirst - math.random(Config.Degrade.min, Config.Degrade.max) / 8,1)
                    Config.Plants[i].hunger =  round(Config.Plants[i].hunger - math.random(Config.Degrade.min, Config.Degrade.max) / 5,1)
                    Config.Plants[i].growth = round(Config.Plants[i].growth + (Config.GrowthIncrease *(health/100)),1)
                    Config.Plants[i].quality = round(Config.Plants[i].quality *(health/100),1)
                    if Config.Plants[i].growth > 100 then
                        Config.Plants[i].growth = 100
                    end

                    if Config.Plants[i].hunger < 0 then
                        Config.Plants[i].hunger = 0
                    end

                    if Config.Plants[i].thirst < 0 then
                        Config.Plants[i].thirst = 0
                    end

                    if Config.Plants[i].quality < 25 then
                        Config.Plants[i].quality = 25
                    end
                    if Config.Plants[i].quality > 100 then
                        Config.Plants[i].quality = 100
                    end
                    if Config.Plants[i].thirst < 75 or Config.Plants[i].hunger < 75 then
                        Config.Plants[i].quality = Config.Plants[i].quality - math.random(Config.QualityDegrade.min, Config.QualityDegrade.max) / 10
                    end

                    if Config.Plants[i].stage == 1 and Config.Plants[i].growth >= 55 then
                        Config.Plants[i].stage = 2
                    elseif Config.Plants[i].stage == 2 and Config.Plants[i].growth >= 90 then
                        Config.Plants[i].stage = 3
                    end
                end
            end
-- {id = plantId, type = type, x = location.x, y = location.y, z = location.z, 
--hunger = Config.StartingHunger, thirst = Config.StartingThirst, growth = 0.0, quality = 100.0, stage = 1, grace = true,
 --beingHarvested = false, planter = xPlayer.identifier, light = Config.StartingLight, air = Config.StartingAir, temp = Config.StartingTemp,
 -- humidity = Config.StartingHumidity, ph = Config.StartingPH,tds = Config.StartingTDS, color=Colors.Growing, health=100}

            local data2 = {}
            table.insert(data2, {
                name =  Config.Plants[i].type,
                hunger = Config.Plants[i].hunger,
                thirst = Config.Plants[i].thirst,
                light = Config.Plants[i].light,
                air = Config.Plants[i].air,
                temp = Config.Plants[i].temp,
                ph =  Config.Plants[i].ph,
                health = Config.Plants[i].health,
                tds = Config.Plants[i].tds,
                humidity = Config.Plants[i].humidity,
                growth = Config.Plants[i].growth,
                quality = Config.Plants[i].quality,
                stage = Config.Plants[i].stage,
            })
            TriggerClientEvent('jjsslowmohud:plantstats', -1, Config.Plants[i])

            TriggerEvent('jjsslowmohud:weed:server:updateWeedPlant', Config.Plants[i].id, Config.Plants[i])
        end
        TriggerEvent('jjsslowmohud:weed:server:updatePlants')
    end
end)
function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
  end
RegisterServerEvent('jjsslowmohud:weed:server:topPlant')
AddEventHandler('jjsslowmohud:weed:server:topPlant', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].top = true
          
        end
    end

end)
RegisterServerEvent('jjsslowmohud:weed:server:fimPlant')
AddEventHandler('jjsslowmohud:weed:server:fimPlant', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].fim = true
          
        end
    end

end)
RegisterServerEvent('jjsslowmohud:weed:server:feminizePlant')
AddEventHandler('jjsslowmohud:weed:server:feminizePlant', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].fem = true
          
        end
    end

end)
RegisterServerEvent('jjsslowmohud:weed:server:lstPlant')
AddEventHandler('jjsslowmohud:weed:server:lstPlant', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].lst = true
          
        end
    end

end)
RegisterServerEvent('jjsslowmohud:weed:server:revegPlant')
AddEventHandler('jjsslowmohud:weed:server:revegPlant', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].reveg = true
          
        end
    end

end)
RegisterServerEvent('jjsslowmohud:weed:server:clonePlant')
AddEventHandler('jjsslowmohud:weed:server:clonePlant', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].clone = true
          
        end
    end

end)
RegisterServerEvent('jjsslowmohud:weed:server:monstercropPlant')
AddEventHandler('jjsslowmohud:weed:server:monstercropPlant', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].monstercrop = true
          
        end
    end

end)
RegisterServerEvent('jjsslowmohud:weed:server:supercropPlant')
AddEventHandler('jjsslowmohud:weed:server:supercropPlant', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].supercrop = true
          
        end
    end

end)

RegisterServerEvent('jjsslowmohud:weed:server:checkPH')
AddEventHandler('jjsslowmohud:weed:server:checkPH', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            return Config.Plants[k].ph
          
        end
    end

end)
RegisterServerEvent('jjsslowmohud:weed:server:checkTDS')
AddEventHandler('jjsslowmohud:weed:server:checkTDS', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            return Config.Plants[k].tds
          
        end
    end

end)
RegisterServerEvent('jjsslowmohud:weed:server:checkLight')
AddEventHandler('jjsslowmohud:weed:server:checkLight', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            return Config.Plants[k].lights
          
        end
    end

end)
RegisterServerEvent('jjsslowmohud:weed:server:checkHumidity')
AddEventHandler('jjsslowmohud:weed:server:checkHumidity', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            return Config.Plants[k].humidity
          
        end
    end

end)
RegisterServerEvent('jjsslowmohud:weed:server:checkTemp')
AddEventHandler('jjsslowmohud:weed:server:checkTemp', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            return Config.Plants[k].temp
          
        end
    end

end)
RegisterServerEvent('jjsslowmohud:weed:server:checkAir')
AddEventHandler('jjsslowmohud:weed:server:checkAir', function(plantId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            return Config.Plants[k].airflow
          
        end
    end

end)
end