extends ProgressBar
class_name HealthBar

# Assign Components
@export var percentDisplay : Label
var parent : Health


func setup() -> void:
	# Sets "parent" var to the real parents health_node
	# (because this is instantiated under the health compoennts parent to make the bar follow position/scale)
	parent = get_parent().get_node_or_null("Health")
	
	# Connect health's setter signal to showhealth to display the health when it changes
	parent.healthChanged.connect(show_health)

# Displays health info as a % and if dead {Connected to health.healthChanged}
func show_health(currenthp, maxhp):
	if currenthp == 0:
		value = 0000
		percentDisplay.text = "Dead"

	else:
		value = currenthp
		# Multiples by 1000 not 100 due to output being 5.0% not 50% etc otherwise 
		percentDisplay.text = str(roundf((currenthp / maxhp * 1000)), "%")
