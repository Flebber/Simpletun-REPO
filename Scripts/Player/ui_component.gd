extends Control

var pausemen_instance = GameManager.pause_menu.instantiate()
var pauseOn : bool = false

var status_ui: CanvasLayer

func setup() -> void:
	GameManager.player_dead.connect(death_menu_on)

# Loads a death_menu instance (2) seconds after player dies {Connected to GameManager.player_dead}
func death_menu_on():
	if GameManager.has_checkpoint == false:
		await get_tree().create_timer(2).timeout
	
		var deathmen_instance = GameManager.death_menu.instantiate()
		add_child(deathmen_instance)

# Pause Menu
func _input(event):
	if event.is_action_pressed("pause"):
		if pauseOn == false:
			GameManager.can_player_move = false
			add_child(pausemen_instance)
			pauseOn = true
		else:
			GameManager.can_player_move = true
			remove_child(pausemen_instance)
			pauseOn = false
