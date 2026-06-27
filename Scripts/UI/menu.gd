class_name MainMenu extends Node

@export var playbutton : Button
@export var scene_manager : SceneMan

func _ready() -> void:
	scene_manager.playbutton = playbutton
	scene_manager.setup()
	
