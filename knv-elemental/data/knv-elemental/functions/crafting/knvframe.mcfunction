# Energy Frame
# - Allows alteration of select blocks to serve as different functions
# - Place on Dropper {Facing Up} - transforms dropper to pearl combinator for
# crafting elemental pearl recipes 
#
# Note: the energy frame aslo serves as decoration. Place an item in the frame
# to create different patterns of particle effects
# - No item in frame: default "lava" particle effect
# - More to come!
#################################################################

# Creation of Energy Frame via floor crafting
# Throw an item frame, redstone, and quartz on the ground to create
execute as @e[nbt={Item:{id:"minecraft:item_frame"},OnGround:1b},type=item] at @s as @e[nbt={Item:{id:"minecraft:quartz"},OnGround:1b},type=item,distance=..2] positioned as @e[nbt={Item:{id:"minecraft:redstone"},OnGround:1b},type=item,distance=..2] positioned as @s run tag @s add knvCreateFrame
execute as @e[tag=knvCreateFrame] at @s as @e[nbt={Item:{id:"minecraft:redstone"}},type=item,distance=..2] run tag @s add knvDestroy
execute as @e[tag=knvCreateFrame] at @s as @e[nbt={Item:{id:"minecraft:item_frame"}},type=item,distance=..2] run tag @s add knvDestroy
execute as @e[tag=knvDestroy] at @s run kill @s
execute as @e[tag=knvCreateFrame] at @s run particle minecraft:flame ~ ~ ~ 0 1 0 0.5 50 normal
execute as @e[tag=knvCreateFrame] at @s run playsound minecraft:item.shield.land ambient @a ~ ~ ~
execute as @e[tag=knvCreateFrame] at @s run summon minecraft:item ~ ~2 ~ {Item:{id:"minecraft:item_frame",Count:1b,tag:{display:{Name:"{\"text\":\"Energy Frame\",\"color\":\"light_purple\"}",Lore:["{\"text\":\"An item frame transferring energy to blocks.\"}"]},Enchantments:[{id:"minecraft:power",lvl:1s}],EntityTag:{Tags:["knvFrame"]}}}}
execute as @e[tag=knvCreateFrame] at @s run kill @s

# Energy Frame particle effects
execute as @e[tag=knvFrame] at @s run particle minecraft:lava ~ ~ ~ 0 1 0 0.5 1 normal

# Energy Frame creation of Pearl Combinator for crafting
execute as @e[tag=knvFrame] at @s if data entity @s {Facing:1b,Item:{Count:1b,id:"minecraft:ender_pearl"}} if block ~ ~-1 ~ minecraft:dropper[facing=up] run tag @s add knvFrameToCombinator
execute as @e[tag=knvFrameToCombinator] at @s run tag @s remove knvFrame
execute as @e[tag=knvFrameToCombinator] at @s run playsound minecraft:item.shield.land ambient
execute as @e[tag=knvFrameToCombinator] at @s run particle minecraft:cloud ~ ~ ~ 1 1 1 0.1 20 normal
execute as @e[tag=knvFrameToCombinator] at @s run setblock ~ ~-1 ~ minecraft:dropper[facing=down]{CustomName:"{\"text\":\"Pearl Combinator\"}"} replace
execute as @e[tag=knvFrameToCombinator] at @s run summon minecraft:armor_stand ~ ~-2 ~ {NoGravity:1b,Invulnerable:1b,ShowArms:0b,Invisible:1b,DisabledSlots:2039583,PersistenceRequired:1b,Tags:["knvCombinator"],ArmorItems:[{},{},{},{id:"minecraft:chainmail_helmet",Count:1b}]}
execute as @e[tag=knvFrameToCombinator] at @s run kill @s













