class_name Main extends Node

func _ready() -> void:
	if GameManager.is_cancel_connect == false:
		GameManager.level_cancelled.connect(InventoryManager.reset_count)
		GameManager.is_cancel_connect = true
	pass
	
