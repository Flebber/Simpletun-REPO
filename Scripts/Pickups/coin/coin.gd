extends Area2D
class_name Coin

@export var pickup_data : PickupData
@export var collision_check: CollisionCheck
@export var sprite_2d: Sprite2D
@export var animation_player: AnimationPlayer


func _ready() -> void:
	collision_check.setup()
	
