class_name Health extends Node

@onready var player : Player = get_parent()
@onready var parent = get_parent()

# Modular Max Health Variable, Sets initial health state to == Max Health 
@export var max_health : float = 10
var current_health : float = max_health

# Death Flag/Signal
var is_dead : bool = false

# Modular option to display current health
@export var display_health : bool = false

func _physics_process(delta: float) -> void:
	# Display Current health if !dead and display_health == true
	if !is_dead and display_health:
		parent.label.text = str(current_health)
	# If display_health == true and is_dead display dead
	elif is_dead and display_health:
		parent.label.text = "Dead"
		
	die_check()
	

# Check if Current health is <=0
func die_check():
# Player Die_Check
	if current_health <= 0 and !is_dead and player == Player:
		#Death Flag
		is_dead = true
		GameManager.player_dead.emit()

# Entity Die_check
	if current_health <= 0 and !is_dead and parent != Player:
		#Death Flag
		is_dead = true
		GameManager.player_dead.emit()

# Heal the body that calls this function
func heal(amount):
	current_health += amount 
