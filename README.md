    
Resource must stay named jjsslowmohud    
No dependancies othen then optional ESX or RottonV    
  
  
Commands:    
/jjpowers    
/jjsettings  
(key bindings in config.lua)  
  
  
Config = {  
UseESX = false, -- only for Notifications if perferred  
  UseshowNotification = true, -- RottonV only for Notifications if perferred  
  slowmopower = true,  -- can be triggered by player  
  slowmoinvis = true, -- is invisible when slow motion triggered by player  
  slowmospeed = 0.3, -- half speed = 0.5  
  superjumppower = true, -- can user superjump  
  nightvisionpower = true, -- can be triggered by player  
  heatvisionpower = true, -- can be triggered by player  
  slowmopowertime = 5, -- how long it lasts  
  nightvisiontime = 5, -- how long it lasts  
  heatvisiontime = 5, -- how long it lasts  
  flashspeed = 2.5, -- how fast player runs when in slow motion  
  AutoShowList = false, -- unused atm  
  powercooldown = 5, -- how long between power uses  
}  
Config.Keys = {  
RequireAiming = false, --removed  
  SettingsKey = 'k',  -- open hud settings /jjsettings  
  NightVision = 'i', -- trigger power /jjpower night  
  HeatVision = 'o',  -- trigger power /jjpower heat  
  SlowMo = 'u', -- trigger power /jjpower slowmo  
  }  
  
  
  
External calls for other plugins:  
  
Make player  use powers:  
TriggerClientEvent('jjsslowmo:heatvisionPlayer', hvplayerId)  
TriggerClientEvent('jjsslowmo:nightvisionPlayer', nvplayerId)  
TriggerClientEvent('jjsslowmo:superjumpPlayer', jumpingplayerId, true/false)  
  
  
Force time to slow time to slow down:  
TriggerClientEvent('jjsslowmo:updateAllowedHost', -1, sendingplayerId)  
TriggerClientEvent('jjsslowmo:slowmoPlayer', -1, ahost, pspeed, pinvis, stime, sspeed)   
--[[ ahost is the allowed host to slow player pspeed is true/false   
if player can run fast while slowed  
    pinivis is true/false if player is invisible when time is slowed  
    stime is the time in seconds the slow down lasts  
    sspeed is how slow does time slow down to  (1.0 is normal speed)  
    ]]  
  
  
TriggerServerEvent('jjsslowmo:setSuperJump', playerId, true/false)  
  
  
Hud Updates ( have to be done per tick ):  
TriggerServerEvent("jjsslowmohud:addme", true/false , PlayerId(), "Text1, "Text2" )  
  
  
  
Example for Notify  
TriggerEvent("jjsslowmohud:notify" ,"TESTNG",3000)  
  
  
  
Example for Big Hud  
TriggerEvent("jjsslowmohud:showmehud")  
TriggerServerEvent("jjsslowmohud:addme", false, PlayerId(), "Test1", "test2")  
TriggerEvent("jjsslowmohud:hidemehud")  
  
