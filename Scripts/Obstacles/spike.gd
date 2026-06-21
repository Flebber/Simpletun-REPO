extends Area2D

@onready var collision_check : CollisionCheck = %CollisionCheck
@onready var damage : Damage = %Damage
@onready var sprite : Node =  %Sprite2D

func _ready() -> void:
	damage.setup()
	collision_check.setup()
	
	damage.collision_check = collision_check
	
