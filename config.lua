Config = {
  UseESX = true, -- only for Notifications if perferred
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
  AutoShowList = false, --removing in next release
  powercooldown = 5, -- how long between power uses
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
}


