class_name Movement extends Node2D

@onready var player : CharacterBody2D = get_parent()
@onready var glide_check : RayCast2D = %GlideCheck

var input_manager : InputManager

@export var speed:= 200
@export var gravity := 800

func setup():
	#Assign Signals and Failsafes
	if input_manager == null:
		print("no input_manager for movement")
		return
	input_manager.jump_pressed.connect(_is_jump_pressed)

#region Movement

func _physics_process(delta: float):
	#Assign the Inputted Direction
	var xdir = input_manager.get_move_vector()
	
	#Gravity
	if not player.is_on_floor():
		player.velocity.y += gravity * delta


	
	#Horizontal Movement
	player.velocity.x = xdir * speed 
	player.move_and_slide()
	
	glide()
	


#Jump
func _is_jump_pressed():
	player.velocity.y = -300

#Glide
func glide():
	if glide_check.is_colliding() ==  false and Input.is_action_pressed("jump"):
		player.velocity.y *= 0.95
		
	
		

#endregion
