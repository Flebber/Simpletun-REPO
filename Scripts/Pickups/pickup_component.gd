extends Node
class_name PickupComponent

@export var pickupData : PickupData

var collision_check : CollisionCheck

var parent : Area2D
signal parentPickupName(parent : String)


func setup() -> void:
	parent = get_parent()
	collision_check.collided.connect(pickupActivate)
	

# Called when parent gets collided with {Connected to collision_check.collided}
func pickupActivate(body):
	var pickupName = pickupData.pickup_name
	
	if body == GameManager.playerScene:
		print(GameManager.playerScene, " Collided With ", parent, "PickupDataName: ", pickupData.pickup_name)
		parentPickupName.emit(pickupName)
		await get_tree().process_frame 
		parent.queue_free()
	else:
		print("Not Player")
