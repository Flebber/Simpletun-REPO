class_name PointManager extends Node2D

var collision_check: CollisionCheck
var point: Area2D

var point_anim_player: AnimationPlayer

signal point_reached(emitted_point)

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
	

# When a flag gets touched = save data of player touching, play flag anamation, 

func point_touched(_body):
	#print(body, " touched ", point)
	#point_reached.emit(point)
	pass
