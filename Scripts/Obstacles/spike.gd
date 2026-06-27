extends Area2D

# Assign Components
@export var collision_check: CollisionCheck
@export var damage : Damage


func _ready() -> void:
	# Call component.setup() when player is ready (Minimizes Component/Signal Assignment Errors)
	collision_check.setup()
	damage.setup()
