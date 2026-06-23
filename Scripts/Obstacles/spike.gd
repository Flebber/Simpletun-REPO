extends Area2D

@onready var collision_check: CollisionCheck = %CollisionCheck
@onready var damage : Damage = %Damage


func _ready() -> void:
	
	collision_check.setup()
	damage.setup()
	
	
