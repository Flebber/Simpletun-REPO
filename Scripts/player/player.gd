extends CharacterBody2D

#region Components -> Variables

@onready var movement : Movement = %Movement
@onready var input_manager : InputManager = %InputManager
@onready var animation_manager : AnimationManager = %AnimationManager

@onready var sprite : Sprite2D = %Sprite
@onready var animation_player : AnimationPlayer = %AnimationPlayer
#endregion

@onready var sprite_texture : Texture2D = load("res://assets/sprites/Characters/Player/pud_spritesheet.png")

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
