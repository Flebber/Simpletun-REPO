extends Area2D

@export var collision_check: CollisionCheck
@export var health: Health
@export var sprite_2d: Sprite2D
@export var animation_player: AnimationPlayer

func _ready() -> void:
	collision_check.setup()
	
