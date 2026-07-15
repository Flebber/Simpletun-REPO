extends Node

signal level_finished
signal scene_swapped(scene : PackedScene)

signal player_dead


var checkpointPos : Vector2 = Vector2.ZERO
var has_checkpoint : bool = false 

var is_level_finished : bool = false
