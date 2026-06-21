class_name Health extends Node

@onready var parent = get_parent()

var damage : Damage

@export var current_health : float = 10

signal dead

func die():
	if current_health <= 0:
		dead.emit()

func heal(amount):
	current_health += amount 
