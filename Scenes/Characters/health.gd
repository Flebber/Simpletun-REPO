class_name Health extends Node

@onready var parent : Player = get_parent()

@export var current_health : float = 10

var is_dead : bool = false

signal dead

func _physics_process(delta: float) -> void:
	if !is_dead:
		parent.label.text = str(current_health)
	die_check()
	


func die_check():
	if current_health <= 0 and !is_dead:
		is_dead = true
		parent.label.text = "Dead"
		dead.emit()
		return true

func heal(amount):
	current_health += amount 
