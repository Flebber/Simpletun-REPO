extends Button

func _ready() -> void:
	button_down.connect(return_pressed)

# Changes current scene to menu scene on press {Connected to button_down.connect}
func return_pressed() -> void:
	SceneManagerNode.scene_select(SceneManagerNode.menu_levels["Menu"])
