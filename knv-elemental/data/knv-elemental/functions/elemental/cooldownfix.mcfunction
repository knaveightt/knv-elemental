# Cool Down Fix 
# This fix was introduced because in the original implementation, 
# the elemental pearls would only function correctly if the player
# had another elemental in their hand (multiple in a stack). This was
# because Minecraft detected the player as using an elemental pearl only
# if the user had a pearl in their hand, did not work well when they threw
# the last of a pearl because there was no longer an elemental pearl in their
# hand.
#
# What was implemented was a cooldown system. When the player has an elemental
# pearl in their hand they receive a score in knvElemental as before. But they
# also get a cool down score (of 3, the minimum necessary for this to work).
# When they no longer have the same elemental pearl in thier hand, their score
# is not automatically set to 0 for knvElemental, but the cooldown begins
# to go down. In this file, we check to see for each knvElemental score used if
# the cooldown is now 0 (note the cooldown also always resets if they have an elemental
# pearl in their hand). If it goes to 0, we know they no longer have an elemental pearl
# in their hand, so we set knvElemental to 0.
#
# This allows the last pearl to be thrown, but for the player to retain the knvElemental
# score just long enough for Minecraft to know what pearl was thrown. It will subsequently
# be reset to 0 when the cool down runs its course.
# 9/20/2019
###################################################################

# Fire Pearls
execute as @a[scores={knvElemental=2,knvElCooldown=..0}] run scoreboard players set @s knvElemental 0
execute as @a[scores={knvElemental=3,knvElCooldown=..0}] run scoreboard players set @s knvElemental 0
execute as @a[scores={knvElemental=4,knvElCooldown=..0}] run scoreboard players set @s knvElemental 0

# Air Pearls
execute as @a[scores={knvElemental=6,knvElCooldown=..0}] run scoreboard players set @s knvElemental 0
execute as @a[scores={knvElemental=7,knvElCooldown=..0}] run scoreboard players set @s knvElemental 0
execute as @a[scores={knvElemental=8,knvElCooldown=..0}] run scoreboard players set @s knvElemental 0

# Ice Pearls
execute as @a[scores={knvElemental=10,knvElCooldown=..0}] run scoreboard players set @s knvElemental 0
execute as @a[scores={knvElemental=11,knvElCooldown=..0}] run scoreboard players set @s knvElemental 0
execute as @a[scores={knvElemental=12,knvElCooldown=..0}] run scoreboard players set @s knvElemental 0

# Stone Pearls
execute as @a[scores={knvElemental=14,knvElCooldown=..0}] run scoreboard players set @s knvElemental 0
execute as @a[scores={knvElemental=15,knvElCooldown=..0}] run scoreboard players set @s knvElemental 0
execute as @a[scores={knvElemental=16,knvElCooldown=..0}] run scoreboard players set @s knvElemental 0

# New Ender Pearls
execute as @a[scores={knvElemental=18,knvElCooldown=..0}] run scoreboard players set @s knvElemental 0
execute as @a[scores={knvElemental=19,knvElCooldown=..0}] run scoreboard players set @s knvElemental 0

