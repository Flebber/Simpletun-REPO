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
		
		poster.z_index = 2
		animation_player.play("Poster/ZoomIn")
		zoomed = true
	else:
		poster.z_index = 0
		animation_player.play("Poster/ZoomOut")
		zoomed = false
