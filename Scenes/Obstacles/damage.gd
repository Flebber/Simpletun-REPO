class_name Damage extends Node

@onready var parent : Area2D = get_parent()

@export var collision_check : CollisionCheck 

@export var amount : float = 0.0


func setup() -> void:
	if collision_check == null:
		print("no collision_check for damage.gd")
		return
	collision_check.collided.connect(deal_damage)

func deal_damage(body : CharacterBody2D):
	print(parent, " dealing ", amount, " damage to ", body.name)
	body.health.current_health -= amount
	
