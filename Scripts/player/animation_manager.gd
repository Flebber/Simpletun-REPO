class_name AnimationManager extends Node

@onready var player : Player = get_parent()

var input_manager : InputManager
var anim : AnimationPlayer
@export var health : Health

var previous_anim : String = ""
var is_dead : bool = false


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
		
	health.dead.connect(dead_animation)

func _process(delta: float) -> void:
	if is_dead:
		return
	walk_animation()
	


func walk_animation():
	if is_dead:
		return
	var xdir = input_manager.get_move_vector()
	
	#Walk Left
	if xdir == -1 and anim.current_animation != "Player/jump":
		anim.current_animation = "Player/walk_left"
			
	#Walk Right
	elif xdir == 1 and anim.current_animation != "Player/jump":
		anim.current_animation = "Player/walk_right"
			
	#Idle Animation
	elif anim.current_animation != "Player/jump":
		anim.current_animation = "Player/idle"
			
	#Jump Animation (Flappy if held)
	if Input.is_action_pressed("jump") and not player.is_on_floor():
		anim.current_animation = "Player/jump"
		if player.is_on_floor():
			anim.stop()

func dead_animation():
	is_dead = true
	print("im dead")
	anim.current_animation = "Player/dead"
