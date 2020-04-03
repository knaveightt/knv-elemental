# Stone Pearls
# - Regular: Small Impact Explosion
# - Greater: Grants Strengh when held, turns Obsidian->Bedrock, stone->magma,
#                magma->lava, cobble->gravel, gravel->sand, sand->glass
# - Ultimate: Huge gravity bomb explosion
#
# Note: Greater and Ultimate forms of ice pearls will still grant strength
# Uses knvElemental scores 14-16
#################################################################

# Regular
scoreboard players set @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Stone Pearl\"]"}}}}] knvElemental 14
scoreboard players set @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Stone Pearl\"]"}}}]}] knvElemental 14
execute as @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Stone Pearl\"]"}}}}] run scoreboard players set @s knvElCooldown 3
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Stone Pearl\"]"}}}]}] run scoreboard players set @s knvElCooldown 3

execute as @e[type=minecraft:armor_stand,tag=StoneNoHit] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:armor_stand,tag=StoneHit] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:snowball,scores={knvElemental=14}] at @s positioned as @s run kill @e[tag=StoneNoHit,distance=..3]
execute as @e[type=minecraft:snowball,scores={knvElemental=14}] at @s positioned ~ ~2 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["StoneNoHit"]}

execute as @e[type=minecraft:armor_stand,tag=StoneNoHit,scores={knvElemental=1}] at @s run tag @s add StoneHit
execute as @e[type=minecraft:armor_stand,tag=StoneNoHit,scores={knvElemental=1}] at @s run tag @s remove StoneNoHit
execute as @e[type=minecraft:armor_stand,tag=StoneHit,scores={knvElemental=2}] at @s run kill @s
execute as @e[type=minecraft:armor_stand,tag=StoneHit] at @s positioned ~ ~-2 ~ run summon creeper ~ ~ ~ {NoGravity:1b,Silent:1b,Invisible:1b,Invulnerable:1b,NoAI:1b,ExplosionRadius:2b,Fuse:0,ignited:1b,ActiveEffects:[{Id:14b,Amplifier:1b,Duration:1}]}

execute as @a[scores={knvElemental=14}] at @s as @e[type=minecraft:snowball,distance=2..10,limit=1] run scoreboard players set @s knvElemental 14
execute as @a[scores={knvElemental=14}] run scoreboard players remove @s knvElCooldown 1


# Greater
scoreboard players set @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Stone Pearl\"]"}}}}] knvElemental 15
scoreboard players set @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Stone Pearl\"]"}}}]}] knvElemental 15
execute as @a[scores={knvElemental=15}] run effect give @s minecraft:strength 1

execute as @e[type=minecraft:armor_stand,tag=StoneNoHit2] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:armor_stand,tag=StoneHit2] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:snowball,scores={knvElemental=15}] at @s positioned as @s run kill @e[tag=StoneNoHit2,distance=..3]
execute as @e[type=minecraft:snowball,scores={knvElemental=15}] at @s positioned ~ ~2 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["StoneNoHit2"]}

execute as @e[type=minecraft:armor_stand,tag=StoneNoHit2,scores={knvElemental=1}] at @s run tag @s add StoneHit2
execute as @e[type=minecraft:armor_stand,tag=StoneNoHit2,scores={knvElemental=1}] at @s run tag @s remove StoneNoHit2
execute as @e[type=minecraft:armor_stand,tag=StoneHit2,scores={knvElemental=2}] at @s run kill @s

execute as @e[type=minecraft:armor_stand,tag=StoneHit2] at @s positioned ~ ~-2 ~ run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:glass replace minecraft:sand
execute as @e[type=minecraft:armor_stand,tag=StoneHit2] at @s positioned ~ ~-2 ~ run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:sand replace minecraft:gravel
execute as @e[type=minecraft:armor_stand,tag=StoneHit2] at @s positioned ~ ~-2 ~ run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:gravel replace minecraft:cobblestone
execute as @e[type=minecraft:armor_stand,tag=StoneHit2] at @s positioned ~ ~-2 ~ run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:lava replace minecraft:magma_block
execute as @e[type=minecraft:armor_stand,tag=StoneHit2] at @s positioned ~ ~-2 ~ run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:magma_block replace minecraft:stone
execute as @e[type=minecraft:armor_stand,tag=StoneHit2] at @s positioned ~ ~-2 ~ run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 minecraft:bedrock replace minecraft:obsidian
execute as @e[type=minecraft:armor_stand,tag=StoneHit2] at @s positioned ~ ~-2 ~ run playsound minecraft:block.end_gateway.spawn ambient @a ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=StoneHit2] at @s positioned ~ ~-2 ~ run particle minecraft:cloud ~ ~ ~ 1 1 1 0.1 20 normal

