class_name InteractComponent extends Node

var collision_check : CollisionCheck
var interact_prompt

var interactable : bool = false

signal interact_pressed

func setup():
	collision_check.collided.connect(interact_available)
	collision_check.body_exited.connect(interact_disable)


func _process(_delta: float) -> void:
	interact_activate()

# If Player is near Display Interact Prompt and Allow Interact to be pressed {Connected to collision_check.collided}
func interact_available(_body):
	interactable = true
	print("Interact is Available")
	
	# Display Interact UI
	# If Player Exists Parents Area, Disable Interact Prompt 

func interact_activate():
	if interactable == false:
		return
	
	elif Input.is_action_just_pressed("interact"):
		print("interacted")
		interact_pressed.emit()


func interact_disable(_body):
	interactable = false
	print("Interact is not Available")
	
