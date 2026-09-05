extends ItemList

# Empty dictionary to utilize the Dictionary class
var level_dict : Dictionary = {}

const SMILE_LAPTOP : Texture2D = preload("uid://ch3otg2fuhhof")

func _ready() -> void:
	# Assign the level dictionary in SceneManagerNode to the local empty dictionary
	level_dict = SceneManagerNode.levels
	
	# Call the level generate function @onready 
	generate_level_buttons()

# Create a unique button with a name and image for each level
func generate_level_buttons():
	for level in level_dict:
		add_item(level, SMILE_LAPTOP, true)
		sort_items_by_text()

# Load the level the user selects
func _on_item_clicked(index, _at_position: Vector2, _mouse_button_index: int) -> void:
	# Assigns the name : string of the pressed level to the key variable
	var key = level_dict.keys()[index]
	# Loads the PackedScene assigned to the specified key in the SceneManagerNode singleton
	SceneManagerNode.scene_select(level_dict[key])
	print(key)
