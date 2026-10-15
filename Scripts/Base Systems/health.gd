class_name Health extends Node

# Assigns Parent variable
var parent 

# Health Bar
@onready var health_labelScene : PackedScene = load("uid://jvllxpq4k6dd")
var health_label : HealthBar

signal healthChanged(currenthp : float, maxhp : float)

# Modular Max Health Variable, Sets initial health state to == Max Health 
@export var max_health : float = 10
var current_health : float = max_health:
	set(value):
		current_health = clamp(value, 0, max_health)
		# Set Death flag and Death signal
		if current_health == 0 and !is_dead:
			is_dead = true
			died.emit()
		healthChanged.emit(current_health, max_health)


# Death Flag
var is_dead : bool = false
signal died

# Parent Specific option to display current health
@export var display_health : bool = false


func setup() -> void:
	parent = get_parent()
	died.connect(die_check)

	if parent is Player:
		GameManager.player_respawn.connect(playerResetHealthDead)
		GameManager.level_cancelled.connect(playerResetHealthDead)
	
	health_show()
# Check if Current health is <=0
func die_check():
# Player death signal
	if parent is Player:
		GameManager.player_dead.emit()

# Reset health.is_dead for player {connected to GameManager.player_respawn and GameManager.level_cancelled}
func playerResetHealthDead():
	if parent is Player:
		is_dead = false

# Heal the body that calls this function
func heal(amount):
	current_health += amount 

func health_show():
	if display_health == true:
		health_label = health_labelScene.instantiate()
		parent.add_child(health_label)
		health_label.setup()
		health_label.display_health = true
		
		health_label.max_value = max_health
		health_label.value = current_health
		health_label.percentDisplay.text = str((current_health / max_health * 100), "%")
	return
