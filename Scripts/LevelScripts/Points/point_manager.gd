class_name PointManager extends Node2D

# Create Empty Component Variables for Parent to assign
var collision_check: CollisionCheck
var point: Area2D
var point_anim_player: AnimationPlayer

# Empty previous_point tracker
var previous_point : Area2D = null

# Creates Signal that returns emitted_point
signal point_reached(emitted_point)
# bool flag if point has been reached (For Animation Purposes)
var is_point_reached : bool = false


# Signals/Failsafes
func setup():
	if collision_check == null:
		print("No collision_check for point_manager = ", str(point))
		return
		
	if point == null:
		print("No point for point_manager", str(point))
		return
		
	if point_anim_player == null:
		print("No point_anim_player for point_manager", str(point))
		return
	
	collision_check.collided.connect(point_touched)

# When parent point is touched, emit point_reached signal and track the last point touched {Connected to collision_check.collided}
func point_touched(_body):
	point_reached.emit(point)
	previous_point = point
	is_point_reached = true
