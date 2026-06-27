class_name SceneMan extends Node

var playbutton : Button 

# Assign Levels To Variables
@onready var menu_scene : PackedScene = preload("res://Scenes/Levels/menu.tscn")
@onready var test_level : PackedScene = preload("res://Scenes/Levels/test_level.tscn")

func setup() -> void:
	if playbutton == null:
		print("no playbutton for scene_manager.gd")

	playbutton.pressed.connect(load_test_level)


func scene_select(scene):
	var tree = get_tree()
	tree.change_scene_to_packed(scene)

func load_test_level():
	scene_select(test_level)
