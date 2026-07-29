class_name CollisionCheck extends Node

@onready var parent : Area2D = get_parent()

# Makes the parent area.2d body_entered signal accsessible to any script
signal collided(body : Node)

# Makes the parent area.2d body_exited signal accsessible to any script
signal body_exited(body : Node)

# Connect parents' area.2d body_entered signal
func setup() -> void:
	parent.body_entered.connect(collision_detect)
	parent.body_exited.connect(body_exit)

# Emits accessible collided signal which also returns the body that entered {Connected to parent.body_entered}
func collision_detect(body : Node):
		collided.emit(body)
		

func body_exit(body: Node):
	body_exited.emit(body)
