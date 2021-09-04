local CallSigns = {}

local callSign = '0'
local thirsty = 1
local hungry = 1
local infect = 1
local ill = 1
local visibley = false
local vall = 0
if Config.UseESX then
     ESX = nil 
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
    end
--[[
    🛡️
    🧧
callsign = '🥛' .. thirsty, -- callSign,
name = name,
job = '🥣' .. hungry, -- jobname,
rank = '🌡️' .. ill, -- rank,
visible = visibley,
data1 = xPlayer.getMoney(),
life = GetEntityHealth(GetPlayerPed(v)),
data3 = GetPedArmour(GetPlayerPed(v)),
data4 = xPlayer.getGroup())
]]
-- Client action (add / remove) so the client can be in sync with server

RegisterServerEvent("jjsslowmohud:action")
AddEventHandler("jjsslowmohud:action", function(data)
    if data.action == "error" then
        TriggerEvent('jjsslowmohud:sendError', data.code)
    end
end)

RegisterServerEvent("jjsslowmohud:showhud")
AddEventHandler("jjsslowmohud:showhud", function(hudx)

    TriggerClientEvent("jjsslowmohud:showhud", source, hudx)
end)
RegisterServerEvent("jjsslowmohud:addme")
AddEventHandler("jjsslowmohud:addme", function(vis, p, data003, data004)
   
    local data = {}
    local value = 0
    local src = source
    local visibley = vis
    local namer = GetPlayerName(src)
    local data01 = '🛡️: ' .. GetPedArmour(GetPlayerPed(src))
    local data03 = data003
    local data04 = data004

    table.insert(data, {
        name = namer,
        visible = visibley,
        life = GetEntityHealth(GetPlayerPed(src)),
        data1 = data01,
        data3 = data03,
        data4 = data04
    })

    TriggerClientEvent("jjsslowmohud:updateme", -1, data)
end)

RegisterServerEvent("jjsslowmohud:add")
AddEventHandler("jjsslowmohud:add", function(vis, sp, data003, data004)
    local data = {}
    --GetActivePlayers()
    for k, v in pairs(GetPlayers()) do

        local data = {}
        local value = 0
     
        local visibley = vis
        local namer = GetPlayerName(k)
        local data01 = '🛡️: ' .. GetPedArmour(GetPlayerPed(k))
        local data03 = data003
        local data04 = data004

        table.insert(data, {
            name = namer,
            visible = visibley,
            life = GetEntityHealth(GetPlayerPed(k)),
            data1 = data01,
            data3 = data03,
            data4 = data04
        })

    end

    TriggerClientEvent("jjsslowmohud:update", -1, data)
end)
