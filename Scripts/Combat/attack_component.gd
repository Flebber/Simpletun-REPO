extends Node
class_name AttackComponent

@export var owner_entity : Node

@export var colllision_check : CollisionCheck
@export var combat_damage: CombatDamage


@export var animation_player: AnimationPlayer
@export var collision_shape_2d: CollisionShape2D
@export var hurt_box: Area2D

@export var combatData : CombatData

# Parent = Entity that has this combat compoennt
var parent : Node
var targets : Array

var dir : Vector2

signal attackGo(dir : Vector2)	# Signal which will emit when the parent wants to attack, takes the direction of the attack as a Vector2


# Parent sends signal to atk, determines direction of attack, plays animation, checks if there is a area colliding, deals damage, 
# This will be fully modular, Not primarily input managed, Just signals

# Setup Components and Parent gets assigned 
func setup():
	
	parent = get_parent()
	
	colllision_check.setup() 
	combat_damage.setup()
	
	colllision_check.owner_entity = owner_entity
	
	print(parent, " equipped with ", combatData.atkShape, " shape and is a ", combatData.atkType)
	print(parent, "test int = ", combatData.test_int)
	
	attackGo.connect(attackStart)



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("atk_right"):
		attackGo.emit(Vector2(1, 1))

	if event.is_action_pressed("atk_left"):
		attackGo.emit(Vector2(-1, 1))



# Attack signal gets emitted, now attack (using a local inpput whilst testing)
func attackStart(dir):
	# Input starts attack whilst testing the system
	
	# Temp offset 
	hurt_box.position = parent.position + (combatData.initialPos * dir)
	
	# Wait 2 phys frames cus 1 doesnt work for some reason
	await get_tree().physics_frame
	await get_tree().physics_frame
	
	# Collision Check 1 time (debug with print)
	colllision_check.scanCollision()
	targets = colllision_check.scannedCollsions

	# Temp Debug Attack
	for target in targets:
		var targethealth : Health = target.health
		print(target, " health = ", targethealth.current_health)

	# Need to handle !parent inside this script for combat specifcs
	
	print("can damage", targets)
	
	# Damage Applied
	
	# Attack Ends
	# Animation Plays
	# Attack Ends
	
