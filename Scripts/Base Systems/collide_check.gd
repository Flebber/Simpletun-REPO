class_name CollisionCheck extends Node

@onready var parent : Area2D = get_parent()
var owner_entity : Node

# Makes the parent area.2d body_entered signal accsessible to any script
signal collided(body : Node)

var externalBody
var scannedCollsions : Array[Node] = []

# Makes the parent area.2d body_exited signal accsessible to any script
signal body_exited(body : Node)

# Connect parents' area.2d body_entered signal
func setup() -> void:
	parent.body_entered.connect(collision_detect)
	parent.body_exited.connect(body_exit)

# Emits accessible collided signal which also returns the body that entered {Connected to parent.body_entered}
func collision_detect(body : Node):
	if body is Area2D or body is CharacterBody2D:
		collided.emit(body)

		
	
func body_exit(body: Node):
	if body is Area2D or body is CharacterBody2D:
		body_exited.emit(body)


# Callable which checks all bodys/areas inside of the collsionshape and lists them to an aray
func scanCollision():
	scannedCollsions.clear()
	for area in parent.get_overlapping_areas():
		if isValidTarget(area):
			scannedCollsions.append(area)
	
	for body in parent.get_overlapping_bodies():
		if isValidTarget(body):
			scannedCollsions.append(body)

func isValidTarget(target) -> bool:
	return(
		target != owner_entity
		and target not in scannedCollsions
		and target.get_node_or_null("Health")
	)