execute as @a[scores={knvElemental=15}] at @s as @e[type=minecraft:snowball,distance=2..10,limit=1] run scoreboard players set @s knvElemental 15
execute as @a[scores={knvElemental=15}] run scoreboard players remove @s knvElCooldown 1

# Ultimate
scoreboard players set @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Stone Pearl\"]"}}}}] knvElemental 16
scoreboard players set @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Stone Pearl\"]"}}}]}] knvElemental 16
execute as @a[scores={knvElemental=16}] run effect give @s minecraft:strength 1

execute as @e[type=minecraft:armor_stand,tag=StoneNoHit3] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:armor_stand,tag=StoneHit3] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:snowball,scores={knvElemental=16}] at @s positioned as @s run kill @e[tag=StoneNoHit3,distance=..3]
execute as @e[type=minecraft:snowball,scores={knvElemental=16}] at @s positioned ~ ~2 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["StoneNoHit3"]}

execute as @e[type=minecraft:armor_stand,tag=StoneNoHit3,scores={knvElemental=1}] at @s run tag @s add StoneHit3
execute as @e[type=minecraft:armor_stand,tag=StoneNoHit3,scores={knvElemental=1}] at @s run tag @s remove StoneNoHit3
execute as @e[type=minecraft:armor_stand,tag=StoneHit3,scores={knvElemental=2}] at @s run kill @s
execute as @e[type=minecraft:armor_stand,tag=StoneHit3] at @s positioned ~ ~-2 ~ run summon creeper ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,NoAI:1b,powered:1b,ExplosionRadius:16b,Fuse:100,ignited:1b,Tags:["GravityBomb"],ActiveEffects:[{Id:2b,Amplifier:3b,Duration:110},{Id:4b,Amplifier:3b,Duration:110},{Id:14b,Amplifier:1b,Duration:110},{Id:18b,Amplifier:3b,Duration:110},{Id:20b,Amplifier:2b,Duration:110}]}
execute as @e[type=minecraft:creeper,tag=GravityBomb] at @s positioned ~ ~ ~ run particle minecraft:crit ~ ~ ~ 0 1 0 0.2 20 normal
execute as @e[type=minecraft:creeper,tag=GravityBomb] at @s positioned ~ ~ ~ run particle minecraft:flame ~ ~ ~ 0 1 0 0.2 20 normal
execute as @e[type=minecraft:creeper,tag=GravityBomb] at @s run kill @e[type=minecraft:snowball,scores={knvElemental=16}]
execute as @e[type=minecraft:creeper,tag=GravityBomb] at @s run kill @e[type=minecraft:armor_stand,tag=StoneNoHit3]
execute as @e[type=minecraft:creeper,tag=GravityBomb] at @s run kill @e[type=minecraft:armor_stand,tag=StoneHit3]

execute as @a[scores={knvElemental=16}] at @s as @e[type=minecraft:snowball,distance=2..10,limit=1] run scoreboard players set @s knvElemental 16
execute as @a[scores={knvElemental=16}] run scoreboard players remove @s knvElCooldown 1


# DEBUG: Give Stone Pearls for testing
# /give @p minecraft:snowball{display:{Name:"[\"Stone Pearl\"]",Lore:["{\"text\":\"A stone pearl solid to the touch.\"}","{\"text\":\"Throw to create a minor explosion on impact.\"}"]},CustomModelData:10} 16
# /give @p minecraft:snowball{display:{Name:"[\"Greater Stone Pearl\"]",Lore:["{\"text\":\"A stone pearl vibrating and humming.\"}","{\"text\":\"Throw to produce gravitational waves, affecting surrouding blocks.\"}"]},CustomModelData:11} 16
# /give @p minecraft:snowball{display:{Name:"[\"Ultimate Stone Pearl\"]",Lore:["{\"text\":\"A massive stone pearl that is both heavy and weightless.\"}","{\"text\":\"Throw to create an explosive earthquake!\"}"]},CustomModelData:12} 16
#########################################################################
