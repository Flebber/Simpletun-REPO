extends Area2D

@export var collision_check: CollisionCheck 
@export var damage : Damage 


func _ready() -> void:
	
	collision_check.setup()
	damage.setup()
	
	
