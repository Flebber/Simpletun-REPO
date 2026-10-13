extends Node
class_name CombatDamage

var parent : AttackComponent

# Independant Collision Component 
@export var collision_check : CollisionCheck 
var combatData : CombatData

# Modular Damage Amount
@export var amount : float = 0.0

func setup():
	parent = get_parent()
	combatData = parent.combatData

	print("combatdmg test: ", combatData.test_int)

func damage_targets(victims : Array):
	victims = parent.targets
	print("can damage", victims)
