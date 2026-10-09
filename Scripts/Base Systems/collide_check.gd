class_name CollisionCheck extends Node

@onready var parent : Area2D = get_parent()

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
		externalBody = body
		
	
func body_exit(body: Node):
	if body is Area2D or body is CharacterBody2D:
		body_exited.emit(body)
		externalBody = null
		
func scanCollision():
	for area in parent.get_overlapping_areas():
		if area not in scannedCollsions and area.get_node_or_null("Health") and area != parent:
			scannedCollsions.append(area)
	
	for body in parent.get_overlapping_bodies():
		if body not in scannedCollsions and body.get_node_or_null("Health") and body != parent:
			scannedCollsions.append(body)
	print(scannedCollsions)
