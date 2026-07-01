extends TextEdit

func _process(delta: float) -> void:
	if text == "test":
		SceneManagerNode.scene_select(SceneManagerNode.test_levels["Level -1 (test)"])
