    
Resource must stay named jjsslowmohud    
No dependancies othen then optional ESX or RottonV   
![powermenu](https://user-images.githubusercontent.com/5308859/132145165-44ed2ac2-d5f8-4eb1-b788-384da43ba38a.png)

  ![planted](https://user-images.githubusercontent.com/5308859/132145171-96325eec-b52e-46b4-a819-0ba94e257f1c.png)
  
![tending](https://user-images.githubusercontent.com/5308859/132145173-169025e1-5b70-4991-b498-d2229f7d2a81.png)

  
Commands:    
/jjpowers    
/jjsettings  
/jjgod true/false  
/jjweed  
/jjplant  
  
  
Config = {  
  EnableWeed = true,   
  UseESX = true, -- EnableWeed requires this  
  UseESXlicense = true,   
  UseshowNotification = true, -- RottonV only for Notifications if perferred  
  slowmopower = true,  -- can be triggered by player  
  slowmoinvis = true, -- is invisible when slow motion triggered by player  
  slowmospeed = 0.5, -- half speed = 0.5  
  superjumppower = true, -- can user superjump  
  nightvisionpower = true, -- can be triggered by player  
  heatvisionpower = true, -- can be triggered by player  
  slowmopowertime = 8, -- how long it lasts  
  nightvisiontime = 8, -- how long it lasts  
  heatvisiontime = 8, -- how long it lasts  
  flashspeed = 1.5, -- how fast player runs when in slow motion  
  AutoShowList = false, --removing in next release  
  powercooldown = 3, -- how long between power uses  
    
}  

--[[  
------  IF YOU CHANGE THESE BELOW THEN YOU MAY NEED TO CLEAN UP YOUR   
------  %appdata%\CitizenFX\fivem.cfg  file   
------  or fix the keybind in the ESCAPE/PAUSE menu  
]]  
Config.Keys = {  
  RequireAiming = false, --removing in next release  
  SettingsKey = 'k',  -- open hud settings /jjsettings  
  NightVision = 'i', -- trigger power /jjpower night  
  HeatVision = 'o',  -- trigger power /jjpower heat  
  SlowMo = 'u', -- trigger power /jjpower slowmo  
  TendPlants = 'j',
}


-- if enableweed = true this is enabled below  
Config.debug=false  
Config.Plants = {}  
Config.PlantsObj={}  
Config.StartingPH= 6.2  
Config.StartingTDS = 100  -- if too high will cause nuet lockout ph will be 4 and tds 1666   
Config.StartingTemp = 20  
Config.StartingAir = 20  
Config.StartingLight = 20  
Config.StartingHumidity = 70  
Config.TDSIncrease= {min = 80, max = 180}  
  
  
Config.StartingThirst = 85.0  
Config.StartingHunger = 85.0  
  
Config.HungerIncrease = {min = 8, max = 18}  
Config.ThirstIncrease = {min = 8, max = 18}  
  
Config.Degrade = {min = 1, max = 3}  
Config.QualityDegrade = {min = 1, max = 4}  
Config.GrowthIncrease = 0.25  
Config.GrowthCycletime = 5000  
  
  
  
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
    
Menu:        ---created LiamInChains#3776---  
orp-weed:    ---created Howdy#8276  
  
Both:        ---heavilied modified by mindping---  
  
