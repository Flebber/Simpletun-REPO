extends Button



func _ready() -> void:
	button_down.connect(retry_pressed)


func retry_pressed() -> void:
	if SceneManagerNode.previous_scene == null:
		SceneManagerNode.scene_select(SceneManagerNode.current_scene)
	SceneManagerNode.scene_select(SceneManagerNode.previous_scene)
	
