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

signal playerRespawn()


# Signals and Component Assignment/Setup Functions
func _ready() -> void:
	point_manager.collision_check = collision_check
	point_manager.point = point
	point_manager.point_anim_player = point_anim_player
	
	point_animation_manager.point = point
	point_animation_manager.animation_player = point_anim_player
	point_animation_manager.point_manager = point_manager
	
	point_animation_manager.point_name = "CheckPoint"
	
	point_animation_manager.setup()
	point_manager.setup()
	collision_check.setup()
	
	point_manager.point_reached.connect(check_point_reached)
	GameManager.player_dead.connect(spawnAtCheckpoint)
	

# Sets GameManager checkpoint flags/specific checkpoint position {Connected point_manager.point_reached}
func check_point_reached(_emitted_point):
	GameManager.checkpointPos = point.global_position
	print("check pos = ", GameManager.checkpointPos, "player pos: ", GameManager.playerScene.global_position)
	GameManager.has_checkpoint = true

func spawnAtCheckpoint():
	# If a checkpoint has been reached and level isnt finished, Spawn the player the checkpoint
	if GameManager.has_checkpoint == true and GameManager.is_level_finished == false:
		await get_tree().create_timer(4).timeout
		GameManager.playerScene.global_position = GameManager.checkpointPos - Vector2(0, 100)
		playerRespawn.emit()
		print("Spawned at checkpoint: ", GameManager.checkpointPos)
		GameManager.can_player_move = true
		GameManager.is_player_dead = false
		
