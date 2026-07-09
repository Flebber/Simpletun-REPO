extends Button

func _ready() -> void:
	button_down.connect(return_pressed)

func return_pressed() -> void:
	SceneManagerNode.scene_select(SceneManagerNode.menu_levels["Menu"])
