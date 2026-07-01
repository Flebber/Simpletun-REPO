extends Button

# Loads the menu no matter the current scene
func _on_button_down() -> void:
	SceneManagerNode.scene_select(SceneManagerNode.test_levels["Level 0 (menu)"])
