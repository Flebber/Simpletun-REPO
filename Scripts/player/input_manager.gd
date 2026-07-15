class_name InputManager extends Node2D

# Assigns Parent
@onready var player = get_parent()

signal jump_pressed

# Returns the inputted direction from Player
func get_move_vector() -> float:
	var move_x = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")
	return move_x

# Jump Signal Emitter
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and player.is_on_floor():
		jump_pressed.emit()
