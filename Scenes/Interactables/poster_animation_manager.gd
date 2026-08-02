extends Node

# Assign Components
var animation_player : AnimationPlayer
var interact_component : InteractComponent
var poster : Sprite2D

var zoomed : bool = false

# Signals and Failsafes
func setup() -> void:
	if animation_player == null:
		print("No animation player for poster")
		return
	if interact_component == null:
		print("No interact component for poster")
		return
	
	interact_component.interact_pressed.connect(zoomIn)


# Connected to {interact_component.interact_pressed}
func zoomIn():
	if zoomed == false:
		GameManager.can_player_move = false
		poster.z_index = 2
		animation_player.play("Poster/ZoomIn")
		zoomed = true
		
	else:
		
		poster.z_index = 0
		animation_player.play("Poster/ZoomOut")
		zoomed = false
		await get_tree().create_timer(0.25).timeout
		GameManager.can_player_move = true
