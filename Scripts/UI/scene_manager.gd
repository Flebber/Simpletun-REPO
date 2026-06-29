class_name SceneManager extends Node

# Assign Levels To Dicitonary Variables
var levels : Dictionary[String, PackedScene] = {
	"Level 0 (menu)": load("res://Scenes/Levels/menu.tscn"),
	"Level 1 (test)":  load("res://Scenes/Levels/test_level.tscn"),
	"Level 2 (Baba Dictionary)": load("res://Scenes/Levels/test_level.tscn"),
	"Level 3 (Baba Jumps)": load("res://Scenes/Levels/test_level.tscn"),
}

func scene_select(scene : PackedScene):
	await get_tree().process_frame
	get_tree().change_scene_to_packed(scene)
	
