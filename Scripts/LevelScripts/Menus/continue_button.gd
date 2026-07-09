extends Button

func _ready() -> void:
	button_down.connect(continue_pressed)
	
func continue_pressed():
	print("CONTINUE Pressed")
	#print(SceneManagerNode.scene_select(SceneManagerNode.levels[]))
