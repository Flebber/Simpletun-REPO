class_name Main extends Node

func _ready() -> void:
	GameManager.level_cancelled.connect(reset_level_data)
	
	if GameManager.is_cancel_connect == false:
		GameManager.level_cancelled.connect(InventoryManager.reset_count)
		GameManager.is_cancel_connect = true
	pass

func reset_level_data():
	GameManager.has_checkpoint = false
