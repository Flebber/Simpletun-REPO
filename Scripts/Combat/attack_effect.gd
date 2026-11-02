extends Node
class_name AttackEffect


var parent : AttackComponent


@export var effect: AnimatedSprite2D

# Empty effect resource and effect name for to be assigned externally (Modular)
var effectData : AttackEffectData
var effectName : String

var posdir : String 

func setup():
	# Assign when parent is ready for 0 errors
	parent = get_parent()
	# Assign the resource after parent has been defined
	effectData = parent.atkEffectData

	parent.atkEffectGo.connect(play_atk_effect)

# Find the desired effect and position then play it {Connected to attack_component.atkEffectGo}
func play_atk_effect(pos : Vector2, dir : Vector2):
	
	# Reset the posdir Each time signal fires
	posdir = ""
	# Assigns the effect name each time signal fires in case the desired particle changes
	effectName = effectData.effectName
	
	if dir.x == -1:
		posdir = "LEFT"
		effect.flip_h = true # Flip the particle so its identical when attack left (all particles are right-drawn)
	elif dir.x == 1:
		posdir = "RIGHT"
		effect.flip_h = false

	effect.position = pos
	effect.play(str(effectName, "_effect"))
