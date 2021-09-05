CREATE TABLE `weed_plants` (
  `id` int(11) NOT NULL,
  `properties` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `weed_plants`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `weed_plants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES 
('weed_bananakush', 'Banana Kush 2G', 1, 0, 1),
('weed_bluedream', 'Blue Dream 2G',1, 0, 1),
('weed_purplehaze', 'Purple Haze 2G', 1, 0, 1),
('weed_og-kush', 'OGKush 2G', 1, 0, 1),
('weed_og-kush_seed', 'OGKush Seed', 1, 0, 1),
('weed_bananakush_seed', 'Banana Kush Seed', 1, 0, 1),
('weed_bluedream_seed', 'Blue Dream 2G', 1, 0, 1),
('weed_purple-haze_seed', 'Purple Haze 2G', 1, 0, 1),
('water_bottle', 'Water Bottle', 1, 0, 1),
('fertilizer', 'Fertilizer', 1, 0, 1),
('ph_up', 'PH Up', 1, 0, 1),
('ph_down', 'PH Down', 1, 0, 1),
('fan_pack', 'Grow Fans', 1, 0, 1),
('temperture_pack', 'Grow AC/Heater', 1, 0, 1),
('light_pack', 'Grow Lights', 1, 0, 1),
('humidity_pack', 'Grow Humidifier', 1, 0, 1),
('soil_change', 'Soil Change', 1, 0, 1),
('weed_ambulance', 'Ambulance 5G', 1, 0, 1),
('weed_granddaddy', 'Grand Daddy Purp 10g', 1, 0, 1),
('weed_peauto', 'PineA pple Express 5G', 1, 0, 1),
('weed_nlight', 'Northern Lights 5G', 1, 0, 1),
('weed_cheeseberry', 'CheeseBerry 5G', 1, 0, 1),
('weed_purpun', 'Purple Punch 5G', 1, 0, 1),
('weed_amhaze', 'Amnesia Haze 5G', 1, 0, 1),
('cheeseberry_seed', 'CheeseBerry Seeds', 1, 0, 1),
('ambulance_seed', 'Ambulance Seeds', 1, 0, 1),
('gdp_seed', 'Grand Daddy Purp Seeds', 1, 0, 1),
('peauto_seed', 'Pine Apple Express Auto Seeds', 1, 0, 1),
('nlight_seed', 'Northern Lights Seeds', 1, 0, 1),
('purpun_seed', 'Purple Punch Seeds', 1, 0, 1),
('amhaze_seed', 'Amnesia Haze Seeds', 1, 0, 1);

