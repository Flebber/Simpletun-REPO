class_name SceneManager extends Node

# Assign Levels To Dicitonary Variables
var levels : Dictionary[String, PackedScene] = {
	"Level 0 (menu)": preload("res://Scenes/Levels/menu.tscn"),
	"Level 1 (test)":  preload("res://Scenes/Levels/test_level.tscn"),
	"Level 2 (Baba Dictionary)": preload("res://Scenes/Levels/test_level.tscn"),
	"Level 3 (Baba Jumps)": preload("res://Scenes/Levels/test_level.tscn"),
}

func scene_select(scene : PackedScene):
	await get_tree().process_frame
	get_tree().change_scene_to_packed(scene)
	
