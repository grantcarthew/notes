# Minetest Notes

## Main Server

* Build: 5.0.1
* Game: minetest_game
* World: /minetest/main/world
* craftguide mod: 1.11b <= latest version that supports 5.0.1

## Building Minetest

Install dependencies:

```bash
sudo apt update
# Install command from the Minetest documentation. Then install libncurses-dev to enable --terminal support.
sudo apt install libncurses-dev

```

Clone the minetest repo

https://github.com/minetest/minetest

git branch to list the branches and checkout the latest version branch.

Follow the build instructions on the page. Most recently used:

```bash
cmake . -DRUN_IN_PLACE=TRUE -DBUILD_SERVER=TRUE -DBUILD_CLIENT=FALSE -DENABLE_CURSES=ON -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)
```

Change directory into the games directory and clone in the games you want.
Capture the flag (https://github.com/MT-CTF/capturetheflag) requires some update scripts run. Be warned that they fix the settings in the lua scripts.

Update a minetest.conf file with desired settings. See an example below.

Launch with a command like:

```bash
#!/bin/bash
/opt/mt/main/bin/minetestserver --info --config /opt/mt/main/minetest.conf
```

## Upgrade Plan

Start by backing up the current stable game files.

Compile the server version you wish to have:

```bash
cd /minetest/main
git status
git checkout 5.0.0
git pull
cmake . -DRUN_IN_PLACE=TRUE -DBUILD_SERVER=TRUE -DBUILD_CLIENT=FALSE -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)
```

Update the `minetest_game`:

```bash
cd /minetest/main/games/minetest_game
git status
git pull
git checkout 5.0.0
```

Update mods with the following:

_Note: This typically causes problems. It would be better to update each mod and test the result._

```bash
cd /minetest/main/mods
find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;
```

### Mods

Installed into: `/minetest/main/mods`

Settings file: `/minetest/main/mods/settings.conf` <= Currently only used for ethereal.

Installed mods:

* craftguide - http://github.com/minetest-mods/craftguide
* underch - https://gitlab.com/h2mm/underch
* 3dr_armor
* castle_tapestries
* farming
* hangglider
* lavastuff
* mobs - https://notabug.org/TenPlus1/mobs_redo.git
* moretrees
* petz
* simple_skins
* unifieddyes
* awards
* cottages
* food
* homedecor_modpack
* lightning
* mobs_animal
* nether
* pipeworks
* sling
* weather
* basic_materials
* craftguide
* formspecs
* hook
* livetools
* mobs_monster
* node_ownership
* plantlife_modpack
* technic
* wielded_light
* beacons
* crops
* giftbox
* hot_air_balloons
* minetest-manners
* mods_here.txt
* orbs_of_time
* plasterwork
* throwing
* xdecor
* bike
* digtron
* glooptest
* item_strings
* minetest-meseportals
* moreblocks
* ownership
* pontoons
* uchu
* xocean
* biome_lib
* ethereal
* gocm_carbon
* kpgmobs
* minetest-toolranks
* moreores
* paleotest
* portalgun
* underch

Mod Git Repos:

Using the following command from inside the mods directory produced the below list:

`find ./**/.git -name "config" | xargs cat | grep url | sed -e 's/^.*url = /* /'`

* https://github.com/stujones11/minetest-3d_armor.git
* https://github.com/rubenwardy/awards.git
* https://gitlab.com/VanessaE/basic_materials.git
* https://gitlab.com/h2mm/bike.git
* https://gitlab.com/VanessaE/biome_lib.git
* https://github.com/minetest-mods/castle_tapestries.git
* https://github.com/Sokomine/cottages.git
* https://github.com/minetest-mods/craftguide.git
* https://github.com/minetest-mods/crops.git
* https://github.com/minetest-mods/death_compass.git
* https://notabug.org/TenPlus1/ethereal.git
* https://notabug.org/TenPlus1/farming.git <= Not enabled at this time.
* https://github.com/rubenwardy/food.git
* https://bitbucket.org/sorcerykid/formspecs.git
* https://bitbucket.org/sorcerykid/giftbox.git
* https://github.com/GloopMaster/glooptest.git
* https://github.com/ThatGhzGamer/gocm_carbon.git
* https://notabug.org/Piezo_/minetest-hangglider.git
* https://gitlab.com/VanessaE/homedecor_modpack.git
* https://github.com/AiTechEye/hook.git
* https://github.com/YuGiOhJCJ/item_strings.git
* https://github.com/LoneWolfHT/lavastuff.git
* https://github.com/AiTechEye/livetools.git
* https://github.com/brylie/minetest-manners.git
* https://notabug.org/Piezo_/minetest-meseportals.git
* https://github.com/lisacvuk/minetest-toolranks.git
* https://notabug.org/TenPlus1/mobs_animal.git
* https://notabug.org/TenPlus1/mobs_redo.git
* https://notabug.org/TenPlus1/mobs_monster.git
* https://github.com/minetest-mods/moreblocks.git
* https://github.com/minetest-mods/moreores.git
* https://gitlab.com/VanessaE/moretrees.git
* https://github.com/minetest-mods/nether.git
* https://github.com/minetest-mods/orbs_of_time.git
* https://bitbucket.org/sorcerykid/ownership.git
* https://github.com/ElCeejoYT/paleotest.git
* https://github.com/runsy/petz
* https://gitlab.com/VanessaE/pipeworks.git
* https://gitlab.com/VanessaE/plantlife_modpack.git
* https://github.com/minetest-mods/pontoons.git
* https://github.com/AiTechEye/portalgun.git
* https://notabug.org/TenPlus1/simple_skins.git
* https://github.com/minetest-mods/technic.git
* https://github.com/minetest-mods/throwing.git
* https://gitlab.com/h2mm/uchu.git
* https://gitlab.com/h2mm/underch.git
* https://gitlab.com/VanessaE/unifieddyes.git
* https://github.com/theFox6/minetest_mod_weather.git
* https://github.com/minetest-mods/wielded_light.git
* https://github.com/minetest-mods/xdecor
* https://github.com/starninjas/xocean.git
* https://github.com/TheTermos/mobkit

Updated mods:

* awards
* mobs
* mobs_animals
* mobs_monsters
* underch
* ethereal
* petz

Update failed:

* craftingguide

Todo:

* advtrains - https://git.bananach.space/advtrains.git


## minetest.conf

craftguide_progressive_mode = true
craftguide_sfinv_only = true
name = roobunya
port = 30000
server_name = JREP
server_description = Minetest carthew family server.
server_address = mt.carthew.net
server_announce = false
serverlist_url = servers.minetest.net
default_game = minetest
map-dir = /var/games/minetest-server/.minetest/worlds/world
motd = Welcome to Minetest. Enjoy your stay!
max_users = 15
enable_pvp = false
creative_mode = false
enable_damage = true
default_privs = interact, shout, sethome, home
default_password = December
disallow_empty_password = true
disable_anticheat = false
display_gamma = 3.0
mg_name = valleys
