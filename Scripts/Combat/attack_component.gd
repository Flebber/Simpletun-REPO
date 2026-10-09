extends Node
class_name AttackComponent

@export var colllision_check : CollisionCheck
@export var damage: Damage

@export var animation_player: AnimationPlayer
@export var collision_shape_2d: CollisionShape2D
@export var hurt_box: Area2D

@export var combatData : CombatData

# Parent = Entity that has this combat compoennt
var parent  

@export var initialPos : Vector2
var dir : Vector2

signal attackGo(dir : Vector2)	# Signal which will emit when the parent wants to attack, takes the direction of the attack as a Vector2


# Parent sends signal to atk, determines direction of attack, plays animation, checks if there is a area colliding, deals damage, 
# This will be fully modular, Not primarily input managed, Just signals

# Setup Components and Parent gets assigned 
func setup():
	parent = get_parent()
	
	colllision_check.setup() 
	damage.setup()
	
	print(parent, " equipped with ", combatData.atkShape, " shape and is a ", combatData.atkType)
	print(parent, "test int = ", combatData.test_int)
	
	attackGo.connect(attackStart)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("atk_right"):
		print("atk right")
		attackGo.emit(Vector2(1, 0))

	if event.is_action_pressed("atk_left"):
		print("atk left")
		attackGo.emit(Vector2(-1, 0))

# Attack signal gets emitted, now attack (using a local inpput whilst testing)
func attackStart(dir):
	# Temp offset 
	hurt_box.position = parent.position + (initialPos * dir)
	
	# Input starts attack whilst testing the system
	print(parent, " is attacking using ", combatData.atkType, " in the dir: ", dir)
	
	# Collision Check 1 time (debug with print)
	print(colllision_check.externalBody)
	
	# Damage Applied
	
	# Attack Ends
	# Animation Plays
	# Attack Ends
