extends Area2D

@export var collision_check: CollisionCheck
@export var point_manager: PointManager
@export var point: Area2D

var player : PackedScene = preload("res://Scenes/Characters/player.tscn")
var player_instance: Node = null

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
		
		if player_instance != null and is_instance_valid(player_instance):
			return

		player_instance = player.instantiate()
		get_tree().current_scene.add_child(player_instance)
		print("PointManager checkpoint on respawn:", GameManager.checkpointPos)
		
		if GameManager.has_checkpoint == true and GameManager.is_level_finished == false:
			player_instance.global_position = GameManager.checkpointPos
			print("Spawned at checkpoint: ", GameManager.checkpointPos)
		else:
			player_instance.global_position = global_position
			print("Spawned at default pos: ", point)

#func spawn_point_reached(emitted_point):
	#if emitted_point == point:
		#print("spawn touched")
