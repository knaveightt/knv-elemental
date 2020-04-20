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
# Note: Villager Trades were created with MCStacker 1.15.2
# When using MCStacker, you must change the name of the elemental pearl to match how the functions are recognizing these special items
# (see Debug lines for each pearl for how the custom name tags are structured
#execute as @e[tag=knvVillagerToElemental] at @s run setblock ~ ~ ~ minecraft:brewing_stand replace # may not need, elementalist may leverage existing cleric's work station
execute as @e[tag=knvVillagerToElemental] at @s run summon minecraft:villager ~ ~ ~ {CustomNameVisible:1b,Tags:["knvElementalist"],CustomName:'{"text":"Elementalist"}',VillagerData:{level:5,profession:"minecraft:cleric",type:"minecraft:taiga"},Offers:{Recipes:[{buy:{id:"minecraft:ender_eye",Count:2b},buyB:{id:"minecraft:prismarine_shard",Count:16b},sell:{id:"minecraft:prismarine_shard",Count:1b,tag:{display:{Name:"[\"Elemental Shard\"]",Lore:['{"text":"Used to craft greater elemental pearls"}']},CustomModelData:1}}},{buy:{id:"minecraft:ender_pearl",Count:4b},buyB:{id:"minecraft:fire_charge",Count:16b},sell:{id:"minecraft:snowball",Count:8b,tag:{display:{Name:"[\"Fire Pearl\"]",Lore:['{"text":"A fire pearl."}','{"text":"Throw to summon flames."}']},CustomModelData:1}}},{buy:{id:"minecraft:ender_pearl",Count:4b},buyB:{id:"minecraft:feather",Count:16b},sell:{id:"minecraft:snowball",Count:8b,tag:{display:{Name:"[\"Air Pearl\"]",Lore:['{"text":"An air pearl swirling with chaotic engergy."}','{"text":"Throw to summon a powerful lightning bolt."}']},CustomModelData:4}}},{buy:{id:"minecraft:ender_pearl",Count:4b},buyB:{id:"minecraft:ice",Count:16b},sell:{id:"minecraft:snowball",Count:8b,tag:{display:{Name:"[\"Ice Pearl\"]",Lore:['{"text":"An ice pearl cold to the touch."}','{"text":"Throw to summon a cage of solid ice."}']},CustomModelData:7}}},{buy:{id:"minecraft:ender_pearl",Count:4b},buyB:{id:"minecraft:stone",Count:16b},sell:{id:"minecraft:snowball",Count:8b,tag:{display:{Name:"[\"Stone Pearl\"]",Lore:['{"text":"A stone pearl solid to the touch."}','{"text":"Throw to create a minor explosion on impact."}']},CustomModelData:10}}}]}}

# CleanUp and Removal of Cleric
execute as @e[tag=knvVillagerToElemental] at @s run tp ~ -2 ~
execute as @e[tag=knvVillagerToElemental] at @s run kill @s