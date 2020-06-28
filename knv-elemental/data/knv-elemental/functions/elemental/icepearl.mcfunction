# Ice Pearls
# - Regular: Creates Ice Cage
# - Greater: Replaces blocks to ice blocks ("flash freeze"), with area of effect to slow mobs
# - Ultimate: "Ice Bridges", creates a bridge of ice, slowness effect and instant damage surrounding the bridge
#
# Note: Greater and Ultimate forms of ice pearls will still slow enemies, with increasing range with each different charge type
# Uses knvElemental scores 10-12
#################################################################

# Regular
scoreboard players set @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Ice Pearl\"]"}}}}] knvElemental 10
scoreboard players set @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Ice Pearl\"]"}}}]}] knvElemental 10
execute as @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Ice Pearl\"]"}}}}] run scoreboard players set @s knvElCooldown 3
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Ice Pearl\"]"}}}]}] run scoreboard players set @s knvElCooldown 3

execute as @e[type=minecraft:armor_stand,tag=IceNoHit] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:armor_stand,tag=IceHit] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:snowball,scores={knvElemental=10}] at @s positioned as @s run kill @e[tag=IceNoHit,distance=..3]
execute as @e[type=minecraft:snowball,scores={knvElemental=10}] at @s positioned ~ ~2 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["IceNoHit"],Marker:1b}

execute as @e[type=minecraft:armor_stand,tag=IceNoHit,scores={knvElemental=1}] at @s run tag @s add IceHit
execute as @e[type=minecraft:armor_stand,tag=IceNoHit,scores={knvElemental=1}] at @s run tag @s remove IceNoHit
execute as @e[type=minecraft:armor_stand,tag=IceHit,scores={knvElemental=2}] at @s run kill @s
execute as @e[type=minecraft:armor_stand,tag=IceHit] at @s positioned ~ ~-2 ~ run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 minecraft:packed_ice keep
execute as @e[type=minecraft:armor_stand,tag=IceHit] at @s positioned ~ ~-2 ~ run playsound minecraft:block.glass.break ambient @a ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=IceHit] at @s positioned ~ ~-2 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["AutoIceBreak"],Marker:1b}

execute as @e[type=minecraft:armor_stand,tag=AutoIceBreak] at @s run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:armor_stand,tag=AutoIceBreak,scores={knvElemental=100..}] at @s run playsound minecraft:block.glass.break ambient @a ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=AutoIceBreak,scores={knvElemental=100..}] at @s run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:air replace minecraft:packed_ice
execute as @e[type=minecraft:armor_stand,tag=AutoIceBreak,scores={knvElemental=100..}] at @s run particle minecraft:cloud ~ ~ ~ 1 1 1 0.1 20 normal
execute as @e[type=minecraft:armor_stand,tag=AutoIceBreak,scores={knvElemental=100..}] at @s run kill @s

execute as @a[scores={knvElemental=10}] at @s as @e[type=minecraft:snowball,distance=2..10,limit=1] run scoreboard players set @s knvElemental 10
execute as @a[scores={knvElemental=10}] run scoreboard players remove @s knvElCooldown 1

# Greater
scoreboard players set @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Ice Pearl\"]"}}}}] knvElemental 11
scoreboard players set @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Ice Pearl\"]"}}}]}] knvElemental 11
execute as @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Ice Pearl\"]"}}}}] run scoreboard players set @s knvElCooldown 3
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Ice Pearl\"]"}}}]}] run scoreboard players set @s knvElCooldown 3
execute as @a[scores={knvElemental=11}] at @s run particle minecraft:splash ~ ~ ~ 1 1 1 0.2 4 normal
execute as @a[scores={knvElemental=11}] at @s run effect give @e[distance=2..8,limit=4] minecraft:slowness 1 2

execute as @e[type=minecraft:armor_stand,tag=IceNoHit2] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:armor_stand,tag=IceHit2] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:snowball,scores={knvElemental=11}] at @s positioned as @s run kill @e[tag=IceNoHit2,distance=..3]
execute as @e[type=minecraft:snowball,scores={knvElemental=11}] at @s positioned ~ ~2 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["IceNoHit2"]}

