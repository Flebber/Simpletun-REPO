extends Button


func _ready() -> void:
	button_down.connect(retry_pressed)

# When pressed, Reload the last scene loaded, If there is no previous scene, load the current scene too mitigate load bug {Connected to button_down.connect}
func retry_pressed() -> void:
	SceneManagerNode.scene_select(SceneManagerNode.current_scene)
	
