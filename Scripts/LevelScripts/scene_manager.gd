class_name SceneManager extends Node

var previous_scene : PackedScene
var current_scene : PackedScene


# Assign Levels To Dicitonary Variables
var levels : Dictionary[String, PackedScene] = {
	"Level 1 (Tutorial)": load("res://Scenes/Levels/tutorial.tscn"),
}

# Assign Menu levels to seperate dicitonary
var menu_levels : Dictionary[String, PackedScene] = {
	"Test":  load("res://Scenes/Levels/test_level.tscn"),
	"Menu": load("res://Scenes/Levels/Menus/menu.tscn"),
	"Death Menu": load("res://Scenes/Levels/Menus/death_menu.tscn"),
	"Finish Menu": load("res://Scenes/Levels/Menus/finish_menu.tscn"),
}

# Global function to change current scene to the specified (scene), Also tracks last/current scene
func scene_select(scene : PackedScene):
	previous_scene = current_scene
	current_scene = scene
	
	
	
	await get_tree().process_frame 
	get_tree().change_scene_to_packed(scene)
	
	print("previous = %s current = %s" % [previous_scene, current_scene])
