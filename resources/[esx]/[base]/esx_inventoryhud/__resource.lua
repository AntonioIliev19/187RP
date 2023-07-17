resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description "ESX Inventory HUD"

version "1.1"

ui_page "html/ui.html"

client_scripts {
  "@es_extended/locale.lua",
  "client/main.lua",
  "client/shop.lua",
  "client/trunk.lua",
  "client/property.lua",
  "client/player.lua",
  "locales/cs.lua",
  "locales/en.lua",
  "locales/fr.lua",
  "config.lua"
}

server_scripts {
  "@mysql-async/lib/MySQL.lua",
  "@es_extended/locale.lua",
  "server/main.lua",
  "locales/cs.lua",
  "locales/en.lua",
  "locales/fr.lua",
  "config.lua"
}

files {
  "html/ui.html",
  "html/css/ui.css",
  "html/css/jquery-ui.css",
  "html/js/inventory.js",
  "html/js/config.js",
  -- JS LOCALES
  "html/locales/cs.js",
  "html/locales/en.js",
  "html/locales/fr.js",
  -- IMAGES
  "html/img/bullet.png",
  -- ICONS
  "html/img/items/repairkit.png",
  "html/img/items/engbomb.png",
  "html/img/items/advancedlockpick.png",
  "html/img/items/picnic.png",
  "html/img/items/rose.png",
  "html/img/items/redgull.png",
  "html/img/items/umbrella.png",
  "html/img/items/alarminterface.png",
  "html/img/items/bulletproof.png",
  "html/img/items/clothe2.png",
  "html/img/items/contract.png",
  "html/img/items/chicken.png",
  "html/img/items/chicken_package.png",
  "html/img/items/chicken_meat.png",
  "html/img/items/clothe.png",
  "html/img/items/cloth.png",
  "html/img/items/vine.png",
  "html/img/items/raisin_juice.png",
  "html/img/items/grand_cru.png",
  "html/img/items/raisin.png",
  "html/img/items/fish.png",
  "html/img/items/fishingrod.png",
  "html/img/items/bait.png",
  "html/img/items/heroin.png",
  "html/img/items/lom.png",
  "html/img/items/bandage.png",
  "html/img/items/beer.png",
  "html/img/items/jumelles.png",
  "html/img/items/bread.png",
  "html/img/items/chemicals.png",
  "html/img/items/hydrochloric_acid.png",
  "html/img/items/lsa.png",
  "html/img/items/lsd.png",
  "html/img/items/marijuana.png",
  "html/img/items/moneywash.png",
  "html/img/items/chemicalslisence.png",
  "html/img/items/poppyresin.png",
  "html/img/items/sodium_hydroxide.png",
  "html/img/items/sulfuric_acid.png",
  "html/img/items/thionyl_chloride.png",
  "html/img/items/coca_leaf.png",
  "html/img/items/cannabis.png",
  "html/img/items/clip.png",
  "html/img/items/cocacola.png",
  "html/img/items/coffee.png",
  "html/img/items/coke.png",
  "html/img/items/coke_pooch.png",
  "html/img/items/meth.png",
  "html/img/items/meth_pooch.png",
  "html/img/items/opium.png",
  "html/img/items/alarm1.png",
  "html/img/items/rccar.png",
  "html/img/items/alarm2.png",
  "html/img/items/alarm3.png",
  "html/img/items/beef.png",
  "html/img/items/carokit.png",
  "html/img/items/bolchips.png",
  "html/img/items/martini.png",
  "html/img/items/sim.png",
  "html/img/items/soda.png",
  "html/img/items/tenuecasa.png",
  "html/img/items/opium_pooch.png",
  "html/img/items/weed.png",
  "html/img/items/weed_pooch.png",
  "html/img/items/gold.png",
  "html/img/items/icetea.png",
  "html/img/items/sandwich.png",
  "html/img/items/papers.png",
  "html/img/items/hamburger.png",
  "html/img/items/hamburgerplate.png",
  "html/img/items/wine.png",
  "html/img/items/cash.png",
  "html/img/items/chocolate.png",
  "html/img/items/iron.png",
  "html/img/items/jewels.png",
  "html/img/items/diamond.png",
  "html/img/items/rolex.png",
  "html/img/items/ring.png",
  "html/img/items/laptop.png",
  "html/img/items/lockpick.png",
  "html/img/items/drill.png",
  "html/img/items/blowtorch.png",
  "html/img/items/medikit.png",
  "html/img/items/tequila.png",
  "html/img/items/whisky.png",
  "html/img/items/limonade.png",
  "html/img/items/phone.png",
  "html/img/items/vodka.png",
  "html/img/items/water.png",
  "html/img/items/cupcake.png",
  "html/img/items/drpepper.png",
  "html/img/items/energy.png",
  "html/img/items/cashewnut.png",
  "html/img/items/peanut.png",
  "html/img/items/pistachionut.png",
  "html/img/items/fixkit.png",
  "html/img/items/potatochips.png",
  "html/img/items/black_chip.png",
  "html/img/items/black_money.png",
  "html/img/items/gym_membership.png",
  "html/img/items/WEAPON_APPISTOL.png",
  "html/img/items/WEAPON_ASSAULTRIFLE.png",
  "html/img/items/WEAPON_ASSAULTSHOTGUN.png",
  "html/img/items/WEAPON_BOTTLE.png",
  "html/img/items/WEAPON_BULLPUPRIFLE.png",
  "html/img/items/WEAPON_CARBINERIFLE.png",
  "html/img/items/WEAPON_COMBATMG.png",
  "html/img/items/WEAPON_BAT.png",
  "html/img/items/WEAPON_COMBATPISTOL.png",
  "html/img/items/WEAPON_CROWBAR.png",
  "html/img/items/WEAPON_GOLFCLUB.png",
  "html/img/items/WEAPON_GUSENBERG.png",
  "html/img/items/WEAPON_KNIFE.png",
  "html/img/items/WEAPON_MICROSMG.png",
  "html/img/items/WEAPON_NIGHTSTICK.png",
  "html/img/items/WEAPON_HAMMER.png",
  "html/img/items/WEAPON_PISTOL.png",
  "html/img/items/oxygen_mask.png",
  "html/img/items/WEAPON_PUMPSHOTGUN.png",
  "html/img/items/hammerwirecutter.png",
  "html/img/items/WEAPON_SAWNOFFSHOTGUN.png",
  "html/img/items/WEAPON_SMG.png",
  "html/img/items/WEAPON_STUNGUN.png",
  "html/img/items/WEAPON_SPECIALCARBINE.png",
  "html/img/items/WEAPON_KNUCKLE.png",
  "html/img/items/flashlight.png",
  "html/img/items/WEAPON_REVOLVER.png",
  "html/img/items/WEAPON_DAGGER.png",
  "html/img/items/WEAPON_PETROLCAN.png",
  "html/img/items/WEAPON_PISTOL50.png",
  "html/img/items/WEAPON_DBSHOTGUN.png",
  "html/img/items/WEAPON_SWITCHBLADE.png",
  "html/img/items/WEAPON_POOLCUE.png", --addons from 6/30/19 and after
  "html/img/items/WEAPON_SNSPISTOL.png",
  "html/img/items/WEAPON_PARACHUTE.png",
  "html/img/items/WEAPON_FLAREGUN.png",
  "html/img/items/WEAPON_MOLOTOV.png",
  "html/img/items/WEAPON_BULLPUPSHOTGUN.png",
  "html/img/items/WEAPON_COMPACTRIFLE.png",
  "html/img/items/WEAPON_COMBATPDW.png",
  "html/img/items/poolreceipt.png",
  "html/img/items/tunerchip.png",
  "html/img/items/blindfold.png",
  "html/img/items/grip.png",
  "html/img/items/flashlight.png",
  "html/img/items/silencieux.png",
  "html/img/items/SmallArmor.png",
  "html/img/items/MedArmor.png",
  "html/img/items/HeavyArmor.png",
  "html/img/items/cigarett.png",
  "html/img/items/cigarettepack.png",
  "html/img/items/lighter.png",
  "html/img/items/pistolAmmo.png",
  "html/img/items/shotgunAmmo.png",
  "html/img/items/rifleAmmo.png",
  "html/img/items/machinegunAmmo.png",
  "html/img/items/firstaidkit.png",
  "html/img/items/bitcoin.png",
  "html/img/items/raspberry.png",
  "html/img/items/tuning_laptop.png",
  "html/img/items/headbag.png",
  "html/img/items/leather.png",
  "html/img/items/lokalizator.png",
  "html/img/items/c4_bank.png",
  "html/img/items/rhum.png",
  "html/img/items/gps.png",
  "html/img/items/zetony.png",
  "html/img/items/wool.png",
  "html/img/items/xanax.png",
  "html/img/items/weaponflashlight.png",
  "html/img/items/weapongrip.png",
  "html/img/items/WEAPON_STICKYBOMB.png",
}
