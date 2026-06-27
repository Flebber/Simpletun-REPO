class_name Movement extends Node2D

@onready var player : CharacterBody2D = get_parent()

# Raycast that checks if player >=300px off floor
@export var glide_check : RayCast2D

# Empty variables for Parent to assign
var input_manager : InputManager

# Changeable Movement Properties
@export var speed : float = 200
@export var gravity : float = 550.0
@export var glide_strength : float = 0.95
@export var jump_strength : float = -350.0

# Failsafes and Signals
func setup():
	if input_manager == null:
		print("no input_manager for movement")
		return
	input_manager.jump_pressed.connect(_is_jump_pressed)

#region Movement

func _physics_process(delta: float):
	# Assign the Inputted Direction from input_manager
	var xdir = input_manager.get_move_vector()
	
	# Horizontal Movement
	player.velocity.x = xdir * speed 
	player.move_and_slide()
	
	# Apply Gravity
	if not player.is_on_floor():
		player.velocity.y += gravity * delta
	
	glide()

# Jump {Connected to input_manager.jump_pressed} 
func _is_jump_pressed():
	player.velocity.y = jump_strength

# Glide System
func glide():
	if glide_check.is_colliding() ==  false and Input.is_action_pressed("jump"):
		player.velocity.y *= glide_strength

#endregion
