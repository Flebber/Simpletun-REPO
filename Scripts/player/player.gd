class_name Player extends CharacterBody2D

#region Easter Egg for Baba
# Node Assignment
@onready var label: Label = $Label
@onready var text_edit: TextEdit = %TextEdit
@onready var secret_sprite: Sprite2D = %SecretSprite

# Load Images
@onready var secret_happy_texture : Texture2D = load("res://assets/sprites/Secret/smile laptop.png")
@onready var secret_sad_texture : Texture2D = load("res://assets/sprites/Secret/sad laptop.png")
#endregion

#region Components -> Variables

# Base Systems
@export var movement : Movement 
@export var input_manager : InputManager 
@export var health : Health

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
	
	#Animation_manager.gd
	animation_manager.input_manager  = input_manager
	animation_manager.anim = animation_player 
	
	#endregion
	
	# Call component.setup() when player is ready (Minimizes Component/Signal Assignment Errors)
	movement.setup()
	animation_manager.setup()
	
	# Set Players' sprite to sprite_texture ( Allows for easy change )
	sprite.texture = sprite_texture
	
func _physics_process(_delta: float) -> void:
	# Easter Egg For Baba
	if text_edit.text == "happy":
		secret_sprite.visible = true
		secret_sprite.texture = secret_happy_texture
	if text_edit.text == "sad":
		secret_sprite.visible = true
		secret_sprite.texture = secret_sad_texture
