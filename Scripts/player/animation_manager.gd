class_name PlayerAnimationManager extends Node

@onready var player : Player = get_parent()

# Component Variables (Parent Assigns Them or @export )
var input_manager : InputManager
var anim : AnimationPlayer
@export var health : Health
@export var glide_check: RayCast2D

# Flagging variable
var is_player_dead : bool = false

# Failsafes and Signal Connects
func setup():
	if input_manager == null:
			print("no input_manager for animation player")
			return
	if anim == null:
			print("no animation player for animation manager")
			return
	if health == null:
		print("no health for animation manager")
		return
		
	GameManager.player_dead.connect(dead_animation)

func _process(_delta: float) -> void:
	# Death Flag
	if is_player_dead:
		return
	
	movement_animation()

# Walk, Idle, Jump, Glide Animations
func movement_animation():
	if is_player_dead:
		return
	var xdir = input_manager.get_move_vector()
	
	# Walk Left
	if xdir == -1 and anim.current_animation != "Player/jump":
		anim.current_animation = "Player/walk_left"
			
	# Walk Right
	elif xdir == 1 and anim.current_animation != "Player/jump":
		anim.current_animation = "Player/walk_right"
			
	# Idle Animation
	elif anim.current_animation != "Player/jump":
		anim.current_animation = "Player/idle"
			
	# Jump Animation (Play Glide Anim if held and !onfloor)
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		anim.current_animation = "Player/jump"
		
	elif Input.is_action_pressed("glide") and not player.is_on_floor():
		anim.current_animation = "Player/jump"
		
		if glide_check.is_colliding() and not player.is_on_floor():
			anim.stop()

# Death Animation and Set Flags {Connected to player_dead}
func dead_animation():
	is_player_dead = true
	anim.current_animation = "Player/dead"
