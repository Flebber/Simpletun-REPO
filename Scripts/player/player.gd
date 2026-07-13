class_name Player extends CharacterBody2D

#region Components -> Variables

# Base Systems
@export var movement : Movement 
@export var input_manager : InputManager 
@export var health : Health
@onready var label: Label = $Label

@onready var death_menu : PackedScene = SceneManagerNode.menu_levels["Death Menu"]



# Visual Systems
@export var animation_manager : PlayerAnimationManager 
@export var animation_player : AnimationPlayer 
@export var sprite : Sprite2D 
@onready var sprite_texture : Texture2D = load("res://assets/sprites/Characters/Player/pud_spritesheet.png")
#endregion

func _ready() -> void:
	#region Assign Component -> Component
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
	
	GameManager.player_dead.connect(death_menu_on)
	
	# Set Players' sprite to sprite_texture ( Allows for easy change )
	sprite.texture = sprite_texture
	

func death_menu_on():
	await get_tree().create_timer(2).timeout
	
	
	var deathmen_instance = death_menu.instantiate()
	add_child(deathmen_instance)
	
