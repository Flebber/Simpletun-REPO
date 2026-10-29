extends Node
class_name AttackEffect


var parent : AttackComponent

@export var effect: AnimatedSprite2D
var effectData : AttackEffectData


func setup():
	# Assign when parent is ready for 0 errors
	parent = get_parent()
	effectData = parent.atkEffectData
	
	print(effectData)
	#effect.sprite_frames = effectData.effectSpriteSheet
	parent.atkEffectGo.connect(play_atk_effect)


func play_atk_effect(pos):
	print("effect started at " ,pos)
	effect.position = pos
	effect.play("slap_effect")
