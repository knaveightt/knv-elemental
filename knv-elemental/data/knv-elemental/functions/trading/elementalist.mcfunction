# Elementalist Villager
# - Place an Elemental Totem (crafted in combinator) near a Cleric
# - Cleric is transformed into an Elementalist
# - Work in progress
#################################################################

# Totem Use: Create Elementalist Villager from Cleric #
# Pre-Setup
execute as @e[tag=knvTotemElemental] at @s run tag @e[type=minecraft:villager,nbt={VillagerData:{profession:"minecraft:cleric"}},distance=..5,limit=1] add knvVillagerToElemental
execute as @e[tag=knvVillagerToElemental] at @s run kill @e[tag=knvTotemElemental,distance=..7]
execute as @e[tag=knvVillagerToElemental] at @s run particle minecraft:totem_of_undying ~ ~ ~ 1 3 1 0.5 40
execute as @e[tag=knvVillagerToElemental] at @s run particle minecraft:effect ~ ~ ~ 1 3 1 0.5 40
execute as @e[tag=knvVillagerToElemental] at @s run playsound minecraft:entity.lightning_bolt.thunder ambient @a ~ ~ ~

# Brewing Stand (for restock) and Villager Creation
#execute as @e[tag=knvVillagerToElemental] at @s run setblock ~ ~ ~ minecraft:brewing_stand replace # custom villager needs to be next to restock block when summoned
#execute as @e[tag=knvVillagerToElemental] at @s run summon minecraft:villager ~ ~1 ~ {CustomNameVisible:1b,CustomName:"{\"text\":\"Elementalist\"}",VillagerData:{level:1,profession:"minecraft:cleric",type:"minecraft:taiga"},Offers:{Recipes:[{rewardExp:1b,buy:{id:"minecraft:prismarine_shard",Count:12b},buyB:{id:"minecraft:magma_cream",Count:1b},sell:{id:"minecraft:prismarine_shard",Count:8b,tag:{display:{Name:"{\"text\":\"Elemental Chaos Shard\",\"color\":\"light_purple\"}",Lore:["{\"text\":\"Charged with pure chaotic power.\"}"]},CustomModelData:1}}},{rewardExp:1b,buy:{id:"minecraft:prismarine_shard",Count:12b},buyB:{id:"minecraft:ender_eye",Count:1b},sell:{id:"minecraft:prismarine_shard",Count:8b,tag:{display:{Name:"{\"text\":\"Elemental Balance Shard\",\"color\":\"dark_aqua\"}",Lore:["{\"text\":\"Charged with the perfect balance of power.\"}"]},CustomModelData:2}}}]}}

# CleanUp and Removal of Cleric
execute as @e[tag=knvVillagerToElemental] at @s run tp ~ -2 ~
execute as @e[tag=knvVillagerToElemental] at @s run kill @s