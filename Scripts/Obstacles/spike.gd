extends Area2D

# Assign Components
@export var collision_check: CollisionCheck
@export var damage : Damage

# Components' Setup()
func _ready() -> void:
	
	collision_check.setup()
	damage.setup()
