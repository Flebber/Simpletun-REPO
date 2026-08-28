class_name Player extends CharacterBody2D

#region Components -> Variables

# Base Components
@export var movement : Movement 
@export var input_manager : InputManager 
@export var health : Health


# Visual Components/Nodes
@export var animation_manager : PlayerAnimationManager 
@export var animation_player : AnimationPlayer 
@onready var label: Label = $Label
@export var sprite : Sprite2D 
@onready var sprite_texture : Texture2D = load("uid://c48qsfsytjvkm")

#endregion

func _ready() -> void:
	#region Assign Child Components -> Component
	#Movement.gd
	movement.input_manager = input_manager
	movement.health = health
	
	
	#Animation_manager.gd
	animation_manager.input_manager  = input_manager
	animation_manager.anim = animation_player 
	
	#endregion
	
	# Call component.setup() when player is ready (Minimizes Component/Signal Assignment Errors)
	movement.setup()
	animation_manager.setup()
	
	
	# Set Players' sprite to sprite_texture ( Allows for easy change )
	sprite.texture = sprite_texture
