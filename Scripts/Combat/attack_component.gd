extends Node
class_name AttackComponent

@export var colllision_check : CollisionCheck
@export var damage: Damage

@export var animation_player: AnimationPlayer
@export var collision_shape_2d: CollisionShape2D

@export var combatData : CombatData

# Parent = Entity that has this combat compoennt
var parent : CharacterBody2D 


var atkDir : float
signal attackGo(dir : float)	# Signal which will emit when the parent wants to attack, takes the direction of the attack as a float (-1 = left...)


# Parent sends signal to atk, determines direction of attack, plays animation, checks if there is a area colliding, deals damage, 
# This will be fully modular, Not primarily input managed, Just signals

# Setup Components and Parent gets assigned 
func setup():
	parent = get_parent()
	
	colllision_check.setup() 
	damage.setup()
	
	print(parent, " equipped with ", combatData.atkShape, " shape and is a ", combatData.atkType)
	print(parent, "test int = ", combatData.test_int)

# Attack signal gets emitted, now attack (using a local inpput whilst testing)
func attackStart():
	# Input starts attack whilst testing the system
	# Collision Check 1 time (debug with print)
	# Damage Applied
	# Attack Ends
	# Animation Plays
	# Attack Ends
	print(parent, " is attacking using ", combatData.atkType, " in the dir: ", atkDir)
