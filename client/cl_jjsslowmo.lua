jKeys = {
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
local slowmo = false
local forcedslowmo = false
local slowmoplayer = PlayerId()
local superjumpplayer = PlayerId()
local allowedhost = nil
RegisterNetEvent('jjsslowmo:updateAllowedHost')
AddEventHandler('jjsslowmo:updateAllowedHost', function(ahost)
    if ahost ~= nil then allowedhost = ahost end
end)
RegisterNetEvent('jjsslowmo:slowmoMe')
AddEventHandler('jjsslowmo:slowmoMe', function()

    CreateThread(function()
        local i = 0
        SlowMo(PlayerId())
        TriggerEvent("jjsslowmohud:showmehud")
        while i < Config.slowmopowertime * 100 do
            slowmo, forcedslowmo = true, true
            Wait(0)
            i = i + 1
            TriggerServerEvent("jjsslowmohud:addme", false, PlayerId(), "poof",
                               "invisible for " ..
                                   (Config.slowmopowertime * 100 - i))

        end
        TriggerEvent("jjsslowmohud:hidemehud")
        slowmo, forcedslowmo = true, true
        SlowMo(PlayerId())
    end)

end)

RegisterNetEvent('jjsslowmo:slowmoPlayer')
AddEventHandler('jjsslowmo:slowmoPlayer',
                function(ahost, pspeed, pinvis, stime, sspeed)
    if ahost == allowedhost then
        CreateThread(function()
            local i = 0
            ForceSlowMo(PlayerId(), pspeed, pinvis, stime, sspeed)
            TriggerEvent("jjsslowmohud:showmehud")
            while i < Config.slowmopowertime * 100 do
                slowmo, forcedslowmo = true, true
                Wait(0)
                i = i + 1
                TriggerServerEvent("jjsslowmohud:addme", false, PlayerId(),
                                   "poof", "invisible for " ..
                                       (Config.slowmopowertime * 100 - i))

            end
            TriggerEvent("jjsslowmohud:hidemehud")
            slowmo, forcedslowmo = true, true
            ForceSlowMo(PlayerId(), pspeed, pinvis, stime, sspeed)
        end)

    end
end)

RegisterNetEvent('jjsslowmo:heatvisionPlayer')
AddEventHandler('jjsslowmo:heatvisionPlayer', function() HeatVision() end)

RegisterNetEvent('jjsslowmo:nightvisionPlayer')
AddEventHandler('jjsslowmo:nightvisionPlayer', function() Nightvision() end)

RegisterNetEvent('jjsslowmo:superjumpPlayer')
AddEventHandler('jjsslowmo:superjumpPlayer', function(pjump)
    if pjump and superjumpplayer ~= PlayerId() then
        superjumpplayer = PlayerId()
    end
    if not pjump and superjumpplayer == PlayerId() then superjumpplayer = nil end
end)
--[[
    
RegisterNetEvent('jjsslowmo:updateSpawnHost')
AddEventHandler('jjsslowmo:updateSpawnHost',
                function(shost) if shost ~= nil then spawnhost = shost end end)

local spawnhost = nil
RegisterNetEvent('jjsslowmo:slowmoServer')
AddEventHandler('jjsslowmo:slowmoServer', function(p)
    if p ~= nil then
        slowmoplayer = p
        SlowMo(p)
    end
end)
]]
--[[
Citizen.CreateThread(function()
    local pressed = false
    while true do
        Citizen.Wait(1)
        cooldown = cooldown - 1
        if cooldown <= 0 then

            if Config.Keys.RequireAiming then
                if IsControlPressed(0, 25) and
                    IsControlJustReleased(0, jKeys[Config.Keys.SlowMo]) then
                    pressed = true

                end
            else
                pressed = true

            end
            if pressed and IsControlJustReleased(0, jKeys[Config.Keys.SlowMo]) and
                Config.slowmopower then
                cooldown = Config.powercooldown * 500
                CreateThread(function()
                    local i = 0
                    SlowMo(PlayerId())
                    TriggerEvent("jjsslowmohud:showmehud")
                    while i < Config.slowmopowertime * 100 do
                        Wait(0)
                        i = i + 1
                        TriggerServerEvent("jjsslowmohud:addme", false,
                                           PlayerId(), "poof",
                                           "invisible for " ..
                                               (Config.slowmopowertime * 100 - i))

                    end
                    TriggerEvent("jjsslowmohud:hidemehud")

                    SlowMo(PlayerId())
                end)
            end
        else

        end
    end
end)
]]
function ForceSlowMo(p, pspeed, pinvis, stime, sspeed)
    if not slowmo and not forcedslowmo then
        forcedslowmo, slowmo, slowmoplayer = true, true, p
        if pspeed then
            SetRunSprintMultiplierForPlayer(p, 3.0)
            SetPedMoveRateOverride(GetPlayerPed(p), 1.15)
            SetPedDesiredMoveBlendRatio(GetPlayerPed(p), 3.0)
        end
        SetTimeScale(sspeed)
        if pinvis then SetEntityVisible(GetPlayerPed(p), false, false) end
    else
        if pspeed then
            SetRunSprintMultiplierForPlayer(p, 0.89)

            SetPedMoveRateOverride(GetPlayerPed(p), 0.3)
            SetPedDesiredMoveBlendRatio(GetPlayerPed(p), 0.8)
        end
        SetTimeScale(1.0)
        if pinvis then SetEntityVisible(GetPlayerPed(p), true, true) end
        forcedslowmo, slowmo, slowmoplayer = false, false, nil
    end
end
function SlowMo(p)
    if not slowmo then
        slowmo = true
        SetRunSprintMultiplierForPlayer(p, 3.0)
        SetPedMoveRateOverride(GetPlayerPed(p), 1.15)
        SetPedDesiredMoveBlendRatio(GetPlayerPed(p), 3.0)
        SetTimeScale(Config.slowmospeed)
        if Config.slowmoinvis then
            SetEntityVisible(GetPlayerPed(p), false, false)
        end
    else
        SetRunSprintMultiplierForPlayer(p, 0.89)
        SetTimeScale(1.0)
        SetPedMoveRateOverride(GetPlayerPed(p), 0.3)
        SetPedDesiredMoveBlendRatio(GetPlayerPed(p), 0.8)
        if Config.slowmoinvis then
            SetEntityVisible(GetPlayerPed(p), true, true)
        end
        slowmo = false
    end
end
--[[
Citizen.CreateThread(function()
    local pressed = false
    while true do
        Citizen.Wait(1)
        cooldown = cooldown - 1
        if cooldown <= 0 then

            if Config.Keys.RequireAiming then
                if IsControlPressed(0, 25) and
                    IsControlJustReleased(0, jKeys[Config.Keys.HeatVision]) then
                    pressed = true

                end
            else
                pressed = true

            end
            if pressed and IsControlJustReleased(0, jKeys[Config.Keys.HeatVision]) and
                Config.heatvisionpower then
                HeatVision()
                cooldown = Config.powercooldown * 500
            end
        else

        end
    end
end)
]]
function HeatVision()

    CreateThread(function()
        local i = 0
        SetSeethrough(true)
        TriggerEvent("jjsslowmohud:showmehud")
        while i < Config.heatvisiontime * 100 do
            Wait(0)
            i = i + 1
            TriggerServerEvent("jjsslowmohud:addme", true, PlayerId(), "poof",
                               "heat vision for " ..
                                   (Config.heatvisiontime * 100 - i))

        end
        TriggerEvent("jjsslowmohud:hidemehud")

        SetSeethrough(false)
    end)

end
--[[
Citizen.CreateThread(function()
    local pressed = false
    while true do
        Citizen.Wait(1)
        cooldown = cooldown - 1
        if cooldown <= 0 then

            if Config.Keys.RequireAiming then
                if IsControlPressed(0, 25) and
                    IsControlJustReleased(0, jKeys[Config.Keys.NightVision]) then
                    pressed = true
                end
            else
                pressed = true

            end
            if pressed and IsControlJustReleased(0, jKeys[Config.Keys.NightVision]) and
                Config.nightvisionpower then
                Nightvision()
                cooldown = Config.powercooldown * 500
            end
        else

        end
    end
end)
]]
function Nightvision()

    CreateThread(function()
        local i = 0
        SetNightvision(true)
        TriggerEvent("jjsslowmohud:showmehud")
        while i < Config.nightvisiontime * 100 do
            Wait(0)
            i = i + 1

            TriggerServerEvent("jjsslowmohud:addme", true, PlayerId(), "poof",
                               "night vision for " ..
                                   (Config.nightvisiontime * 100 - i))

        end
        TriggerEvent("jjsslowmohud:hidemehud")

        SetNightvision(false)

    end)

end

Citizen.CreateThread(function()
    local flashSpeed = Config.flashspeed
    while true do

        setSuperjump(superjumpplayer)
        if slowmo and not forcedslowmo and Config.slowmopower then
            SetPedMoveRateOverride(GetPlayerPed(slowmoplayer), flashSpeed)
            RestorePlayerStamina(slowmoplayer, 1.0)
        else
            SetPedMoveRateOverride(GetPlayerPed(slowmoplayer), 1.0)
        end

        Citizen.Wait(0)
    end
end)

function setSuperjump(p)

    if p ~= nil then

        if Config.superjumppower then SetSuperJumpThisFrame(p) end

    end
end
