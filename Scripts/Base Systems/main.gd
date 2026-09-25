class_name Main extends Node

func _ready() -> void:
	GameManager.level_cancelled.connect(reset_level_data)
	GameManager.player_respawn.connect(resetPlayerOnRespawn)
	

func reset_level_data():
	GameManager.has_checkpoint = falseyyyyyyy
	
	InventoryManager.reset_count()
	
func resetPlayerOnRespawn():
	GameManager.is_player_dead = false
	GameManager.can_player_move = true
	
	GameManager.playerScene.health.current_health = GameManager.playerScene.health.max_health
