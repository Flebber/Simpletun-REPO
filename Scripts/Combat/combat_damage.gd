extends Node
class_name CombatDamage

var parent : AttackComponent

# Independant Collision Component 
@export var collision_check : CollisionCheck 

var combatData : CombatData

# Modular Damage Amount
var amount : float

func setup():
	# Assign when parent is ready for 0 errors
	parent = get_parent()
	combatData = parent.combatData

	print("combatdmg test: ", combatData.test_int)

func damage_targets(victims : Array):
	# Assign the valid targets array the Attack Component made
	victims = parent.targets

	for target in victims:
		var targethealth : Health = target.health
		targethealth.current_health -= amount
