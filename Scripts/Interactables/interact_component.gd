class_name InteractComponent extends Control

@onready var parent : Area2D = get_parent()
var collision_check : CollisionCheck

const PROMPT = preload("uid://dweg3gd21eops")
var prompt_instance : Prompt 
@export var PromptText : String


var interactable : bool = false
signal interact_pressed

func setup():
	if parent == null:
		print("No Parent for Interact")
		return
	
	if collision_check == null:
		print("No CollisionCheck for Interact")
		return
		
	collision_check.collided.connect(interact_available)
	collision_check.body_exited.connect(interact_disable)

# If Player is near Display Interact Prompt and Allow Interact to be pressed {Connected to collision_check.collided}
func interact_available(_body):
	interactable = true
	print("Interact is Available")
	create_prompt()


# If interact is available And Interact is presssed
func _input(event: InputEvent) -> void:
	if not interactable:
		return
	
	if event.is_action_pressed("interact"):
		print("interacted")
		interact_pressed.emit()


# If Body exited the parent
func interact_disable(_body):
	interactable = false
	print("Interact is not Available")
	
	if prompt_instance:
		prompt_instance.queue_free()
		prompt_instance = null


# Instantiate the Prompt with a Custom Label
func create_prompt():
	if prompt_instance:
		return
	
	prompt_instance = PROMPT.instantiate()
	prompt_instance.label.text = PromptText
	prompt_instance.position = position
	#prompt_instance.position.y = position.y
	add_child(prompt_instance)
	
