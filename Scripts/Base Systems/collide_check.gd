class_name CollisionCheck extends Node

@onready var parent : Area2D = get_parent()

# Makes the parent area.2d body_entered signal accsessible to any script
signal collided(body : Node)

# Connect parents' area.2d body_entered signal
func setup() -> void:
	parent.body_entered.connect(collision_detect)

# Emits accessible collided signal which also returns the body which enters {Connected to parent.body_entered}
func collision_detect(body : Node):
		collided.emit(body)

		
