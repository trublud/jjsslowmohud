serverwideslowmo = false
slowmo = false
spawnhost = nil

RegisterNetEvent('jjsslowmo:setSpawnHost')
AddEventHandler('jjsslowmo:setSpawnHost', function(shost)
    if shost ~= nil then
        spawnhost = shost
        TriggerClientEvent('jjsslowmo:updateSpawnHost', -1, spawnhost)
        --   TriggerClientEvent('Cyber:UpdateDeads', -1, deadPlayers)
    end
end)
RegisterNetEvent('jjsslowmo:getSpawnHost')
AddEventHandler('jjsslowmo:getSpawnHost', function()
     
    return spawnhost
end)

RegisterNetEvent('jjsslowmo:setSuperJump')
AddEventHandler('jjsslowmo:setSuperJump', function(p, enabled)
    if p ~= nil then
       
        TriggerClientEvent('jjsslowmo:superjumpPlayer', p, enabled)
      
    end
end)