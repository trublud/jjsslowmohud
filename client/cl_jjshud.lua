
local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local isDoingAction = false
local open = 0
if Config.UseESX then ESX = nil end 

function esxnotification(title, subject, msg)
    if Config.UseESX then
        local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())

        ESX.ShowAdvancedNotification(title, subject, msg, mugshotStr, 1)
        UnregisterPedheadshot(mugshot)

    end
end

if Config.UseshowNotification then
    msgm = false
    AddEventHandler("showNotification", function(text)
        
        if string.find(text, "🧟") then
        else
        if string.find(text, "!") then text = string.gsub(text, "!", "") end
        while msgm do Citizen.Wait(50) end
        Citizen.CreateThread(function()
            msgm = true
            SendNUIMessage({action = "notify", data = text .. '🧟 '})
            Citizen.Wait(3500)
            SendNUIMessage({action = "hidenotify"})
            Citizen.Wait(500)
            msgm = false

        end)
    end
    
    end)
end
    if Config.EnableWeed  then 
    RegisterNetEvent('jjsslowmohud:plantopen')
    AddEventHandler('jjsslowmohud:plantopen', function(msg, mtime)
        local entity = nil
        local plant = GetClosestPlant()
        local ped = GetPlayerPed(-1)
       
       
        if not (plant=="false") and not isDoingAction then
            isDoingAction = true
    
            for k, v in pairs(SpawnedPlants) do
                if v.id == plant.id then 
                    entity = v.obj
                    
            TaskTurnPedToFaceEntity(ped, entity, -1)
            TaskGoStraightToCoordRelativeToEntity(
                ped --[[ Ped ]], 
                entity --[[ number ]], 
                0.4 --[[ number ]], 
                0.4 --[[ number ]], 
                0.4 --[[ integer ]], 
                0.4 --[[ number ]], 
                0.4 --[[ number ]]
            )
            Citizen.Wait(2000)
            TaskTurnPedToFaceEntity(ped, entity, -1)
            Citizen.Wait(1300)
                  
                    RequestAnimDict('amb@prop_human_bum_bin@base')
                    while not HasAnimDictLoaded('amb@prop_human_bum_bin@base') do
                        Citizen.Wait(0)
                    end
            
                    TaskPlayAnim(ped, 'amb@prop_human_bum_bin@base', 'base', 8.0, 8.0, -1,
                                 1, 1, 0, 0, 0)
                    FreezeEntityPosition(ped, true)
                    exports['progressBars']:startUI(1000, "Tending...")
                    Citizen.Wait(1000)
                    FreezeEntityPosition(ped, false)
                    ClearPedTasksImmediately(ped)
                end
            end
        
          

      --  if mtime ==nil or mtime < 1000 then mtime = 4000 end
       if Config.UseESX and ESX ~= nil then
           esxnotification('🌿', '', msg)
      end
       if Config.UseshowNotification then
            msg="🧟 " .. msg
            TriggerEvent("showNotification","🧟 " .. tostring(msg))
        end
        CreateThread(function()
           
           
            SendNUIMessage({action = "plantopen", data = plant}) 
            SendNUIMessage({action = "plantstats", data = GetClosestPlant()}) 
              SetNuiFocus(true, true)
            open = 1
         --   Citizen.Wait(mtime)
         --   SendNUIMessage({action = "hidenotify"})
     --    SendNUIMessage({action = "plantstats", data = msg}) 
       
        end) 
    else
        if Config.UseESX and ESX ~= nil then
        esxnotification('🌿', ' ', "There is no plant close by!", 1000)
    end
    if Config.UseshowNotification then
         msg="🧟 " .. msg
         TriggerEvent("showNotification","🧟 " .. " There is no plant close by!")
     end
    end
    end)
    RegisterNetEvent('jjsslowmohud:plantstats')
    AddEventHandler('jjsslowmohud:plantstats', function(msg)
      --  if mtime ==nil or mtime < 1000 then mtime = 4000 end
       if Config.UseESX and ESX ~= nil then
        --   esxnotification('🌿', 'Alert', tostring(msg.type))
         --  esxnotification('🌿', 'Alert', msg['name'])
       --    esxnotification('🌿', 'Alert', msg[1])
      end
       if Config.UseshowNotification then
      ---      msg="🧟 " .. msg
    --        TriggerEvent("showNotification","🧟 " .. tostring(msg))
        end
        CreateThread(function()
           
         
        --    SendNUIMessage({action = "plantopen", data = msg}) 
        --      SetNuiFocus(true, true)
        --    open = 1
         --   Citizen.Wait(mtime)
         --   SendNUIMessage({action = "hidenotify"})
         SendNUIMessage({action = "plantstats", data = GetClosestPlant()}) 
       
    end)
end)
end