execute as @e[type=minecraft:armor_stand,tag=IceNoHit2,scores={knvElemental=1}] at @s run tag @s add IceHit2
execute as @e[type=minecraft:armor_stand,tag=IceNoHit2,scores={knvElemental=1}] at @s run tag @s remove IceNoHit2
execute as @e[type=minecraft:armor_stand,tag=IceHit2,scores={knvElemental=2}] at @s run kill @s
execute as @e[type=minecraft:armor_stand,tag=IceHit2] at @s positioned ~ ~-2 ~ run fill ~1 ~-1 ~1 ~-1 ~-1 ~-1 minecraft:packed_ice replace
execute as @e[type=minecraft:armor_stand,tag=IceHit2] at @s positioned ~ ~-2 ~ run summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1b,ReapplicationDelay:0,Radius:2f,Duration:150,Particle:"mobSpell",Color:6714879,Potion:"minecraft:slowness",Effects:[{Id:2b,Amplifier:3b,Duration:100,ShowParticles:1b}]} 
execute as @e[type=minecraft:armor_stand,tag=IceHit2] at @s positioned ~ ~-2 ~ run summon minecraft:armor_stand ~ ~-1 ~ {NoGravity:1b,Invisible:1b,Tags:["RegIceBreak"],Marker:1b}
execute as @e[type=minecraft:armor_stand,tag=IceHit2] at @s positioned ~ ~-2 ~ run playsound minecraft:block.glass.break ambient @a ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=RegIceBreak] at @s run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:armor_stand,tag=RegIceBreak,scores={knvElemental=150..}] at @s run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:air replace minecraft:packed_ice
execute as @e[type=minecraft:armor_stand,tag=RegIceBreak,scores={knvElemental=150..}] at @s run playsound minecraft:block.glass.break ambient @a ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=RegIceBreak,scores={knvElemental=150..}] at @s run kill @s 

execute as @a[scores={knvElemental=11}] at @s as @e[type=minecraft:snowball,distance=2..10,limit=1] run scoreboard players set @s knvElemental 11
execute as @a[scores={knvElemental=11}] run scoreboard players remove @s knvElCooldown 1

# Ultimate
scoreboard players set @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Ice Pearl\"]"}}}}] knvElemental 12
scoreboard players set @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Ice Pearl\"]"}}}]}] knvElemental 12
execute as @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Ice Pearl\"]"}}}}] run scoreboard players set @s knvElCooldown 3
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Ice Pearl\"]"}}}]}] run scoreboard players set @s knvElCooldown 3
execute as @a[scores={knvElemental=12}] at @s run particle minecraft:splash ~ ~ ~ 1 1 1 0.2 4 normal
execute as @a[scores={knvElemental=12}] at @s run effect give @e[distance=2..9,limit=4] minecraft:slowness 1 2

execute as @e[type=minecraft:snowball,tag=SuperIce] at @s positioned ~ ~-2 ~ run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:blue_ice replace
execute as @e[type=minecraft:snowball,tag=SuperIce] at @s run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:snowball,tag=SuperIce,scores={knvElemental=2}] at @s run summon minecraft:armor_stand ~ ~-1 ~ {NoGravity:1b,Invisible:1b,Tags:["SuperIceBreak"],Marker:1b}
execute as @e[type=minecraft:snowball,tag=SuperIce,scores={knvElemental=2}] at @s run summon area_effect_cloud ~ ~-1 ~ {NoGravity:1b,Particle:"block air",ReapplicationDelay:0,Radius:5f,Duration:140,WaitTime:0,Color:6714879}
execute as @e[type=minecraft:snowball,tag=SuperIce,scores={knvElemental=3}] at @s run scoreboard players set @s knvElemental 0
execute as @e[type=minecraft:armor_stand,tag=SuperIceBreak] at @s run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:armor_stand,tag=SuperIceBreak] at @s run effect give @e[distance=..6,type=!minecraft:player] minecraft:slowness 1 8
execute as @e[type=minecraft:armor_stand,tag=SuperIceBreak] at @s run effect give @e[distance=..6,type=!minecraft:player] minecraft:instant_damage 1
execute as @e[type=minecraft:armor_stand,tag=SuperIceBreak,scores={knvElemental=150..}] at @s run playsound minecraft:block.glass.break ambient @a ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=SuperIceBreak,scores={knvElemental=150..}] at @s run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:air replace minecraft:blue_ice
execute as @e[type=minecraft:armor_stand,tag=SuperIceBreak,scores={knvElemental=150..}] at @s run particle minecraft:cloud ~ ~ ~ 1 1 1 0.1 20 normal
execute as @e[type=minecraft:armor_stand,tag=SuperIceBreak,scores={knvElemental=150..}] at @s run kill @s

execute as @a[scores={knvElemental=12}] at @s as @e[type=minecraft:snowball,distance=2..10,limit=1] run tag @s add SuperIce
execute as @a[scores={knvElemental=12}] run scoreboard players remove @s knvElCooldown 1


# DEBUG: Give Ice Pearls for testing
# /give @p minecraft:snowball{display:{Name:"[\"Ice Pearl\"]",Lore:["{\"text\":\"An ice pearl cold to the touch.\"}","{\"text\":\"Throw to summon a cage of solid ice.\"}"]},CustomModelData:7} 16
# /give @p minecraft:snowball{display:{Name:"[\"Greater Ice Pearl\"]",Lore:["{\"text\":\"An ice pearl coated in frost.\"}","{\"text\":\"Throw to produce a freezing cloud, flash freezing any block on impact.\"}"]},CustomModelData:8} 16
# /give @p minecraft:snowball{display:{Name:"[\"Ultimate Ice Pearl\"]",Lore:["{\"text\":\"A crystalline ice pearl freezing to the touch.\"}","{\"text\":\"Throw to form a deathly frozen bridge of ice!\"}"]},CustomModelData:9} 16
#####################################
