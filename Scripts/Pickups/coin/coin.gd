extends Area2D
class_name Coin


@export var collision_check: CollisionCheck
@export var sprite_2d: Sprite2D
@export var animation_player: AnimationPlayer
@export var pickup_component: PickupComponent

@onready var pickupData


# Signals and Failsafes
func _ready() -> void:
	pickup_component.collision_check = collision_check
	pickupData = pickup_component.pickupData
	
	collision_check.setup()
	pickup_component.setup()
	pickup_component.parentPickupName.connect(iscoin)

func iscoin(pickupName : String):
	if pickupName == "coin":
		InventoryManager.coin_count += 1
		InventoryManager.coin_collected.emit()
		print("CoinCount: ", InventoryManager.coin_count)