RegisterNetEvent('jjsslowmohud:notify')
AddEventHandler('jjsslowmohud:notify', function(msg, mtime)
    if mtime ==nil or mtime < 1000 then mtime = 4000 end
    if Config.UseESX and ESX ~= nil then
        esxnotification('🌿', '', msg)
    end
    if Config.UseshowNotification then
       -- msg="🧟 " .. msg
        TriggerEvent("showNotification","🧟 " .. tostring(msg))
    end
    CreateThread(function()

        SendNUIMessage({action = "notify", data = msg})
        Citizen.Wait(mtime)
        SendNUIMessage({action = "hidenotify"})
    end)
end)

RegisterNetEvent('jjsslowmohud:updateme')
AddEventHandler('jjsslowmohud:updateme', function(data)
    SendNUIMessage({action = "paddme", data = data})
end)
RegisterNetEvent('jjsslowmohud:showhud')
AddEventHandler('jjsslowmohud:showhud', function(hudx)
    if  not isDoingAction then 
        isDoingAction = true
    SendNUIMessage({action = "showhud", hudx = hudx})
    end
end)
RegisterNetEvent('jjsslowmohud:showmehud')
AddEventHandler('jjsslowmohud:showmehud', function(hudx)
   
    if  not isDoingAction then 
        isDoingAction = true
        SendNUIMessage({action = "showmehud", hudx = hudx})
    end
end)
RegisterNetEvent('jjsslowmohud:update')
AddEventHandler('jjsslowmohud:update', function(data)
    SendNUIMessage({action = "update", data = data})
end)
RegisterNetEvent('jjsslowmohud:hidemehud')
AddEventHandler('jjsslowmohud:hidemehud',
                function() 
                    SendNUIMessage({action = "hidemehud"})
                    isDoingAction = false
                end)
RegisterNetEvent('jjsslowmohud:closehud')
AddEventHandler('jjsslowmohud:closehud',
                function() 
                    SendNUIMessage({action = "hidehud"}) 
                      isDoingAction = false
                end)
RegisterNetEvent('jjsslowmohud:open')
AddEventHandler('jjsslowmohud:open', function()
    
    if  not isDoingAction then 
        isDoingAction = true
    SendNUIMessage({action = "open"})
    SetNuiFocus(true, true)
    open = 1
    end
end)

RegisterNetEvent('jjsslowmohud:sendError')
AddEventHandler('jjsslowmohud:sendError', function(text)
    SendNUIMessage({action = "error", errorText = text})
end)

RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({action = "hidenotify"})
    SendNUIMessage({action = "hidehud"})
    open = 0
    
    
        isDoingAction = false
    cb('ok')

end)

RegisterNUICallback("action", function(data, cb)
    TriggerServerEvent('jjsslowmohud:action', data.data)
    cb('ok')
end)

