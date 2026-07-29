extends Area2D

@export var collision_check : CollisionCheck

@export var poster: Sprite2D
@export var interact_node: InteractNode

func _ready() -> void:

	collision_check.setup()
	#interact_node.setup()



# Plan: Board and image stays the same per level but the Frame of the poster changes, When near interact with the board to zoom the poster.
