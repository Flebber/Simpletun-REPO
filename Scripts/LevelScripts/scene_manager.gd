class_name SceneManager extends Node

# Assign Levels To Dicitonary Variables
var levels : Dictionary[String, PackedScene] = {
	"Level 1 (Tutorial)": load("res://Scenes/Levels/tutorial.tscn"),
}

var test_levels : Dictionary[String, PackedScene] = {
	"Level 0 (menu)": load("res://Scenes/Levels/menu.tscn"),
	"Level -1 (test)":  load("res://Scenes/Levels/test_level.tscn"),
}

func scene_select(scene : PackedScene):
	await get_tree().process_frame
	get_tree().change_scene_to_packed(scene)
	
