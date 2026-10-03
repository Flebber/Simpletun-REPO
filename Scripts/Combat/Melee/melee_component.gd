extends Area2D

@export var colllision_check : CollisionCheck
@export var damage: Damage
@export var attack_component: AttackComponent

@export var animation_player: AnimationPlayer
@export var collision_shape_2d: CollisionShape2D

func _ready() -> void:
	attack_component.collision_check = colllision_check
	
	colllision_check.setup() 
	damage.setup() 
	attack_component.setup() 

func _input(event: InputEvent) -> void:
	pass
