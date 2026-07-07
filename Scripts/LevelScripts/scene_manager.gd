class_name SceneManager extends Node

# Assign Levels To Dicitonary Variables
var levels : Dictionary[String, PackedScene] = {
	"Level 1 (Tutorial)": load("res://Scenes/Levels/tutorial.tscn"),
}

var menu_levels : Dictionary[String, PackedScene] = {
	"Menu": load("res://Scenes/Levels/menu.tscn"),
	"Death Menu": load("res://Scenes/Levels/death_menu.tscn"),
	"Test":  load("res://Scenes/Levels/test_level.tscn"),
}

func scene_select(scene : PackedScene):
	await get_tree().process_frame
	get_tree().change_scene_to_packed(scene)
	
