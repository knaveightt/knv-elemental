# Fire Pearls
# - Regular: Throw to create fire where landed
# - Greater: Thows a powerful fireball, hold to gain fire resistance
# - Ultimate: "Firestorm", lots of fireballs are spawned
#
# Note: Greater/Ultimate forms of fire pearls will still grant fire resistance
# Uses knvElemental scores 2-4
#################################################################

# Regular
scoreboard players set @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Fire Pearl\"]"}}}}] knvElemental 2
scoreboard players set @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Fire Pearl\"]"}}}]}] knvElemental 2
execute as @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Fire Pearl\"]"}}}}] run scoreboard players set @s knvElCooldown 3
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Fire Pearl\"]"}}}]}] run scoreboard players set @s knvElCooldown 3

execute as @e[type=minecraft:armor_stand,tag=FireNoHit] run scoreboard players add @s knvElemental 1
execute as @e[type=minecraft:armor_stand,tag=FireHit] run scoreboard players add @s knvElemental 1
# making sure the snowball does not have the SuperIce tag, otherwise the Ultimate Ice pearl sets the generated ice bridges on fire!
execute as @e[type=minecraft:snowball,tag=!SuperIce,scores={knvElemental=2}] at @s positioned as @s run kill @e[tag=FireNoHit,distance=..3]
execute as @e[type=minecraft:snowball,tag=!SuperIce,scores={knvElemental=2}] at @s positioned ~ ~2 ~ run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["FireNoHit"]}

execute as @e[type=minecraft:armor_stand,tag=FireNoHit,scores={knvElemental=1}] at @s run tag @s add FireHit
execute as @e[type=minecraft:armor_stand,tag=FireNoHit,scores={knvElemental=1}] at @s run tag @s remove FireNoHit
execute as @e[type=minecraft:armor_stand,tag=FireHit,scores={knvElemental=2}] at @s run kill @s
execute as @e[type=minecraft:armor_stand,tag=FireHit] at @s positioned ~ ~-2 ~ run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 minecraft:fire keep

execute as @a[scores={knvElemental=2}] at @s as @e[type=minecraft:snowball,distance=2..10,limit=1] run scoreboard players set @s knvElemental 2
execute as @a[scores={knvElemental=2}] run scoreboard players remove @s knvElCooldown 1



# Greater
scoreboard players set @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Fire Pearl\"]"}}}}] knvElemental 3 
scoreboard players set @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Fire Pearl\"]"}}}]}] knvElemental 3
execute as @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Fire Pearl\"]"}}}}] run scoreboard players set @s knvElCooldown 3
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Greater Fire Pearl\"]"}}}]}] run scoreboard players set @s knvElCooldown 3
execute as @a[scores={knvElemental=3}] at @s positioned as @e[type=minecraft:snowball,distance=2..4,limit=1] rotated as @s run summon minecraft:fireball ^ ^ ^2 {Name:"Bullet",ExplosionPower:4,direction:[0.0,0.0,0.0]}
execute as @a[scores={knvElemental=3}] run effect give @s minecraft:fire_resistance 1
execute as @a[scores={knvElemental=3}] run scoreboard players remove @s knvElCooldown 1


