extends Control

@export var stats: Label
@export var movement: Movement
@export var health: Health
@export var glide_check: RayCast2D
@export var player: Player

func _physics_process(delta: float) -> void:
	var hascheckp : bool = GameManager.has_checkpoint
	var checkpos : Vector2 = GameManager.checkpointPos
	var p_health : float = health.current_health
	var speed : Vector2 = player.velocity
	var gcheck : bool = !glide_check.is_colliding()
	var gmpdead : bool = GameManager.is_player_dead
	stats.text = str(
		"Checkpoint: ({hascheckp}, {checkpos})
		health: {health} 
		velocity: {speed}
		can_glide: {gcheck}
		GM_pdead: {gmpdead}"
	).format({"hascheckp": hascheckp, "checkpos": checkpos, "health": p_health, "speed": speed, "gcheck": gcheck, "gmpdead": gmpdead})
