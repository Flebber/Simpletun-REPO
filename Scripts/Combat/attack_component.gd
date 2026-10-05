extends Node
class_name AttackComponent

@export var colllision_check : CollisionCheck
@export var damage: Damage

@export var animation_player: AnimationPlayer
@export var collision_shape_2d: CollisionShape2D

@export var combatData : CombatData



var parent : CharacterBody2D 

signal attackGo(dir : )

# Parent sends signal to atk, determines direction of attack, plays animation, checks if there is a area colliding, deals damage, 
# This will be fully modular, Not primarily input managed, Just signals


func setup():
	parent = get_parent()
	
	colllision_check.setup() 
	damage.setup()
	
	print(parent, " equipped with ", combatData.atkShape, " shape and is a ", combatData.atkType)
	print(parent, "test int = ", combatData.test_int)


func attackStart():
	print(parent, " is attacking using ", combatData.atkType)
