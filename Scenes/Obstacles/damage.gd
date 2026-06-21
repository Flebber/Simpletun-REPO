class_name Damage extends Node

@onready var parent : Area2D = get_parent()

var collision_check : CollisionCheck 
var health : Health

func setup() -> void:
	collision_check.collided.connect(deal_damage)

func deal_damage(body : CharacterBody2D, amount : float):
	print("dealing ", amount, "damage to ", body.name)
	body.health.current_health -= amount
	
