extends Node

# Level/Scene Signals/Flags
signal level_finished
var is_level_finished : bool = false
signal scene_swapped(scene : PackedScene)


# Player Signals/Flags
signal player_dead
var can_player_move : bool = true

# Point Signals/Flags
var checkpointPos : Vector2 = Vector2.ZERO
var has_checkpoint : bool = false 
