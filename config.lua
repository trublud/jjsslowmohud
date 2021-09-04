Config = {
  UseESX = true, -- only for Notifications if perferred
  UseESXlicense = true, 
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
  EnableWeed = true,
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


-- if enableweed = true this is below
Config.debug=false
Config.Plants = {}
Config.PlantsObj={}
Config.StartingPH= 6.2
Config.StartingTDS = 200
Config.StartingTemp = 20
Config.StartingAir = 2
Config.StartingLight = 20
Config.StartingHumidity = 80
Config.TDSIncrease= 15.0


Config.StartingThirst = 85.0
Config.StartingHunger = 85.0

Config.HungerIncrease = 15.0
Config.ThirstIncrease = 12.0

Config.Degrade = {min = 1, max = 3}
Config.QualityDegrade = {min = 1, max = 4}
Config.GrowthIncrease = 0.25

Config.YieldRewards = {
    {type = "granddaddy_purp", rewardMin = 5, rewardMax = 20, item = 'weed_granddaddy', label = 'Grand Daddy Purple 10G'},
    {type = "peauto", rewardMin = 5, rewardMax = 10, item = 'weed_peauto', label = 'PineApple Express Auto 5G'},
    {type = "purpun", rewardMin = 5, rewardMax = 20, item = 'weed_purpun', label = 'Purple Punch 5G'},
    {type = "nlight", rewardMin = 5, rewardMax = 20, item = 'weed_nlight', label = 'Northern Lights 5G'},
    {type = "cheeseberry", rewardMin = 5, rewardMax = 20, item = 'weed_cheeseberry', label = 'CheeseBerry 5G'},
    {type = "ambulance", rewardMin = 5, rewardMax =20, item = 'weed_ambulance', label = 'Ambulance 5G'},
    {type = "amhaze", rewardMin = 5, rewardMax =20, item = 'weed_amhaze', label = 'Amnesai Haze 5G'},
    

    {type = "banana_kush", rewardMin = 5, rewardMax = 6, item = 'weed_bananakush', label = 'Banana Kush 2G'},
    {type = "blue_dream", rewardMin = 4, rewardMax = 6, item = 'weed_bluedream', label = 'Blue Dream 2G'},
    {type = "purplehaze", rewardMin = 3, rewardMax = 5, item = 'weed_purplehaze', label = 'Purple Haze 2G'},
    {type = "og_kush", rewardMin = 2, rewardMax = 3, item = 'weed_og-kush', label = 'OGKush 2G'},
}

Config.MaxPlantCount = 52

Config.BadSeedReward = "peauto_seed" -- 125

Config.GoodSeedRewards = {
    [1] = "gdp_seed", 
    [2] = "ambulance_seed", 
    [3] = "cheeseberry_seed", 
    [4] = "purpun_seed", 
    [5] = "peauto_seed", 
    [6] = "nlight_seed", 
    [7] = "amhaze_seed", 
    [8] = "weed_og-kush_seed", 
    [9] = "weed_bananakush_seed", 
    [10] = "weed_purple-haze_seed", 
    [11] = "weed_bluedream_seed", 

}

Config.WeedStages = {
    [1] = "bkr_prop_weed_01_small_01c",
    [11] = "bkr_prop_weed_01_small_01b",
    [12] = "bkr_prop_weed_01_small_01a",
    [2] = "bkr_prop_weed_med_01a",
    [21] = "bkr_prop_weed_med_01b",
    [3] = "bkr_prop_weed_lrg_01a",
    [31] = "bkr_prop_weed_lrg_01b",
}

Config.SeedLocations = {
    {x = 2231.685, y = 5578.843, z = 54.066, h = 278.452},
    {x = 2227.496, y = 5579.036, z = 53.952, h = 284.76},
    {x = 2222.042, y = 5579.646, z = 53.934, h = 296.832},
    {x = 2214.249, y = 5575.106, z = 53.673, h = 162.243},
    {x = 2218.734, y = 5575.268, z = 53.717, h = 95.948},
    {x = 2223.127, y = 5574.872, z = 53.73, h = 113.047},
    {x = 2227.75, y = 5574.38, z = 53.814, h = 94.541},
    {x = 2233.955, y = 5574.232, z = 53.989, h = 159.559},
    {x = 2234.59, y = 5578.732, z = 54.117, h = 6.328},
    {x = 2234.148, y = 5576.116, z = 54.041, h = 328.206},
    {x = 2229.784, y = 5576.688, z = 53.939, h = 259.681},
    {x = 2224.872, y = 5576.866, z = 53.85, h = 270.137},
    {x = 2220.167, y = 5577.162, z = 53.844, h = 272.316},
    {x = 2216.635, y = 5577.483, z = 53.847, h = 35.148},
}