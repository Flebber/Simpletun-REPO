extends Area2D

@export var collision_check: CollisionCheck
@export var point_manager: PointManager
@export var point: Area2D

@export var point_anim_player: AnimationPlayer

@onready var finish_menu : PackedScene = SceneManagerNode.menu_levels["Finish Menu"]

var finish_reached : bool = false

func _ready() -> void:
	point_manager.collision_check = collision_check
	point_manager.point = point
	point_manager.point_anim_player = point_anim_player
	
	point_manager.setup()
	collision_check.setup()
	
	point_manager.point_reached.connect(end_point_reached)

func end_point_reached(emitted_point):
	if emitted_point == point:
		print("end touched")
	
	GameManager.level_finished.emit()
	
	var finmen_instance = finish_menu.instantiate()
	add_child(finmen_instance)
