# New Ender Pearls
# - Greater: Swaps the nearest player with the nearest entity wherever it lands
# - Ultimate: tps all non-item entities to the loc with enderman,
#             and tps all items to the player
#
# Note: Greater and Ultimate forms of ender pearls will give the player the glowing effect
# Uses knvElemental scores 18-19
#################################################################

# Greater
scoreboard players set @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Ender Pearl\"]"}}}}] knvElemental 18
scoreboard players set @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Ender Pearl\"]"}}}]}] knvElemental 18
execute as @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Ender Pearl\"]"}}}}] run scoreboard players set @s knvElCooldown 65
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Pearl\"]"}}}]}] run scoreboard players set @s knvElCooldown 65
execute as @a[scores={knvElemental=18}] at @s run effect give @s minecraft:glowing 1

execute as @e[type=minecraft:armor_stand,tag=EndNoHit] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:armor_stand,tag=EndHit] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:snowball,scores={knvElemental=18}] at @s positioned as @s run kill @e[tag=EndNoHit,distance=..3]
execute as @e[type=minecraft:snowball,scores={knvElemental=18}] at @s positioned ~ ~2 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["EndNoHit"],Marker:1b}

execute as @e[type=minecraft:armor_stand,tag=EndNoHit,scores={knvElemental=1}] at @s run tag @s add EndHit
execute as @e[type=minecraft:armor_stand,tag=EndNoHit,scores={knvElemental=1}] at @s run tag @s remove EndNoHit
execute as @e[type=minecraft:armor_stand,tag=EndHit,scores={knvElemental=2}] at @s run kill @s
execute as @e[type=minecraft:armor_stand,tag=EndHit] at @s positioned ~ ~-2 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["EndHitMarker"],Marker:1b}

execute as @e[type=minecraft:armor_stand,tag=EndHitMarker] at @s run tag @p[scores={knvElemental=18}] add EndPrlTeleP 
execute as @e[type=minecraft:armor_stand,tag=EndHitMarker] at @s run tag @e[type=!minecraft:player,limit=1,distance=..6] add EndPrlTeleE
execute as @e[type=minecraft:armor_stand,tag=EndHitMarker] at @s run kill @s

execute as @e[type=!minecraft:player,tag=EndPrlTeleE] at @s run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["EndPrlTelePTarget"],Marker:1b}
execute as @e[type=!minecraft:player,tag=EndPrlTeleE] at @s run particle minecraft:portal ~ ~ ~ 0 3 0 2 100 normal 
execute as @e[type=!minecraft:player,tag=EndPrlTeleE] at @s run particle minecraft:poof ~ ~ ~ 0 1 0 0.1 20 normal
execute as @e[type=!minecraft:player,tag=EndPrlTeleE] at @s run playsound minecraft:entity.enderman.teleport ambient @a ~ ~ ~
execute as @p[scores={knvElemental=18},tag=EndPrlTeleP] at @s run tp @e[type=!minecraft:player,tag=EndPrlTeleE] @s

execute as @p[scores={knvElemental=18},tag=EndPrlTeleP] at @s run particle minecraft:portal ~ ~ ~ 0 3 0 2 100 normal 
execute as @p[scores={knvElemental=18},tag=EndPrlTeleP] at @s run particle minecraft:poof ~ ~ ~ 0 1 0 0.1 20 normal
execute as @p[scores={knvElemental=18},tag=EndPrlTeleP] at @s run playsound minecraft:entity.enderman.teleport ambient @a ~ ~ ~
execute as @p[scores={knvElemental=18},tag=EndPrlTeleP] at @s run tp @e[type=!minecraft:player,tag=EndPrlTeleE] @s
execute as @e[type=minecraft:armor_stand,tag=EndPrlTelePTarget] at @s run tp @p[scores={knvElemental=18},tag=EndPrlTeleP] @s

execute as @e[type=minecraft:armor_stand,tag=EndPrlTelePTarget] at @s run kill @s 
execute as @e[type=!minecraft:player,tag=EndPrlTeleE] at @s run tag @s remove EndPrlTeleE 
execute as @p[scores={knvElemental=18},tag=EndPrlTeleP] at @s run tag @s remove EndPrlTeleP 

