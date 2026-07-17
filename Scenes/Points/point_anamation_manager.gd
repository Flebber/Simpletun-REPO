class_name PointAnimationManager extends Node

# Assign parent/empty parent name
var point : Area2D = get_parent()
var point_name : String = ""

# Assign Components
var animation_player : AnimationPlayer
var point_manager : PointManager

# Signals and Failsafes
func setup() -> void:
	if animation_player == null:
		print("No animation player for ", point)
		return
	if point == null:
		print("No point for PointAnimationManager")
		return
	
	# Assign point_name when point is ready
	point_name = str(get_parent().name)
	
	point_manager.point_reached.connect(rise_point)

# Play point/rising animation on collision, Only if point hasnt been reached before {Connected to point_manager.point_reached}
func rise_point(_point):
	if point_manager.is_point_reached == false:
		animation_player.play("%s/rising" % point_name)
