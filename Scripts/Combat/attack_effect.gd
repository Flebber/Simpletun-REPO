extends Node
class_name AttackEffect


var parent : AttackComponent

@export var effect: AnimatedSprite2D
@export var effectData : AttackEffectData


func setup():
	# Assign when parent is ready for 0 errors
	parent = get_parent()
	
	effect.sprite_frames = effectData.effectSpriteSheet
	
