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
	
	point_manager.point_reached.connect(check_point_reached)
	
	#GameManager.scene_swapped.connect(spawn_player)

func check_point_reached(emitted_point):
	print("check_point reached", emitted_point)
	GameManager.checkpointPos = point.global_position
	GameManager.has_checkpoint = true
	print("chechpointpos = ", GameManager.checkpointPos)
