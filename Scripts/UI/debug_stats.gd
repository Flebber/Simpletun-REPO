extends Control

@export var stats: Label
@export var movement: Movement
@export var health: Health
@export var glide_check: RayCast2D

func _physics_process(delta: float) -> void:
	var hascheckp : bool = GameManager.has_checkpoint
	var checkpos : Vector2 = GameManager.checkpointPos
	var p_health : int = health.current_health
	var speed : float = movement.speed
	var gcheck : bool = glide_check.is_colliding()
	stats.text = str(
		"Checkpoint: (, pos)
		health: 
		speed:
		glide_check: "
	)
