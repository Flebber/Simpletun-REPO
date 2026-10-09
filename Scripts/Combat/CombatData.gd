extends Resource
class_name CombatData

@export var atkType : ATK_TYPE
@export var atkSprite : Texture
@export var atkShape : ATK_SHAPE
@export var initialPos : Vector2

@export var test_int : int

@export var isPlayer : bool

enum ATK_TYPE {
	melee,
	ranged
}

enum ATK_SHAPE {
	circle,
	line,
	projectile,
	dome
}
