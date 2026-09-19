extends CanvasLayer

var ui_controller: Control

@export var coin_display: Label

func setup():
	
	InventoryManager.coin_collected.connect(coinCounter)
	
func coinCounter():
	coin_display.text = str("COINS: ", InventoryManager.coin_count)
