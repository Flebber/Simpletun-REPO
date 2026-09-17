extends Area2D

@export var collision_check : CollisionCheck
@export var pickup_component : PickupComponent

func _ready() -> void:
	
	pickup_component.collision_check = collision_check
	
	collision_check.setup()
	pickup_component.setup()
