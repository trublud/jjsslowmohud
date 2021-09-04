 cooldown = 0
 if Config.EnableWeed  then 
 RegisterCommand('jjplant', function()
 TriggerEvent("jjsslowmohud:plantopen", "plantopening", 3000)
-- TriggerEvent("jjsslowmohud:plantstats", "plantopeninged", 3000)
end, false)
RegisterKeyMapping('jjplant', 'Open CoolHud Settings', 'keyboard', 'n') 
end
RegisterCommand('jjsettings', function()
    TriggerEvent("jjsslowmohud:notify", "Move me around!", 30000)
    TriggerServerEvent("jjsslowmohud:addme")
    TriggerEvent("jjsslowmohud:showhud")
    TriggerEvent("jjsslowmohud:open")
end, false)
TriggerEvent('chat:addSuggestion', '/jjsettings', 'CoolHud Settings Menu',
             { --[[   { name="paramName1", help="param description 1" },    { name="paramName2", help="param description 2" }]] })

RegisterKeyMapping('jjsettings', 'Open CoolHud Settings', 'keyboard', 'k')

RegisterCommand('jjpowers', function(source, args)
  
        if cooldown <= 0 then
   
    if args[1] == 'slowmo' then
        TriggerEvent("jjsslowmo:slowmoMe")
        cooldown=(Config.slowmopowertime * 100) + (Config.powercooldown*100)
    elseif args[1] == 'heat' then
        TriggerEvent("jjsslowmo:heatvisionPlayer")
        cooldown=(Config.heatvisiontime * 100) + (Config.powercooldown*100)
    elseif args[1] == 'night' then
        TriggerEvent("jjsslowmo:nightvisionPlayer")
        cooldown=(Config.nightvisiontime * 100) + (Config.powercooldown*100)
    end
   
    Citizen.CreateThread(function()
        while cooldown > 0  do
            Citizen.Wait(0)
            cooldown = cooldown - 1
        end
    end)
else
    TriggerEvent("jjsslowmohud:notify", "Power still cooling down! "..cooldown .." left", 3000)
    
end

end, false)
TriggerEvent('chat:addSuggestion', '/jjpowers', 'JJs Powers', {
    {name = "heat", help = "heat vision"},
    {name = "night", help = "night vision"},
    {name = "slowmo", help = "slow motion"}
})

RegisterKeyMapping('jjsettings', 'Open CoolHud Settings', 'keyboard', Config.Keys.SettingsKey)
RegisterKeyMapping('jjpowers heat', 'Heat Vision', 'keyboard', Config.Keys.HeatVision)
RegisterKeyMapping('jjpowers night', 'Night Vision', 'keyboard', Config.Keys.NightVision)
RegisterKeyMapping('jjpowers slowmo', 'Slow Motion', 'keyboard', Config.Keys.SlowMo)

--[[RegisterKeyMapping('say hi', 'Say hi', 'keyboard', 'o') 
RegisterCommand('+handsup', function()
    handsUp = true
end, false)
RegisterCommand('-handsup', function()
    handsUp = false
end, false)
local handsUp = false
CreateThread(function()
    while true do
        Wait(0)
        if handsUp then
            TaskHandsUp(PlayerPedId(), 250, PlayerPedId(), -1, true)
        end
    end
end)]]