RegisterNUICallback("ToggleOpenPlayerlist", function(data, cb)
    if not data.toggle then
        TriggerServerEvent("jjsslowmohud:add")

    else
        TriggerServerEvent("jjsslowmohud:remove")
    end
    cb('ok')
end)
RegisterNUICallback("ToggleOpenUser", function(data, cb)
    if not data.toggle then
        TriggerServerEvent("jjsslowmohud:addme")

    else
        TriggerServerEvent("jjsslowmohud:remove")
    end
    cb('ok')
end)
RegisterNUICallback("Feedplant", function(data, cb)
    if data.action == "feed" then
    TriggerServerEvent(
        'jjsslowmohud:server:checkPlayerHasThisItem',
        'fertilizer', 'jjsslowmohud:weed:client:feedPlant',
        true)
    elseif data.action == "water" then
        TriggerServerEvent(
            'jjsslowmohud:server:checkPlayerHasThisItem',
            'water_bottle',
            'jjsslowmohud:weed:client:waterPlant', true)
    elseif data.action == "light" then

        TriggerServerEvent(
            'jjsslowmohud:server:checkPlayerHasThisItem',
            'light_pack', 'jjsslowmohud:weed:client:addLights',
            true)
    elseif data.action == "air" then   
        TriggerServerEvent(
            'jjsslowmohud:server:checkPlayerHasThisItem',
            'fan_pack', 'jjsslowmohud:weed:client:addFan',
            true)
    elseif data.action == "temp" then   
        TriggerServerEvent(
            'jjsslowmohud:server:checkPlayerHasThisItem',
            'temperture_pack', 'jjsslowmohud:weed:client:addTemp',
            true)
    elseif data.action == "NewWaterplant" then   
            TriggerServerEvent(
                'jjsslowmohud:server:checkPlayerHasThisItem',
                'soil_change', 'jjsslowmohud:weed:client:NewWaterplant',
                true)
    elseif data.action == "humidity" then   
        TriggerServerEvent(
            'jjsslowmohud:server:checkPlayerHasThisItem',
            'humidity_pack', 'jjsslowmohud:weed:client:addHumidity',
            true)
    elseif data.action == "destroy" then  
        DestroyPlant()
    elseif data.action == "harvest" then    
        HarvestWeedPlant()
    elseif data.action == "phdown" then    
        TriggerServerEvent(
            'jjsslowmohud:server:checkPlayerHasThisItem',
            'ph_up', 'jjsslowmohud:weed:client:addphdown',
            true)
       
    elseif data.action == "phup" then    
        TriggerServerEvent(
            'jjsslowmohud:server:checkPlayerHasThisItem',
            'ph_down', 'jjsslowmohud:weed:client:addphup',
            true)
    end
    cb('ok')
end)
function IsOnline(target)
    print(json.encode(GetActivePlayers()))
    for v, i in ipairs(GetActivePlayers()) do
        if (v == target) then return true end
    end
    return false
end

CreateThread(function()

    while true do
        Wait(200)

        if open == 0 then
            if IsControlJustPressed(1, jKeys[Config.Keys.SettingsKey]) then
                -- esxnotification("JJsNOtify","MoveWindow","Move me around!")
             
                TriggerEvent("jjsslowmohud:notify", "Move me around!", 30000)
                TriggerServerEvent("jjsslowmohud:addme")
                TriggerEvent("jjsslowmohud:showhud")
                TriggerEvent("jjsslowmohud:open")
                open = 1
                if Config.UseESXlicense then
                TriggerServerEvent("esx_license:addLicense", GetPlayerServerId(PlayerId()), "Hunter", cb)
            end
            end
        end
    end
end)
if Config.UseESX then

    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj)
                ESX = obj
            end)
            Citizen.Wait(0)
        end

        esxnotification('JJs HUD', 'LOADED', 'Success')
    end)
    TriggerEvent("jjsslowmohud:notify", "ESX-Integration Successful!", 3000)
end
AddEventHandler('onResourceStop', function(name)
    if name == GetCurrentResourceName() then
        SetNuiFocus(false, false)
        SendNUIMessage({action = "hidenotify"})
        SendNUIMessage({action = "hidehud"})
        open = 0
    end
end)