# Supercharged
scoreboard players set @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Fire Pearl\"]"}}}}] knvElemental 4
scoreboard players set @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Fire Pearl\"]"}}}]}] knvElemental 4
execute as @a[nbt={SelectedItem:{id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Fire Pearl\"]"}}}}] run scoreboard players set @s knvElCooldown 4
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:snowball",tag:{display:{Name:"[\"Ultimate Fire Pearl\"]"}}}]}] run scoreboard players set @s knvElCooldown 4
execute as @a[scores={knvElemental=4}] run effect give @s minecraft:fire_resistance 1 10
execute as @a[scores={knvElemental=4}] at @s positioned as @e[type=minecraft:snowball,distance=2..4,limit=1] rotated as @s run summon minecraft:fireball ^ ^ ^2 {Name:"FireStorm",ExplosionPower:2,direction:[0.0,0.0,0.0],Tags:["firestorm"]}
scoreboard players add @e[tag=firestorm] knvElemental 1
execute as @e[tag=firestorm,scores={knvElemental=5}] at @s run summon minecraft:fireball ^ ^ ^2 {Name:"BulletFireStorm",ExplosionPower:4,direction:[0.0,-1.0,0.0],Tags:["firestormBullet"]}
execute as @e[tag=firestorm,scores={knvElemental=10}] at @s run summon minecraft:fireball ^ ^ ^2 {Name:"BulletFireStorm",ExplosionPower:4,direction:[0.0,-1.0,0.0],Tags:["firestormBullet"]}
execute as @e[tag=firestorm,scores={knvElemental=15}] at @s run summon minecraft:fireball ^ ^ ^2 {Name:"BulletFireStorm",ExplosionPower:4,direction:[0.0,-1.0,0.0],Tags:["firestormBullet"]}
execute as @e[tag=firestorm,scores={knvElemental=20}] at @s run summon minecraft:fireball ^ ^ ^2 {Name:"BulletFireStorm",ExplosionPower:4,direction:[0.0,-1.0,0.0],Tags:["firestormBullet"]}
execute as @e[tag=firestorm,scores={knvElemental=25}] at @s run summon minecraft:fireball ^ ^ ^2 {Name:"BulletFireStorm",ExplosionPower:4,direction:[0.0,-1.0,0.0],Tags:["firestormBullet"]}
execute as @e[tag=firestorm,scores={knvElemental=30}] at @s run summon minecraft:fireball ^ ^ ^2 {Name:"BulletFireStorm",ExplosionPower:4,direction:[0.0,-1.0,0.0],Tags:["firestormBullet"]}
execute as @e[tag=firestorm,scores={knvElemental=35}] at @s run summon minecraft:fireball ^ ^ ^2 {Name:"BulletFireStorm",ExplosionPower:4,direction:[0.0,-1.0,0.0],Tags:["firestormBullet"]}
execute as @e[tag=firestorm,scores={knvElemental=40}] at @s run summon minecraft:fireball ^ ^ ^2 {Name:"BulletFireStorm",ExplosionPower:4,direction:[0.0,-1.0,0.0],Tags:["firestormBullet"]}
execute as @e[tag=firestorm,scores={knvElemental=45}] at @s run summon minecraft:fireball ^ ^ ^2 {Name:"BulletFireStorm",ExplosionPower:4,direction:[0.0,-1.0,0.0],Tags:["firestormBullet"]}
execute as @e[tag=firestorm,scores={knvElemental=50}] at @s run summon minecraft:fireball ^ ^ ^2 {Name:"BulletFireStorm",ExplosionPower:4,direction:[0.0,-1.0,0.0],Tags:["firestormBullet"]}
execute as @e[tag=firestorm] at @s run particle minecraft:flame ~ ~ ~ ~ ~ ~ 0.1 100
execute as @e[tag=firestorm,scores={knvElemental=50..}] run kill @s
execute as @a[scores={knvElemental=4}] run scoreboard players remove @s knvElCooldown 1


# DEBUG: Give Fire Pearls for testing
# /give @p minecraft:snowball{display:{Name:"[\"Fire Pearl\"]",Lore:["{\"text\":\"A fire pearl.\"}","{\"text\":\"Throw to summon flames.\"}"]},CustomModelData:1} 16
# /give @p minecraft:snowball{display:{Name:"[\"Greater Fire Pearl\"]",Lore:["{\"text\":\"A fire pearl swirling with chaotic engergy.\"}","{\"text\":\"Throw to summon a powerful fireball.\"}"]},CustomModelData:2} 16
# /give @p minecraft:snowball{display:{Name:"[\"Ultimate Fire Pearl\"]",Lore:["{\"text\":\"A violently hot fire pearl.\"}","{\"text\":\"Throw to unleash fiery destruction!\"}"]},CustomModelData:3} 16
#####################################
