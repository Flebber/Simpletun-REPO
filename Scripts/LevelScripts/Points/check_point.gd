extends Area2D

# Component/Node Assignment
@export var collision_check: CollisionCheck
@export var point_manager: PointManager
@export var point: Area2D

@export var point_anim_player: AnimationPlayer
@export var point_animation_manager : PointAnimationManager

# Assigns player.tscn and Creates empty variable for player_instance
var player : PackedScene = preload("res://Scenes/Characters/player.tscn")
var player_instance: Node = null

# Signals and Component Assignment/Setup Functions
func _ready() -> void:
	point_manager.collision_check = collision_check
	point_manager.point = point
	point_manager.point_anim_player = point_anim_player
	
	point_animation_manager.point = point
	point_animation_manager.animation_player = point_anim_player
	point_animation_manager.point_manager = point_manager
	
	point_animation_manager.setup()
	point_manager.setup()
	collision_check.setup()
	
	point_manager.point_reached.connect(check_point_reached)
	

# Sets GameManager checkpoint flags/specific checkpoint position
func check_point_reached(emitted_point):
	GameManager.checkpointPos = point.global_position
	print("check pos = ", GameManager.checkpointPos)
	GameManager.has_checkpoint = true
	
