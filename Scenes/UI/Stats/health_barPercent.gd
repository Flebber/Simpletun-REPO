extends ProgressBar
class_name HealthBar

@export var percentDisplay : Label
var parent : Health

var display_health : bool
var currenthp : float
var maxhp : float

func setup() -> void:
	parent = get_parent().get_node_or_null("Health")
	parent.healthChanged.connect(show_health)

func show_health(currenthp, maxhp):
		# If display_health option == true, display health when alive / "dead" when dead
		if display_health:
			if currenthp == 0:
				value = 0000
				percentDisplay.text = "Dead"

			else:
				value = currenthp
				percentDisplay.text = str((currenthp / maxhp * 100), "% updated ahh")
