class_name CollisionCheck extends Node

@onready var parent : Area2D = get_parent()

signal collided(body : Node)

func setup() -> void:
	parent.body_entered.connect(collision_detect)

func collision_detect(body : Node):
		collided.emit(body)

		
