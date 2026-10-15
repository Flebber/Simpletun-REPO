class_name Health extends Node

# Assigns Parent variable
@onready var parent = get_parent()

@export var health_label : HealthBar


# Modular Max Health Variable, Sets initial health state to == Max Health 
@export var max_health : float = 10
var current_health : float = max_health:
	set(value):
		current_health = clamp(value, 0, max_health)
		
		# If display_health option == true, display health when alive / "dead" when dead
		if display_health:
			if current_health == 0:
				health_label.value = 0000
				health_label.percentDisplay.text = "Dead"

			else:
				health_label.value = current_health
				health_label.percentDisplay.text = str((current_health / max_health * 100), "%")
		
		# Set Death flag and Death signal
		if current_health == 0 and !is_dead:
			is_dead = true
			died.emit()
			


# Death Flag
var is_dead : bool = false
signal died

# Parent Specific option to display current health
@export var display_health : bool = false


func _ready() -> void:
	died.connect(die_check)

	if parent is Player:
		GameManager.player_respawn.connect(playerResetHealthDead)
		GameManager.level_cancelled.connect(playerResetHealthDead)
	
	health_label.max_value = max_health
	health_label.value = current_health
	health_label.percentDisplay.text = str((current_health / max_health * 100), "%")
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
		#parent.add_child(health_label)
		pass
