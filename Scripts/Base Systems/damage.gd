class_name Damage extends Node

@onready var parent : Area2D = get_parent()

# Independant Collision Component 
@export var collision_check : CollisionCheck 

# Modular Damage Amount
@export var amount : float = 0.0

# Failsafes and Signal Connects
func setup() -> void:
	if collision_check == null:
		print("no collision_check for damage.gd")
		return

	collision_check.collided.connect(deal_damage)

# Deal (amount) damage to the CharacterBody that Collided {Connected to collision_check.collided}
func deal_damage(body : CharacterBody2D):
	print(parent, " dealing ", amount, " damage to ", body.name)
	body.health.current_health -= amount
	
