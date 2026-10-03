extends Node
class_name AttackComponent

@export var combatData : CombatData

var parent = get_parent()
var combat_parent 

var collision_check : CollisionCheck


# Parent sends signal to atk, plays animation, sets direction of attack, checks if there is a area colliding, deals damage, 


func setup():
	combat_parent = parent.get_parent()
	

func attackStart():
	print(combat_parent, " is attacking using ", parent)
