extends Area2D

@export var collision_check: CollisionCheck
@export var point_manager: PointManager
@export var point: Area2D


@export var point_anim_player: AnimationPlayer


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
		SceneManagerNode.scene_select(SceneManagerNode.menu_levels["Menu"])
