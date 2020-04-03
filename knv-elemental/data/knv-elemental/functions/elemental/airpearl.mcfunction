# Air Pearls
# - Regular: Casts lightning bolt
# - Greater: Multiple lightning strikes with upward column of air
# - Ultimate: "Tornado", column of air that launches entities up, no feather falling, but yes lightning
#
# Note: Greater and Ultimate forms of air pearls will grant speed
# Uses knvElemental scores 6-8
###################################################################


# Regular 
scoreboard players set @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Air Pearl\"]"}}}}] knvElemental 6
scoreboard players set @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Air Pearl\"]"}}}]}] knvElemental 6
execute as @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Air Pearl\"]"}}}}] run scoreboard players set @s knvElCooldown 3
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Air Pearl\"]"}}}]}] run scoreboard players set @s knvElCooldown 3


execute as @e[type=minecraft:armor_stand,tag=SnowballNoHit] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:armor_stand,tag=SnowballHit] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:snowball,scores={knvElemental=6}] at @s positioned as @s run kill @e[tag=SnowballNoHit,distance=..3]
execute as @e[type=minecraft:snowball,scores={knvElemental=6}] at @s positioned ~ ~2 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["SnowballNoHit"]}

execute as @e[type=minecraft:armor_stand,tag=SnowballNoHit,scores={knvElemental=1}] at @s run tag @s add SnowballHit
execute as @e[type=minecraft:armor_stand,tag=SnowballNoHit,scores={knvElemental=1}] at @s run tag @s remove SnowballNoHit
execute as @e[type=minecraft:armor_stand,tag=SnowballHit,scores={knvElemental=2}] at @s run kill @s
execute as @e[type=minecraft:armor_stand,tag=SnowballHit] at @s positioned ~ ~-2 ~ run summon minecraft:lightning_bolt ~ ~ ~

execute as @a[scores={knvElemental=6}] at @s as @e[type=minecraft:snowball,distance=2..10,limit=1] run scoreboard players set @s knvElemental 6
execute as @a[scores={knvElemental=6}] run scoreboard players remove @s knvElCooldown 1


# Greater 
scoreboard players set @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Air Pearl\"]"}}}}] knvElemental 7
scoreboard players set @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Air Pearl\"]"}}}]}] knvElemental 7
execute as @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Air Pearl\"]"}}}}] run scoreboard players set @s knvElCooldown 3
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Air Pearl\"]"}}}]}] run scoreboard players set @s knvElCooldown 3
execute as @a[scores={knvElemental=7}] run effect give @s minecraft:speed 1

execute as @e[type=minecraft:armor_stand,tag=SnowballNoHit2] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:armor_stand,tag=SnowballHit2] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:snowball,scores={knvElemental=7}] at @s positioned as @s run kill @e[tag=SnowballNoHit2,distance=..3]
execute as @e[type=minecraft:snowball,scores={knvElemental=7}] at @s positioned ~ ~2 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["SnowballNoHit2"]}

execute as @e[type=minecraft:armor_stand,tag=SnowballNoHit2,scores={knvElemental=1}] at @s run tag @s add SnowballHit2
execute as @e[type=minecraft:armor_stand,tag=SnowballNoHit2,scores={knvElemental=1}] at @s run tag @s remove SnowballNoHit2
execute as @e[type=minecraft:armor_stand,tag=SnowballHit2,scores={knvElemental=2}] at @s run kill @s
execute as @e[type=minecraft:armor_stand,tag=SnowballHit2] at @s positioned ~ ~-2 ~ run summon area_effect_cloud ~ ~ ~ {NoGravity:1b,Particle:"mobSpell",ReapplicationDelay:0,Radius:4f,Duration:80,WaitTime:0,Color:6714879,Effects:[{Id:8b,Amplifier:14b,Duration:60},{Id:25b,Amplifier:16b,Duration:20}]}
execute as @e[type=minecraft:armor_stand,tag=SnowballHit2] at @s positioned ~ ~-2 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["LightningTargetG"]}
execute as @e[type=minecraft:armor_stand,tag=SnowballHit2] at @s positioned ~ ~-2 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["LightningTargetG"]}
execute as @e[type=minecraft:armor_stand,tag=SnowballHit2] at @s positioned ~ ~-2 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["LightningTargetG"]}
execute as @e[type=minecraft:armor_stand,tag=SnowballHit2] at @s positioned ~ ~-2 ~ run spreadplayers ~ ~ 3 4 false @e[type=minecraft:armor_stand,tag=LightningTargetG]
execute as @e[type=minecraft:armor_stand,tag=LightningTargetG] at @s positioned ~ ~-2 ~ run summon minecraft:lightning_bolt ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=LightningTargetG] at @s run kill @s

execute as @a[scores={knvElemental=7}] at @s as @e[type=minecraft:snowball,distance=2..10,limit=1] run scoreboard players set @s knvElemental 7
execute as @a[scores={knvElemental=7}] run scoreboard players remove @s knvElCooldown 1


