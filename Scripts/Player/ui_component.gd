extends Control



func _ready() -> void:
	GameManager.player_dead.connect(death_menu_on)

# Loads a death_menu instance (2) seconds after player dies {Connected to GameManager.player_dead}
func death_menu_on():
	await get_tree().create_timer(2).timeout
	
	var deathmen_instance = GameManager.death_menu.instantiate()
	add_child(deathmen_instance)

func pause_menu_on():
	pass