execute as @a[scores={knvElemental=18}] at @s as @e[type=minecraft:snowball,distance=2..10,limit=1] run scoreboard players set @s knvElemental 18
execute as @a[scores={knvElemental=18}] run scoreboard players remove @s knvElCooldown 1

# Ultimate
scoreboard players set @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Ender Pearl\"]"}}}}] knvElemental 19
scoreboard players set @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Ender Pearl\"]"}}}]}] knvElemental 19
execute as @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Ender Pearl\"]"}}}}] run scoreboard players set @s knvElCooldown 65
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Ender Pearl\"]"}}}]}] run scoreboard players set @s knvElCooldown 65
execute as @a[scores={knvElemental=19}] at @s run effect give @s minecraft:glowing 1

execute as @e[type=minecraft:armor_stand,tag=EndNoHit2] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:armor_stand,tag=EndHit2] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:snowball,scores={knvElemental=19}] at @s positioned as @s run kill @e[tag=EndNoHit2,distance=..3]
execute as @e[type=minecraft:snowball,scores={knvElemental=19}] at @s positioned ~ ~2 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["EndNoHit2"]}

execute as @e[type=minecraft:armor_stand,tag=EndNoHit2,scores={knvElemental=1}] at @s run tag @s add EndHit2
execute as @e[type=minecraft:armor_stand,tag=EndNoHit2,scores={knvElemental=1}] at @s run tag @s remove EndNoHit2
execute as @e[type=minecraft:armor_stand,tag=EndHit2,scores={knvElemental=2}] at @s run kill @s
execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run tag @p[scores={knvElemental=19}] add EndUltP 

# execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run fill ~6 ~6 ~6 ~-6 ~-6 ~-6 minecraft:air destroy
# commenting out the above, may be too OP. 
execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run summon minecraft:enderman ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run summon minecraft:enderman ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run summon minecraft:enderman ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run summon minecraft:enderman ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run summon minecraft:enderman ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run summon minecraft:enderman ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run summon minecraft:enderman ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run tag @e[type=minecraft:item,distance=..100] add playerOrItem
execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run tag @p[tag=EndUltP] add playerOrItem
execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run tp @e[tag=!playerOrItem] @s
execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run tag @e[tag=playerOrItem] remove playerOrItem
execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run tag @e[type=minecraft:item,distance=..100] add EndUltI
execute as @p[scores={knvElemental=19},tag=EndUltP] at @s positioned ~ ~4 ~ run tp @e[tag=EndUltI] @s
execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run playsound minecraft:item.totem.use ambient @a ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run particle minecraft:portal ~ ~ ~ 0 3 0 2 100 normal 
execute as @e[type=minecraft:armor_stand,tag=EndHit2] at @s positioned ~ ~-2 ~ run particle minecraft:poof ~ ~ ~ 0 1 0 0.1 20 normal

execute as @e[tag=EndUltI] at @s run tag @s remove EndUltI
execute as @p[scores={knvElemental=19},tag=EndUltP] at @s run tag @s remove EndUltP

execute as @a[scores={knvElemental=19}] at @s as @e[type=minecraft:snowball,distance=2..10,limit=1] run scoreboard players set @s knvElemental 19
execute as @a[scores={knvElemental=19}] run scoreboard players remove @s knvElCooldown 1

# DEBUG: Give New Ender Pearls for testing
# /give @p minecraft:snowball{display:{Name:"[\"Greater Ender Pearl\"]",Lore:["{\"text\":\"An ender pearl that's phasing in your hand.\"}","{\"text\":\"Throw to switch locations of the nearest player and entity.\"}"]},CustomModelData:13} 16
# /give @p minecraft:snowball{display:{Name:"[\"Ultimate Ender Pearl\"]",Lore:["{\"text\":\"An ender pearl that is both there... and not.\"}","{\"text\":\"Throw to bring in a little of the End dimension.\"}"]},CustomModelData:14} 16
#####################################