# Ultimate 
scoreboard players set @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Air Pearl\"]"}}}}] knvElemental 8
scoreboard players set @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Air Pearl\"]"}}}]}] knvElemental 8
execute as @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Air Pearl\"]"}}}}] run scoreboard players set @s knvElCooldown 3
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Air Pearl\"]"}}}]}] run scoreboard players set @s knvElCooldown 3
execute as @a[scores={knvElemental=8}] run effect give @s minecraft:speed 1

execute as @e[type=minecraft:armor_stand,tag=SnowballNoHit3] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:armor_stand,tag=SnowballHit3] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:snowball,scores={knvElemental=8}] at @s positioned as @s run kill @e[tag=SnowballNoHit3,distance=..3]
execute as @e[type=minecraft:snowball,scores={knvElemental=8}] at @s positioned ~ ~2 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["SnowballNoHit3"]}

execute as @e[type=minecraft:armor_stand,tag=SnowballNoHit3,scores={knvElemental=1}] at @s run tag @s add SnowballHit3
execute as @e[type=minecraft:armor_stand,tag=SnowballNoHit3,scores={knvElemental=1}] at @s run tag @s remove SnowballNoHit3
execute as @e[type=minecraft:armor_stand,tag=SnowballHit3,scores={knvElemental=2}] at @s run kill @s
execute as @e[type=minecraft:armor_stand,tag=SnowballHit3] at @s positioned ~ ~ ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["LightningTarget"]}
execute as @e[type=minecraft:armor_stand,tag=SnowballHit3] at @s positioned ~ ~ ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["LightningTarget"]}
execute as @e[type=minecraft:armor_stand,tag=SnowballHit3] at @s positioned ~ ~ ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["LightningTarget"]}
execute as @e[type=minecraft:armor_stand,tag=SnowballHit3] at @s positioned ~ ~ ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["LightningTarget"]}
execute as @e[type=minecraft:armor_stand,tag=SnowballHit3] at @s positioned ~ ~ ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["LightningTarget"]}
execute as @e[type=minecraft:armor_stand,tag=SnowballHit3] at @s positioned ~ ~ ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["LightningTarget"]}
execute as @e[type=minecraft:armor_stand,tag=SnowballHit3] at @s positioned ~ ~ ~ run spreadplayers ~ ~ 3 4 false @e[type=minecraft:armor_stand,tag=LightningTarget]
execute as @e[type=minecraft:armor_stand,tag=SnowballHit3] at @s positioned ~ ~ ~ run summon minecraft:snowball ~ ~ ~ {Motion:[0.0,1.8,0.0],Tags:["stormspawn"],Invisible:1b}

execute as @e[type=minecraft:snowball,tag=stormspawn] at @s run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:snowball,tag=stormspawn,scores={knvElemental=1}] at @s positioned ~ ~-1 ~ run summon area_effect_cloud ~ ~ ~ {NoGravity:1b,Particle:"mobSpell",ReapplicationDelay:0,Radius:4f,Duration:90,WaitTime:0,Color:F00000,Effects:[{Id:25b,Amplifier:16b,Duration:20},{Id:24b,Amplifier:16b,Duration:140},{Id:18b,Amplifier:16b,Duration:140}]}
execute as @e[type=minecraft:snowball,tag=stormspawn,scores={knvElemental=2..}] at @s run scoreboard players set @s knvElemental 0
execute as @e[type=minecraft:armor_stand,tag=LightningTarget] at @s positioned ~ ~-2 ~ run summon minecraft:lightning_bolt ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=LightningTarget] at @s run kill @s

execute as @a[scores={knvElemental=8}] at @s as @e[type=minecraft:snowball,tag=!stormspawn,distance=2..10,limit=1] run scoreboard players set @s knvElemental 8
execute as @a[scores={knvElemental=8}] run scoreboard players remove @s knvElCooldown 1


# DEBUG: Give Air Pearls for testing
# /give @p minecraft:snowball{display:{Name:"[\"Air Pearl\"]",Lore:["{\"text\":\"An air pearl swirling with chaotic engergy.\"}","{\"text\":\"Throw to summon a powerful lightning bolt.\"}"]},CustomModelData:4} 16
# /give @p minecraft:snowball{display:{Name:"[\"Greater Air Pearl\"]",Lore:["{\"text\":\"An air pearl with the soft glow of a storm cloud.\"}","{\"text\":\"Throw to create a potent updraft of air.\"}"]},CustomModelData:5} 16
# /give @p minecraft:snowball{display:{Name:"[\"Ultimate Air Pearl\"]",Lore:["{\"text\":\"A violently sparking air pearl.\"}","{\"text\":\"Throw to unleash a whirlwind of destruction!\"}"]},CustomModelData:6} 16
#####################################
