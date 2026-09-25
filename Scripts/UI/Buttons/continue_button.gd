extends Button

func _ready() -> void:
	button_down.connect(continue_pressed)
	
# Loads the next level.tscn on press {Connected to button_down}
func continue_pressed(): 
	print("CONTINUE Pressed")
	SceneManagerNode.scene_select(SceneManagerNode.levels[(SceneManagerNode.current_index) + 1])
	
	SceneManagerNode.current_index += 1
	GameManager.level_cancelled.emit()
