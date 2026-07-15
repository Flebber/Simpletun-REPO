extends Button


func _ready() -> void:
	button_down.connect(retry_pressed)

# When pressed, Change reload the last scene loaded, If there is no previous scene, load the current scene too mitigate load bug {Connected to button_down.connect}
func retry_pressed() -> void:
	if SceneManagerNode.previous_scene == null:
		SceneManagerNode.scene_select(SceneManagerNode.current_scene)
	SceneManagerNode.scene_select(SceneManagerNode.previous_scene)
	
