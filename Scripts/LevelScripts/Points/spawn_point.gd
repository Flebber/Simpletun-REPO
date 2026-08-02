extends Area2D

# Assigns Components/Nodes
@export var collision_check: CollisionCheck
@export var point_manager: PointManager
@export var point: Area2D
@export var point_anim_player: AnimationPlayer

# Loads player.tscn and creates empty variable for player instance
var player : PackedScene = preload("res://Scenes/Characters/player.tscn")
var player_instance: Node = null

# Signals and Child Components' assignment/setup()
func _ready() -> void:
	point_manager.collision_check = collision_check
	point_manager.point = point
	point_manager.point_anim_player = point_anim_player
	
	point_manager.setup()
	collision_check.setup()

	GameManager.scene_swapped.connect(spawn_player)

# Spawns player when needed in valid scenes {Connected to GameManager.scene_swapped}
func spawn_player(scene):
	# Check if the selected scene is a Level (not a menu scene etc.)
	if scene in SceneManagerNode.levels.values():
		# Waits incase a funtion is midway through running
		await get_tree().process_frame
		
		# Checks if player is already instantiated in the scene and not deleted
		if player_instance != null and is_instance_valid(player_instance):
			return

		# Assigns player instance variable, Adds the instance too the tree
		player_instance = player.instantiate()
		get_tree().current_scene.add_child(player_instance)

		# If a checkpoint has been reached and level isnt finished, Spawn the player the checkpoint
		if GameManager.has_checkpoint == true and GameManager.is_level_finished == false:
			player_instance.global_position = GameManager.checkpointPos
			print("Spawned at checkpoint: ", GameManager.checkpointPos)
			GameManager.can_player_move = true
		else: # Spawn player at spawn_point
			player_instance.global_position = global_position 
			print("Spawned at default pos: ", point)
			GameManager.can_player_move = true
