# Pearl Combinator
# - Allows crafting recipes related to elemental pearls
# - Work in progress
#################################################################

# Clean Up Combinator if destroyed
execute as @e[tag=knvCombinator] at @s if block ~ ~1 ~ minecraft:air run kill @s

#################
# Pearl Recipes #
#################

# =============== Fire Pearls =============== #
# Standard
execute as @e[tag=knvCombinator] at @s if block ~ ~1 ~ minecraft:dropper{Items:[{Slot:0b,id:"minecraft:lapis_lazuli",Count:1b},{Slot:1b,id:"minecraft:fire_charge",Count:1b},{Slot:2b,id:"minecraft:lapis_lazuli",Count:1b},{Slot:3b,id:"minecraft:fire_charge",Count:1b},{Slot:4b,id:"minecraft:ender_pearl",Count:8b},{Slot:5b,id:"minecraft:fire_charge",Count:1b},{Slot:6b,id:"minecraft:lapis_lazuli",Count:1b},{Slot:7b,id:"minecraft:fire_charge",Count:1b},{Slot:8b,id:"minecraft:lapis_lazuli",Count:1b}]} run data merge block ~ ~1 ~ {Items:[{Slot:4b,id:"minecraft:snowball",Count:8b,tag:{display:{Name:"[\"Fire Pearl\"]",Lore:["{\"text\":\"A fire pearl.\"}","{\"text\":\"Throw to summon flames.\"}"]},CustomModelData:1}}],CustomName:"{\"text\":\"Pearl Combinator\"}"}


# =============== Air Pearls =============== #
# Standard
execute as @e[tag=knvCombinator] at @s if block ~ ~1 ~ minecraft:dropper{Items:[{Slot:0b,id:"minecraft:lapis_lazuli",Count:1b},{Slot:1b,id:"minecraft:feather",Count:1b},{Slot:2b,id:"minecraft:lapis_lazuli",Count:1b},{Slot:3b,id:"minecraft:feather",Count:1b},{Slot:4b,id:"minecraft:ender_pearl",Count:8b},{Slot:5b,id:"minecraft:feather",Count:1b},{Slot:6b,id:"minecraft:lapis_lazuli",Count:1b},{Slot:7b,id:"minecraft:feather",Count:1b},{Slot:8b,id:"minecraft:lapis_lazuli",Count:1b}]} run data merge block ~ ~1 ~ {Items:[{Slot:4b,id:"minecraft:snowball",Count:8b,tag:{display:{Name:"[\"Air Pearl\"]",Lore:["{\"text\":\"An air pearl swirling with chaotic engergy.\"}","{\"text\":\"Throw to summon a powerful lightning bolt.\"}"]},CustomModelData:4}}],CustomName:"{\"text\":\"Pearl Combinator\"}"}


# =============== Ice Pearls =============== #
# Standard
execute as @e[tag=knvCombinator] at @s if block ~ ~1 ~ minecraft:dropper{Items:[{Slot:0b,id:"minecraft:lapis_lazuli",Count:1b},{Slot:1b,id:"minecraft:ice",Count:1b},{Slot:2b,id:"minecraft:lapis_lazuli",Count:1b},{Slot:3b,id:"minecraft:ice",Count:1b},{Slot:4b,id:"minecraft:ender_pearl",Count:8b},{Slot:5b,id:"minecraft:ice",Count:1b},{Slot:6b,id:"minecraft:lapis_lazuli",Count:1b},{Slot:7b,id:"minecraft:ice",Count:1b},{Slot:8b,id:"minecraft:lapis_lazuli",Count:1b}]} run data merge block ~ ~1 ~ {Items:[{Slot:4b,id:"minecraft:snowball",Count:8b,tag:{display:{Name:"[\"Ice Pearl\"]",Lore:["{\"text\":\"An ice pearl cold to the touch.\"}","{\"text\":\"Throw to summon a cage of solid ice.\"}"]},CustomModelData:7}}],CustomName:"{\"text\":\"Pearl Combinator\"}"}


# =============== Stone Pearls =============== #
# Standard
execute as @e[tag=knvCombinator] at @s if block ~ ~1 ~ minecraft:dropper{Items:[{Slot:0b,id:"minecraft:lapis_lazuli",Count:1b},{Slot:1b,id:"minecraft:stone",Count:1b},{Slot:2b,id:"minecraft:lapis_lazuli",Count:1b},{Slot:3b,id:"minecraft:stone",Count:1b},{Slot:4b,id:"minecraft:ender_pearl",Count:8b},{Slot:5b,id:"minecraft:stone",Count:1b},{Slot:6b,id:"minecraft:lapis_lazuli",Count:1b},{Slot:7b,id:"minecraft:stone",Count:1b},{Slot:8b,id:"minecraft:lapis_lazuli",Count:1b}]} run data merge block ~ ~1 ~ {Items:[{Slot:4b,id:"minecraft:snowball",Count:8b,tag:{display:{Name:"[\"Stone Pearl\"]",Lore:["{\"text\":\"A stone pearl solid to the touch.\"}","{\"text\":\"Throw to create a minor explosion on impact.\"}"]},CustomModelData:10}}],CustomName:"{\"text\":\"Pearl Combinator\"}"}


##########################
# Elemental Totem Recipe #
##########################
execute as @e[tag=knvCombinator] at @s if block ~ ~1 ~ minecraft:dropper{Items:[{Slot:1b,id:"minecraft:snowball",Count:1b,tag:{display:{Name:"[\"Fire Pearl\"]"}}},{Slot:3b,id:"minecraft:snowball",Count:1b,tag:{display:{Name:"[\"Air Pearl\"]"}}},{Slot:4b,id:"minecraft:armor_stand",Count:1b},{Slot:5b,id:"minecraft:snowball",Count:1b,tag:{display:{Name:"[\"Ice Pearl\"]"}}},{Slot:7b,id:"minecraft:snowball",Count:1b,tag:{display:{Name:"[\"Stone Pearl\"]"}}}]} run data merge block ~ ~1 ~ {Items:[{Slot:4b,id:"minecraft:armor_stand",Count:1b,tag:{display:{Name:"[\"Elemental Totem\"]",Lore:["{\"text\":\"Requires clerical sacrifice...\"}"]},Enchantments:[{id:"minecraft:power",lvl:1s}]},EntityTag:{Tags:["knvTotemElemental"]}}]}
