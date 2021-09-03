
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
}local open = 0
ESX = nil

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
        while msgm do Citizen.Wait(5) end
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
RegisterNetEvent('jjsslowmohud:notify')
AddEventHandler('jjsslowmohud:notify', function(msg, mtime)
    if mtime ==nil or mtime < 1000 then mtime = 4000 end
    if Config.UseESX and ESX ~= nil then
        esxnotification('JJsNotify', 'Alert', msg)
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
    SendNUIMessage({action = "showhud", hudx = hudx})
end)
RegisterNetEvent('jjsslowmohud:showmehud')
AddEventHandler('jjsslowmohud:showmehud', function(hudx)
    SendNUIMessage({action = "showmehud", hudx = hudx})
end)

RegisterNetEvent('jjsslowmohud:update')
AddEventHandler('jjsslowmohud:update', function(data)
    SendNUIMessage({action = "update", data = data})
end)
RegisterNetEvent('jjsslowmohud:hidemehud')
AddEventHandler('jjsslowmohud:hidemehud',
                function() SendNUIMessage({action = "hidemehud"}) end)
RegisterNetEvent('jjsslowmohud:closehud')
AddEventHandler('jjsslowmohud:closehud',
                function() SendNUIMessage({action = "hidehud"}) end)
RegisterNetEvent('jjsslowmohud:open')
AddEventHandler('jjsslowmohud:open', function()
    SendNUIMessage({action = "open"})
    SetNuiFocus(true, true)
    open = 1
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

function IsOnline(target)
    print(json.encode(GetActivePlayers()))
    for v, i in ipairs(GetActivePlayers()) do
        if (v == target) then return true end
    end
    return false
end

CreateThread(function()

    while true do
        Wait(0)

        if open == 0 then
            if IsControlJustPressed(1, jKeys[Config.Keys.SettingsKey]) then
                -- esxnotification("JJsNOtify","MoveWindow","Move me around!")
                TriggerEvent("jjsslowmohud:notify", "Move me around!", 30000)
                TriggerServerEvent("jjsslowmohud:addme")
                TriggerEvent("jjsslowmohud:showhud")
                TriggerEvent("jjsslowmohud:open")
                open = 1
                TriggerServerEvent("esx_license:addLicense", GetPlayerServerId(PlayerId()), "Hunter", cb)
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
