extends Area2D


@export var collision_check: CollisionCheck
@export var sprite_2d: Sprite2D
@export var animation_player: AnimationPlayer
@export var pickup_component: PickupComponent


# Signals and Failsafes
func _ready() -> void:
	pickup_component.collision_check = collision_check
	
	collision_check.setup()
	pickup_component.setup()
	#pickup_component.parentPickupName.connect(iscoin)
#
#func iscoin(pickupName : String):
	#if pickupName == "coin":
		#InventoryManager.coin_count += 1
		#print("CoinCount: ", InventoryManager.coin_count)
