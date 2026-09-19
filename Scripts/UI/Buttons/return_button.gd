extends Button

func _ready() -> void:
	button_down.connect(return_pressed)

# Changes current scene to menu scene on press {Connected to button_down.connect}
func return_pressed() -> void:
	SceneManagerNode.scene_select(SceneManagerNode.menu_levels["Menu"])
	GameManager.has_checkpoint = false
	GameManager.level_cancelled.emit()
