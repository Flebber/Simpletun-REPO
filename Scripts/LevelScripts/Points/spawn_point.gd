extends Area2D

@export var collision_check: CollisionCheck
@export var point_manager: PointManager
@export var point: Area2D

var player : PackedScene = preload("res://Scenes/Characters/player.tscn")

@export var point_anim_player: AnimationPlayer


func _ready() -> void:
	point_manager.collision_check = collision_check
	point_manager.point = point
	point_manager.point_anim_player = point_anim_player
	
	point_manager.setup()
	collision_check.setup()
	
	#point_manager.point_reached.connect(spawn_point_reached)
	
	GameManager.scene_swapped.connect(spawn_player)

func spawn_player(scene):
	if scene in SceneManagerNode.levels.values():
		await get_tree().process_frame
		var player_instance = player.instantiate()
		
		
		get_tree().current_scene.add_child(player_instance)
		player_instance.position = position
	

#func spawn_point_reached(emitted_point):
	#if emitted_point == point:
		#print("spawn touched")
