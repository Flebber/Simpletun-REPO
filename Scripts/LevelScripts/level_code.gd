extends TextEdit

func _process(delta: float) -> void:
	if text == "test":
		SceneManagerNode.scene_select(SceneManagerNode.menu_levels["Test"])
