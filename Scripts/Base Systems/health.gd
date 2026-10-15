class_name Health extends Node

# Creates Empty Parent variable
var parent 

# Health Bar Scene/EmptyInstanceHolder
@onready var health_barScene : PackedScene = load("uid://jvllxpq4k6dd")
var health_bar : HealthBar

#Signal for health setter changing
signal healthChanged(currenthp : float, maxhp : float)

# Modular Max Health Variable
@export var max_health : float

# Internal health storage
var _current_health: float = 0.0

# Public health property
var current_health: float:
	get:
		return _current_health
	set(value):
		_current_health = clampf(value, 0.0, max_health)

		# Set Death flag and Death signal
		if _current_health == 0.0 and !is_dead:
			is_dead = true
			died.emit()

		# Notify listeners of health changes
		healthChanged.emit(_current_health, max_health)


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

	# Read the exported value at setup time
	_current_health = max_health

	# Create/Configure Healthbar
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

func health_show() -> void:
	if display_health:
		# Assign and create healthbar instance
		health_bar = health_barScene.instantiate()
		parent.add_child(health_bar)

		# Call health_bar setup only if display_health
		health_bar.setup()

		# Sets healthbar values and displays maxhealth % by default
		health_bar.max_value = max_health
		health_bar.value = _current_health
		health_bar.percentDisplay.text = str(current_health)
