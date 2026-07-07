class_name PointManager extends Node2D

@export var collision_check: CollisionCheck
@export var point: Area2D

func setup():
	if collision_check == null:
		print("No collision_check for point_manager")
		return
	collision_check.collided.connect(point_touched)
	

# When a flag gets touched = save data of player touching, play flag anamation, 

func point_touched():
	pass
