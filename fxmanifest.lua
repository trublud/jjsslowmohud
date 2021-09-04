fx_version 'cerulean'
game 'gta5'

author 'mindping'
description 'JJs SlowMo with Hud'
version '0.0.3'




shared_scripts {
    'config.lua'
}

client_scripts {
    'config.lua',
    'client/*'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/*'
}

ui_page {
    'ui/index.html'
}

files {
    'ui/index.html',
    'ui/main.js',
    'config.lua',
    'ui/style.css',
  --  'ui/jQueryAssets/*',
    'ui/jQueryAssets/jquery.ui-1.10.4.button.min.js',
   -- 'ui/jQueryAssets/jquery.ui.core.min.css',
    'ui/jQueryAssets/jquery.ui.theme.min.css',
    'ui/jQueryAssets/jquery.ui.button.min.css',
   -- 'ui/jQueryAssets/jquery-1.11.1.min.js',
    'ui/jQueryAssets/jquery.ui-1.10.4.button.min.js',
    'ui/jQueryAssets/images/*'
}
---created LiamInChains#3776---
---heavilied modified by mindping---