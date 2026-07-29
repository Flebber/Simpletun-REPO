extends Area2D

@export var collision_check : CollisionCheck

@export var poster: Sprite2D
@export var interact_component: InteractComponent
@export var spriteFrame: int

func _ready() -> void:

	interact_component.collision_check = collision_check

	collision_check.setup()
	interact_component.setup()
	poster.frame = spriteFrame



# Plan: Board and image stays the same per level but the Frame of the poster changes, When near interact with the board to zoom the poster.
