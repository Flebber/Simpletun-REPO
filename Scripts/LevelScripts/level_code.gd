extends TextEdit

func _process(_delta: float) -> void:
	if text == "test":
		SceneManagerNode.scene_select(SceneManagerNode.menu_levels["Test"])
