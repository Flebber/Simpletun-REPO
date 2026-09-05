extends Button

func _ready() -> void:
	button_down.connect(continue_pressed)
	
# Loads the next level.tscn on press {Connected to button_down}
func continue_pressed(): 
	print("CONTINUE Pressed")
	
