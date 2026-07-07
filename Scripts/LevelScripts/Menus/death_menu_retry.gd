extends Button



func _on_button_down() -> void:
	SceneManagerNode.scene_select(SceneManagerNode.previous_scene)
