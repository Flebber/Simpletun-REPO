class_name Player extends CharacterBody2D

#region Components -> Variables

@export var movement : Movement 
@export var input_manager : InputManager 
@export var animation_manager : AnimationManager 

@export var sprite : Sprite2D 
@export var animation_player : AnimationPlayer 

@export var health : Health
@onready var label: Label = $Label
@export var text_edit: TextEdit
@export var secret_sprite: Sprite2D


#endregion

@onready var sprite_texture : Texture2D = load("res://assets/sprites/Characters/Player/pud_spritesheet.png")
@onready var secret_happy_texture : Texture2D = load("res://assets/sprites/Secret/smile laptop.png")
@onready var secret_sad_texture : Texture2D = load("res://assets/sprites/Secret/sad laptop.png")

func _ready() -> void:
#region Assign Component -> Component
	movement.input_manager = input_manager
	
	animation_manager.input_manager  = input_manager
	animation_manager.anim = animation_player 
	
	
#endregion
	
	#Call setup() on player ready (Minimizes Component/Signal Assignment Errors)
	movement.setup()
	animation_manager.setup()
	
	#Load 
	sprite.texture = sprite_texture
	
func _physics_process(delta: float) -> void:
	if text_edit.text == "happy":
		secret_sprite.visible = true
		secret_sprite.texture = secret_happy_texture
	if text_edit.text == "sad":
		secret_sprite.visible = true
		secret_sprite.texture = secret_sad_texture

	
