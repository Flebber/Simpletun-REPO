extends Area2D

@export var collision_check : CollisionCheck

@export var poster: Sprite2D
@export var interact_component: InteractComponent
@export var animation_player: AnimationPlayer
@export var animation_manager: Node
@export var spriteFrame: int

func _ready() -> void:

	interact_component.collision_check = collision_check
	
	animation_manager.animation_player = animation_player
	animation_manager.interact_component = interact_component
	animation_manager.poster = poster


	collision_check.setup()
	interact_component.setup()
	animation_manager.setup()
	
	poster.frame = spriteFrame

# Plan: Board and image stays the same per level but the Frame of the poster changes, When near interact with the board to zoom the poster.
