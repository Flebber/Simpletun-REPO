extends Node

# Level/Scene Signals/Flags
@warning_ignore("unused_signal")
signal level_finished
var is_level_finished : bool = false
@warning_ignore("unused_signal")
signal scene_swapped(scene : PackedScene)


# Player Signals/Flags
@warning_ignore("unused_signal")
signal player_dead
var can_player_move : bool = true

# Point Signals/Flags
var checkpointPos : Vector2 = Vector2.ZERO
var has_checkpoint : bool = false 


# Menus Signals/Flags
var death_menu : PackedScene = SceneManagerNode.menu_levels["Death Menu"]
var pause_menu : PackedScene = SceneManagerNode.menu_levels["Pause Menu"]
