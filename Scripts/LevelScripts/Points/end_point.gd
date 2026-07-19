extends Area2D

# Component/Node Assignment
@export var collision_check: CollisionCheck

@export var point_manager: PointManager
@export var point: Area2D
@export var point_anim_player: AnimationPlayer
@export var point_animation_manager : PointAnimationManager

# Assigns the finish_menu UI scene from the SceneManagerNode.menu_levels dicitonary
@onready var finish_menu : PackedScene = SceneManagerNode.menu_levels["Finish Menu"]

# End_point reached flag
var finish_reached : bool = false

# Signal Connects and Child Component Assignments
func _ready() -> void:
	point_manager.collision_check = collision_check
	point_manager.point = point
	point_manager.point_anim_player = point_anim_player
	
	point_animation_manager.point = point
	point_animation_manager.animation_player = point_anim_player
	point_animation_manager.point_manager = point_manager
	
	point_animation_manager.point_name = "EndPoint"
	
	point_animation_manager.setup()
	
	point_manager.setup()
	collision_check.setup()
	
	point_manager.point_reached.connect(end_point_reached)

# Set Gamemanager level finished signals/flags and display finish menu {Connected point_manager.point_reached}
func end_point_reached(emitted_point):
	# If the emitted point from point_manager == the parent point
	if emitted_point == point:
		print("end touched")
	
	GameManager.level_finished.emit()
	GameManager.is_level_finished = true
	
	await get_tree().create_timer(2).timeout
	var finmen_instance = finish_menu.instantiate()
	add_child(finmen_instance)
