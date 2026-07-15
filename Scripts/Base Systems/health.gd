class_name Health extends Node

# Assigns Parent variable
@onready var parent = get_parent()

# Modular Max Health Variable, Sets initial health state to == Max Health 
@export var max_health : float = 10
var current_health : float = max_health:
	set(value):
		current_health = clamp(value, 0, max_health)
		
		# If display_health option == true, display health when alive / "dead" when dead
		if display_health:
			if current_health == 0:
				parent.label.text = "dead"
			else:
				parent.label.text = str(current_health)
		
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

# Check if Current health is <=0
func die_check():
# Player death signal
	if parent is Player:
		GameManager.player_dead.emit()

# Heal the body that calls this function
func heal(amount):
	current_health += amount 
